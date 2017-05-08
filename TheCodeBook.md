This CodeBook contains 2 parts:

1. features_info (related to the original data sets located in url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

2. This part describes the variables, transformations or work performed to clean up the data.

====================================================



Part 1:
=======

Feature info - Feature Selection:


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range  
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal  
kurtosis(): kurtosis of the frequency domain signal  
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

The complete list of variables of each feature vector is available in 'features.txt'.

Part 2:
=======
1. We checked if a directory named: Getting_cleaning_data_Assign exists on the desktop so if it doesn't exist, we created one with the previous name.

2. We set the working directory to the directory created in the previous step.

3. We used the url given in the assignment instructions to download the original data (archive.zip) in "Getting_cleaning_data_Assign/data"

4. We read the following txt files in table format and we created data frames from them:

trainX, trainY, testX, testY, yLabels, xLabels, trainSubject, testSubject
 
5. The training set (trainX) and the test set (testX) are merged to create one data set we called: init_target_data

6. Descriptive activity names were used to name the activities in the data set as follows:

-  A new data set called activity was created by row-binding the 2 data sets: trainY & testY. This data contain actvities performed by the respective subjects as numerics.
-  In order to give descriptive names to this data i.e: "activity", we merged it with the yLabels data set that contains the descriptive names based on the activity numeric codes column 
-  Now activity contains 2 code columns: numeric and descriptive we name them respectively: activityCode, activityName.

7. We row-bind the 2 datasets: trainSubject & testSubject to create a new dataset that contain all subjects: "AllSubjects" in one column we call it: "SubjectCode"

8.We Appropriately label the dataset "init_target_data" with descriptive variable names given in: XLabels$V2

9. We get our "target_data" (before additional required summaries in the project instructions) dataset by column-binding the 3 datasets obtained from the 3 previous steps:"AllSubjects", "Activity", "init_target_data".

10. We fix duplicated column names in "target_data" we obtained in the above step.


11. We extract only the measurements on the mean and standard deviation for each measurement by subsetting the "target_data" to obtain a new dataset: 
"target_data_mean_std"

12. We create an independent "tidy_data" dataset with by grouping on 2 variables in "target_data_mean_std" dataset: SubjectCode & activityName and summarizing (aggregating) the mean of the rest of columns(also excluding a third col: activityCode)

13  We further improve the naming by chaning the following by giving units meaningful names:

t  into time  
f into frequency  
Acc into acceleration  
Mag into magnitude  
Gyro into gyroscope  

to get the final list of names of the final "tidy_data":

[1] "subjectCode"                                     
 [2] "activityName"                                    
 [3] "timeBodyacceleration.std...X"                    
 [4] "timeBodyacceleration.std...Y"                    
 [5] "timeBodyacceleration.std...Z"                    
 [6] "timeGravityacceleration.std...X"                 
 [7] "timeGravityacceleration.std...Y"                 
 [8] "timeGravityacceleration.std...Z"                 
 [9] "timeBodyaccelerationJerk.std...X"                
[10] "timeBodyaccelerationJerk.std...Y"                
[11] "timeBodyaccelerationJerk.std...Z"                
[12] "timeBodygyroscope.std...X"                       
[13] "timeBodygyroscope.std...Y"                       
[14] "timeBodygyroscope.std...Z"                       
[15] "timeBodygyroscopeJerk.std...X"                   
[16] "timeBodygyroscopeJerk.std...Y"                   
[17] "timeBodygyroscopeJerk.std...Z"                   
[18] "timeBodyaccelerationmagnitude.std.."             
[19] "timeGravityaccelerationmagnitude.std.."          
[20] "timeBodyaccelerationJerkmagnitude.std.."         
[21] "timeBodygyroscopemagnitude.std.."                
[22] "timeBodygyroscopeJerkmagnitude.std.."            
[23] "frequencyBodyacceleration.std...X"               
[24] "frequencyBodyacceleration.std...Y"               
[25] "frequencyBodyacceleration.std...Z"               
[26] "frequencyBodyaccelerationJerk.std...X"           
[27] "frequencyBodyaccelerationJerk.std...Y"           
[28] "frequencyBodyaccelerationJerk.std...Z"           
[29] "frequencyBodygyroscope.std...X"                  
[30] "frequencyBodygyroscope.std...Y"                  
[31] "frequencyBodygyroscope.std...Z"                  
[32] "frequencyBodyaccelerationmagnitude.std.."        
[33] "frequencyBodyBodyaccelerationJerkmagnitude.std.."
[34] "frequencyBodyBodygyroscopemagnitude.std.."       
[35] "frequencyBodyBodygyroscopeJerkmagnitude.std.."
                        

14. We finally use write.table() to write the  data.frame "tidy_data" in table_format before submission.
