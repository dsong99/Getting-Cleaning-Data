Description: 

  This project is Getting and Cleaning Data Course Project,  course 3 in Data Science series offered by Johns       Hopkins University throw coursera.
  
  This project processes data collected from the accelerometers from the Samsung Galaxy S smartphone, and 
  performs below operations:
  
  1.	Merges the training and the test sets to create one data set.
  2.	Extracts only the measurements on the mean and standard deviation for each measurement.
  3.	Uses descriptive activity names to name the activities in the data set
  4.	Appropriately labels the data set with descriptive variable names.
  5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable        for each activity and each subject.


Data Source

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


To Run:
  First set the current working directory to the location containing the unziped data files, for example:             setwd("./datacleaning/data/UCI HAR Dataset")
  
  run_analysis.R performs the data preparation and generate the result file as tidydata.txt. 
  
  CodeBook.md describes the variables, the data, and any transformations performed to clean up the data. 
