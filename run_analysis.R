#run_analysis.R 


library(dplyr) 


#The link to download the data 
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 


if(!file.exists("C:/Users/rdajani/Desktop/Getting_cleaning_data_Assign")) 
{ 
  dir.create("C:/Users/rdajani/Desktop/Getting_cleaning_data_Assign") 
} 
setwd("C:/Users/rdajani/Desktop/Getting_cleaning_data_Assign")

download.file(url,destfile = "archive.zip") 
unzip(zipfile="archive.zip",exdir ="data") 


trainX = read.table("data/UCI HAR Dataset/train/X_train.txt") 
trainY = read.table("data/UCI HAR Dataset/train/y_train.txt") 
testX = read.table("data/UCI HAR Dataset/test/X_test.txt") 
testY = read.table("data/UCI HAR Dataset/test/y_test.txt") 
yLabels = read.table("data/UCI HAR Dataset/activity_labels.txt") 
xLabels =  read.table("data/UCI HAR Dataset/features.txt") 
trainSubject = read.table("data/UCI HAR Dataset/train/subject_train.txt") 
testSubject = read.table("data/UCI HAR Dataset/test/subject_test.txt") 


#Merges the training and the test sets to create one data set 
init_target_data = rbind(trainX,testX)

#Uses descriptive activity names to name the activities in the data set 
activity = rbind(trainY,testY) 
activity = left_join(activity, yLabels, by="V1") 
names(activity) = c("activityCode", "activityName") 

# Create a data frame(AllSubjects) by row-binding the 2 data sets: trainSubject, testSubject. 
# This dataset contains one column we name it: "SubjectCode".
AllSubjects = rbind(trainSubject,testSubject) 
names(AllSubjects) = "subjectCode"


#Appropriately labels the data set with descriptive variable names. 
names(init_target_data) = xLabels$V2 
target_data = cbind(AllSubjects,activity,init_target_data) 



#Fix Duplicated columns:
valid_column_names <- make.names(names=names(target_data), unique=TRUE, allow_ = TRUE)
names(target_data) <- valid_column_names

#Extracts only the measurements on the mean and standard deviation for each measurement. 
subset = grep("mean[..]|std|activity|subject",names(target_data),ignore.case=FALSE) 
target_data_mean_std = target_data[,subset] 




#create an independent tidy data set with the average of each variable for each activity and each subject 
tidy_data = group_by(target_data_mean_std, subjectCode, activityName) %>% summarise_each(funs(mean(., na.rm=TRUE)), -c(subjectCode, activityCode, activityName)) 



# We further improve the naming by chaning the following:

#t  into time
#f into frequency
#Acc into acceleration
#Mag into magnitude
#Gyro into gyroscope

 names(tidy_data) <- gsub("^t", "time", names(tidy_data)) 
 names(tidy_data) <- gsub("^f", "frequency", names(tidy_data)) 
 names(tidy_data) <- gsub("Acc", "acceleration", names(tidy_data)) 
 names(tidy_data) <- gsub("Mag", "magnitude", names(tidy_data)) 
 names(tidy_data) <- gsub("Gyro", "gyroscope", names(tidy_data)) 

 write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
