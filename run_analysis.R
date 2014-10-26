# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(reshape2)
# Set working directory
# setwd("~/coursera-cleaning-data/UCI HAR Dataset")

# Data set obtained from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

activity_labels <- read.table("activity_labels.txt", sep=" ", header=FALSE, col.names=c("activity_id", "activity"))
features <- read.table("features.txt", sep=" ", header=FALSE, col.names=c("feature_id", "feature_name"))

test_activity <- read.table("test/y_test.txt", header=FALSE, col.names=c("activity_id"))
train_activity <- read.table("train/y_train.txt", header=FALSE, col.names=c("activity_id"))
# Combine test activities with training actvities
combined_activity  <- rbind(test_activity, train_activity)

# Add row IDs to make merging easier
nrows <- nrow(combined_activity)
combined_activity$rowkey <- 1:nrows

# Add approriate label for activity ID
combined_activity <- merge(combined_activity, activity_labels, by="activity_id", all=TRUE, sort=FALSE)

test_subject <- read.table("test/subject_test.txt", header=FALSE, col.names=c("subject_id"))
train_subject <- read.table("train/subject_train.txt", header=FALSE, col.names=c("subject_id"))
# Combine test subjects with training subjects
combined_subject  <- rbind(test_subject, train_subject)

# Add row IDs to make merging easier
combined_subject$rowkey <- 1:nrows
combined_activity <- merge(combined_activity, combined_subject, by="rowkey", all=TRUE)

# Sensor data is in fixed width format with a length of 16
# Sensor data columns correspond with feature dataset rows
nfeaturecols <- nrow(features)
test_data <- read.fwf("test/X_test.txt", widths = rep(16, times=nfeaturecols), header = FALSE, 
                      col.names = features$feature_name, strip.white = TRUE, 
                      colClasses=c(rep("numeric", times=nfeaturecols)))
train_data <- read.fwf("train/X_train.txt", widths = rep(16, times=nfeaturecols), header = FALSE, 
                       col.names = features$feature_name, strip.white = TRUE,
                       colClasses=c(rep("numeric", times=nfeaturecols)))
combined_data <- rbind(test_data, train_data)

# Remove all columns which are not either standard deviation or mean measurements
combined_data <- combined_data[, grep("\\-(std|mean)\\(", features$feature_name, perl=TRUE)]

# Convert names to something more meaningful
all_names <- tolower(names(combined_data))
all_names <- gsub("std", " standard deviation ", all_names, perl=TRUE)
all_names <- gsub("^f", "frequency ", all_names, perl=TRUE)
all_names <- gsub("^t", "time ", all_names, perl=TRUE)
all_names <- gsub("body", " body ", all_names, perl=TRUE)
all_names <- gsub("acc", " accelerometer ", all_names, perl=TRUE)
all_names <- gsub("gyro", " gyroscope ", all_names, perl=TRUE)
all_names <- gsub("mag", " magnitude ", all_names, perl=TRUE)
# Ensure we strip out anything other than alphanumerics
all_names <- gsub("[^a-z0-9]", " ",  all_names, perl=TRUE)
# Trim any leading or trailing spaces
all_names <- gsub("^\\s+|\\s+$", "", all_names, perl=TRUE)
# Ensure that we don't have any multiple spaces
all_names <- gsub("\\s{2,}", " ", all_names, perl=TRUE)
names(combined_data) <- all_names

# Add row IDs to make merging easier
combined_data$rowkey <- 1:nrows
combined_data <- merge(combined_activity, combined_data, by="rowkey", all=TRUE)

# Drop ID columns we no longer need
combined_data$rowkey <- NULL
combined_data$activity_id <- NULL

# Melt data for easier grouping
combined_data_melted <- melt(combined_data, id.vars=c("activity", "subject_id"))
# Create our tidy data set based upon mean of data for subject and activity
combined_data_mean <- dcast(combined_data_melted, activity + subject_id ~ variable, mean)
write.table(combined_data_mean, file="tidy-combined-gyro-data.txt", row.names=FALSE, col.names=TRUE)
