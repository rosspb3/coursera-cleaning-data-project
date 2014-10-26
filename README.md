
The orignal data set was obtained from
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

`run_analysis.R` will produce a `tidy_combined_gyro_data.txt` file with the following output:

**activity** which is a label based upon the data in `activity_labels.txt`
and is one of the following 
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

**subject_id** which is based upon the combined values of `test/subject_test.txt` and `train/subject_train.txt`

The remaining columns are activity / subject averages using a subset of the mean and standard deviations of the gyroscopic and accelerometer data.
The original feature names have been modifed as follows:

+ Columns prefixed with 't' start with 'time'.
+ Columns prefixed with 'f' start with 'frequency'.
+ Columns containing 'Acc' were converted to 'accelerometer'
+ Columns containing 'Gyro' were converted to 'gyroscope' 
+ Columns containing 'Mag' were converted to 'magnitude' 
+ Columns containing 'std' were converted to 'standard deviation'

**time body accelerometer mean x**  - tBodyAcc-mean()-X                                   

**time body accelerometer mean y**  - tBodyAcc-mean()-Y                                   

**time body accelerometer mean z** - tBodyAcc-mean()-Z                                    

**time body accelerometer standard deviation x** - tBodyAcc-std()-X                       

**time body accelerometer standard deviation y** - tBodyAcc-std()-Y                      

**time body accelerometer standard deviation z** - tBodyAcc-std()-Z                      

**time gravity accelerometer mean x** - tGravityAcc-mean()-X                                 

**time gravity accelerometer mean y** - tGravityAcc-mean()-Y                                 

**time gravity accelerometer mean z** - tGravityAcc-mean()-Z                                 

**time gravity accelerometer standard deviation x** - tGravityAcc-std()-X                   

**time gravity accelerometer standard deviation y** - tGravityAcc-std()-Y                   

**time gravity accelerometer standard deviation z** - tGravityAcc-std()-Z                   

**time body accelerometer jerk mean x** - tBodyAccJerk-mean()-X                               

**time body accelerometer jerk mean y** - tBodyAccJerk-mean()-Y                               

**time body accelerometer jerk mean z** - tBodyAccJerk-mean()-Z                               

**time body accelerometer jerk standard deviation x** - tBodyAccJerk-std()-X               

**time body accelerometer jerk standard deviation y** - tBodyAccJerk-std()-Y                 

**time body accelerometer jerk standard deviation z** - tBodyAccJerk-std()-Z

**time body gyroscope mean x** - tBodyGyro-mean()-X                                         

**time body gyroscope mean y** - tBodyGyro-mean()-Y                                        

**time body gyroscope mean z** - tBodyGyro-mean()-Z                    

**time body gyroscope standard deviation x** - tBodyGyro-std()-X                          

**time body gyroscope standard deviation y** - tBodyGyro-std()-Y                          

**time body gyroscope standard deviation z** - tBodyGyro-std()-Z       

**time body gyroscope jerk mean x** - tBodyGyroJerk-mean()-X                                    

**time body gyroscope jerk mean y** - tBodyGyroJerk-mean()-Y                                    

**time body gyroscope jerk mean z** - tBodyGyroJerk-mean()-Z                                    

**time body gyroscope jerk standard deviation x** - tBodyGyroJerk-std()-X                      

**time body gyroscope jerk standard deviation y** - tBodyGyroJerk-std()-X                     

**time body gyroscope jerk standard deviation z** - tBodyGyroJerk-std()-X                     

**time body accelerometer magnitude mean** - tBodyAccMag-mean()                             

**time body accelerometer magnitude standard deviation** - tBodyAccMag-std()

**time gravity accelerometer magnitude mean** - tGravityAccMag-mean()                          

**time gravity accelerometer magnitude standard deviation** - tGravityAccMag-std()            

**time body accelerometer jerk magnitude mean** - tBodyAccJerkMag-mean()                        

**time body accelerometer jerk magnitude standard deviation** - tBodyAccJerkMag-std()

**time body gyroscope magnitude mean** - tBodyGyroJerkMag-mean()                                 

**time body gyroscope magnitude standard deviation** - tBodyGyroMag-std()                   

**time body gyroscope jerk magnitude mean** - tBodyGyroJerkMag-mean()                            

**time body gyroscope jerk magnitude standard deviation** - tBodyGyroJerkMag-std()              

**frequency body accelerometer mean x** - fBodyAcc-mean()-X                                

**frequency body accelerometer mean y** - fBodyAcc-mean()-Y                                

**frequency body accelerometer mean z** - fBodyAcc-mean()-Z                                

**frequency body accelerometer standard deviation x** - fBodyAcc-std()-X                  

**frequency body accelerometer standard deviation y** - fBodyAcc-std()-Y                  

**frequency body accelerometer standard deviation z** - fBodyAcc-std()-Z

**frequency body accelerometer jerk mean x** - fBodyAccJerk-mean()-X                           

**frequency body accelerometer jerk mean y** - fBodyAccJerk-mean()-Y                           

**frequency body accelerometer jerk mean z** - fBodyAccJerk-mean()-Z                           

**frequency body accelerometer jerk standard deviation x** - fBodyAccJerk-std()-X             

**frequency body accelerometer jerk standard deviation y** - fBodyAccJerk-std()-Y             

**frequency body accelerometer jerk standard deviation z** - fBodyAccJerk-std()-Z             

**frequency body gyroscope mean x** - fBodyGyro-mean()-X                                    

**frequency body gyroscope mean y** - fBodyGyro-mean()-Y                                    

**frequency body gyroscope mean z** - fBodyGyro-mean()-Z                                    

**frequency body gyroscope standard deviation x** - fBodyGyro-std()-X                      

**frequency body gyroscope standard deviation y** - fBodyGyro-std()-Y                      

**frequency body gyroscope standard deviation z** - fBodyGyro-std()-Z                      

**frequency body accelerometer magnitude mean** - fBodyAccMag-mean()                        

**frequency body accelerometer magnitude standard deviation** - fBodyAccMag-std()          

**frequency body body accelerometer jerk magnitude mean** - fBodyBodyAccJerkMag-mean()          

**frequency body body accelerometer jerk magnitude standard deviation** - fBodyBodyAccJerkMag-std()

**frequency body body gyroscope magnitude mean** - fBodyBodyGyroMag-mean()                       

**frequency body body gyroscope magnitude standard deviation** - fBodyBodyGyroMag-std()        

**frequency body body gyroscope jerk magnitude mean**- fBodyBodyGyroJerkMag-mean()                  

**frequency body body gyroscope jerk magnitude standard deviation** - fBodyBodyGyroJerkMag-std()  

The columns are better understood given the context of the original data, here is a quote from the original `features_info.txt` document:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ
> tGravityAcc-XYZ
> tBodyAccJerk-XYZ
> tBodyGyro-XYZ
> tBodyGyroJerk-XYZ
> tBodyAccMag
> tGravityAccMag
> tBodyAccJerkMag
> tBodyGyroMag
> tBodyGyroJerkMag
> fBodyAcc-XYZ
> fBodyAccJerk-XYZ
> fBodyGyro-XYZ
> fBodyAccMag
> fBodyAccJerkMag
> fBodyGyroMag
> fBodyGyroJerkMag

> The set of variables that were estimated from these signals are: 

> mean(): Mean value
> std(): Standard deviation
