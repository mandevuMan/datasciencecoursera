Code Book
==========

##
Please make sure you have downloaded the data files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped them. You can use winrar of winzip to extract the files.

## 1. Read data and Merge
*  activity_labels : Description of activity IDs in y_test and y_train
*  features : description(label) of each variables in X_test and X_train
  
*  subject_test : subject IDs for test
*  X_test : values of variables in test
*  y_test : activity ID in test
  
*  subject_train  : subject IDs for train
*  X_train : values of variables in train
*  y_train : activity ID in train
  
  mergeData : combined data from training and test data sets

## 2. Extract only mean() and std()
Use grep to search for columns with the word mean, std or Mean. Subset the data from mergeData.

## 3. Uses descriptive activity names to name the activities in the data set
Get the factors from mergeData$activity variable and assign to a variable q3_group. Set the levels for q3_group usinng activity_labels (2nd column) data set.
Set mergeData$activity factor using q3_group

## 4. Appropriately labels the data set with descriptive variable names. 
Get rid of characters which should not be used as variable names. To this end get rid of (), replace '-' and ',' with '_'. Also replace 'BodyBody' with just the word 'Body'.
Assign the final column names to mergeData

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Using ddply under plyr package, group the mergeData set using 'subjectID' and 'activity'. Run a mean function for each variable based on the group variable
Use write.table function to output the tiday data from step 4.

