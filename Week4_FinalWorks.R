library(dplyr)
library(plyr)

#getwd()

activity_labels<-read.table('.\\activity_labels.txt')
features<-read.table('.\\features.txt')


subject_test<-read.table('.\\test\\subject_test.txt')
X_test<-read.table('.\\test\\X_test.txt')
y_test<-read.table('.\\test\\y_test.txt')

colnames(subject_test)<-"subjectID"
colnames(X_test)<-features[,2]
colnames(y_test)<-"activity"

#y_test$activity<-factor(activity_labels$V2, levels = activity_labels$V2)

testData<-cbind(subject_test,X_test,y_test)


subject_train<-read.table('.\\train\\subject_train.txt')
X_train<-read.table('.\\train\\X_train.txt')
y_train<-read.table('.\\train\\y_train.txt')

colnames(subject_train)<-"subjectID"
colnames(X_train)<-features[,2]
colnames(y_train)<-"activity"

trainData<-cbind(subject_train,X_train, y_train)

#1. Merges the training and the test sets to create one data set.
mergeData<-rbind(trainData,testData)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
q2_ans<-mergeData[,grep("mean|std|Mean|subjectID", colnames(mergeData) )]

#3. Uses descriptive activity names to name the activities in the data set
q3_group<-factor(mergeData$activity)
levels(q3_group)<-activity_labels[,2]
mergeData$activity<-q3_group

#4. Appropriately labels the data set with descriptive variable names.
#Get rid of ()
colnames(mergeData) <- gsub("\\(|\\)", "", colnames(mergeData) )
colnames(mergeData) <- gsub("-", "_", colnames(mergeData) )
colnames(mergeData) <- gsub("BodyBody", "Body", colnames(mergeData) )
colnames(mergeData) <- gsub(",", "_", colnames(mergeData) )

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
q5_ans<- ddply(mergeData, c("subjectID","activity"), numcolwise(mean))


write.table(q5_ans, "tidy.txt", row.names = F)


