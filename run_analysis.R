#####################################################################################################
#
# This is Getting and Cleaning Data Course Project. 
# This project processes data collected from the accelerometers from the Samsung Galaxy S smartphone. 
# It read all test and train data, combins them into one data set; gives descriptives names for each
# variable; extract mean and std for each measurement; aggregate data with average of each activity 
# and subject. 
#
# To run the script, 1st set the current working directory to the location containing the unziped
# data files: setwd("./datacleaning/data/UCI HAR Dataset")
#
#####################################################################################################


#
# read data from files, and remove temp object to free some memory
#
test_observations  <- read.table("./test/X_test.txt", header = FALSE)
train_observations <- read.table("./train/X_train.txt", header = FALSE)
observations <- rbind(test_observations, train_observations)
rm(test_observations, train_observations)

test_activity  <- read.table("./test/Y_test.txt" , header = FALSE)
train_activity <- read.table("./train/Y_train.txt", header = FALSE)
activities <- rbind(test_activity, train_activity)
rm(test_activity, train_activity)

test_subject  <- read.table("./test/subject_test.txt", header = FALSE)
train_subject <- read.table("./train/subject_train.txt", header = FALSE)
subjects <- rbind(test_subject, train_subject)
rm(test_subject,train_subject)



#
# labels the data set with descriptive variable names
#
features <- read.table("features.txt", head=FALSE)
names(observations)<- features$V2
names(subjects) <- c("subject")
names(activities) <- c("activity")

activity_labels <- read.table("activity_labels.txt", header = FALSE)
activities$activity <- factor(activities$activity, levels = as.integer(activity_labels$V1), labels = activity_labels$V2)



#
# combine data into one data set with desriptive variable names 
#
subj_act <- cbind(subjects, activities)
one_data <- cbind(observations, subj_act)

rm(observations,activity_labels,subj_act)



#
# extracts only the measurements on the mean and standard deviation for each measurement.
#
mean_std_cols<-c(as.character(features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]))
sel_cols <-c("subject", "activity", as.character(mean_std_cols) )
one_data <-subset(one_data,select=sel_cols)


#
# Appropriately labels the data set with descriptive variable names.
#
names(one_data)<-gsub("^t", "time", names(one_data))
names(one_data)<-gsub("^f", "frequency", names(one_data))
names(one_data)<-gsub("Acc", "Accelerometer", names(one_data))
names(one_data)<-gsub("Gyro", "Gyroscope", names(one_data))
names(one_data)<-gsub("Mag", "Magnitude", names(one_data))
names(one_data)<-gsub("BodyBody", "Body", names(one_data))


#
# creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
#
aggr_data <-aggregate(one_data, by = list(one_data$subject, one_data$activity), FUN = mean)

aggr_data <- subset(aggr_data,select=-c(subject, activity))
names(aggr_data)[1] <- "subject"
names(aggr_data)[2] <- "activity"

write.table(aggr_data, file = "tidydata.txt",row.name=FALSE)


# remove all objects from memory
#rm(list=ls())



