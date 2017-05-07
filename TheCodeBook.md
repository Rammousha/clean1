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

10. We extract only the measurements on the mean and standard deviation for each measurement by subsetting the "target_data" to obtain a new dataset: 
"target_data_mean_std"

11. We create an independent "tidy_data" dataset with by grouping on 2 variables in "target_data_mean_std" dataset: SubjectCode & activityName and summarizing (aggregating) the mean of the rest of columns(also excluding a third col: subjectCode)

12  We further improve the naming by chaning the following:

t  into time
f into frequency
Acc into acceleration
Mag into magnitude
Gyro into gyroscope

to get the final list of names of the final "tidy_data":


 [1] "subjectCode"                                      
 [2] "activityName"                                     
 [3] "timeBodyacceleration-mean()-X"                    
 [4] "timeBodyacceleration-mean()-Y"                    
 [5] "timeBodyacceleration-mean()-Z"                    
 [6] "timeBodyacceleration-std()-X"                     
 [7] "timeBodyacceleration-std()-Y"                     
 [8] "timeBodyacceleration-std()-Z"                     
 [9] "timeGravityacceleration-mean()-X"                 
[10] "timeGravityacceleration-mean()-Y"                 
[11] "timeGravityacceleration-mean()-Z"                 
[12] "timeGravityacceleration-std()-X"                  
[13] "timeGravityacceleration-std()-Y"                  
[14] "timeGravityacceleration-std()-Z"                  
[15] "timeBodyaccelerationJerk-mean()-X"                
[16] "timeBodyaccelerationJerk-mean()-Y"                
[17] "timeBodyaccelerationJerk-mean()-Z"                
[18] "timeBodyaccelerationJerk-std()-X"                 
[19] "timeBodyaccelerationJerk-std()-Y"                 
[20] "timeBodyaccelerationJerk-std()-Z"                 
[21] "timeBodygyroscope-mean()-X"                       
[22] "timeBodygyroscope-mean()-Y"                       
[23] "timeBodygyroscope-mean()-Z"                       
[24] "timeBodygyroscope-std()-X"                        
[25] "timeBodygyroscope-std()-Y"                        
[26] "timeBodygyroscope-std()-Z"                        
[27] "timeBodygyroscopeJerk-mean()-X"                   
[28] "timeBodygyroscopeJerk-mean()-Y"                   
[29] "timeBodygyroscopeJerk-mean()-Z"                   
[30] "timeBodygyroscopeJerk-std()-X"                    
[31] "timeBodygyroscopeJerk-std()-Y"                    
[32] "timeBodygyroscopeJerk-std()-Z"                    
[33] "timeBodyaccelerationmagnitude-mean()"             
[34] "timeBodyaccelerationmagnitude-std()"              
[35] "timeGravityaccelerationmagnitude-mean()"          
[36] "timeGravityaccelerationmagnitude-std()"           
[37] "timeBodyaccelerationJerkmagnitude-mean()"         
[38] "timeBodyaccelerationJerkmagnitude-std()"          
[39] "timeBodygyroscopemagnitude-mean()"                
[40] "timeBodygyroscopemagnitude-std()"                 
[41] "timeBodygyroscopeJerkmagnitude-mean()"            
[42] "timeBodygyroscopeJerkmagnitude-std()"             
[43] "frequencyBodyacceleration-mean()-X"               
[44] "frequencyBodyacceleration-mean()-Y"               
[45] "frequencyBodyacceleration-mean()-Z"               
[46] "frequencyBodyacceleration-std()-X"                
[47] "frequencyBodyacceleration-std()-Y"                
[48] "frequencyBodyacceleration-std()-Z"                
[49] "frequencyBodyaccelerationJerk-mean()-X"           
[50] "frequencyBodyaccelerationJerk-mean()-Y"           
[51] "frequencyBodyaccelerationJerk-mean()-Z"           
[52] "frequencyBodyaccelerationJerk-std()-X"            
[53] "frequencyBodyaccelerationJerk-std()-Y"            
[54] "frequencyBodyaccelerationJerk-std()-Z"            
[55] "frequencyBodygyroscope-mean()-X"                  
[56] "frequencyBodygyroscope-mean()-Y"                  
[57] "frequencyBodygyroscope-mean()-Z"                  
[58] "frequencyBodygyroscope-std()-X"                   
[59] "frequencyBodygyroscope-std()-Y"                   
[60] "frequencyBodygyroscope-std()-Z"                   
[61] "frequencyBodyaccelerationmagnitude-mean()"        
[62] "frequencyBodyaccelerationmagnitude-std()"         
[63] "frequencyBodyBodyaccelerationJerkmagnitude-mean()"
[64] "frequencyBodyBodyaccelerationJerkmagnitude-std()" 
[65] "frequencyBodyBodygyroscopemagnitude-mean()"       
[66] "frequencyBodyBodygyroscopemagnitude-std()"        
[67] "frequencyBodyBodygyroscopeJerkmagnitude-mean()"   
[68] "frequencyBodyBodygyroscopeJerkmagnitude-std()"    
[69] "angle(tBodyaccelerationJerkMean),gravityMean)"    
[70] "angle(tBodygyroscopeMean,gravityMean)"            
[71] "angle(tBodygyroscopeJerkMean,gravityMean)"        
[72] "angle(X,gravityMean)"                             
[73] "angle(Y,gravityMean)"                             
[74] "angle(Z,gravityMean)"                             

13. We finally use write.table() to write the  data.frame "tidy_data" in table_format before submission.