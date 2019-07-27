1. Download the data
  download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  and extracted under the folder called UCI HAR Dataset

2. Read all test and train data: 
  
  using read.table method with header='FALSE' to read all test and training data (observations, activity, subject) into variables accordingly, 
  
  test_observations (x_test),
  train_observations (x_train), 
  test_activity,
  train_activity,
  test_subject,  
  train_subject,
  
3. then combin test and train data accordingly, using rbind() function, and then remove temp variables to free some memory. 
  
  obervations
  subjects,
  activity

4. labels the data set with descriptive variable names

  uses features.txt to name oberservation columns 
  activity_labels to name activity
  "subject"" to name subject

5. Combin oberservations, subjects, acitivity into a single data set, using cbind() function.
  
  combined result date set: one_data

6. Extracts only the measurements on the mean and standard deviation for each measurement.
  Use reqular expression to grep corresponding columns. 
  
7. Appropriately labels the data set with descriptive variable names.  
  replace column names with: 
  t -> time
  f -> frequency
  Acc -> Accelerometer
  Gyro -> Gyroscope
  Mag -> Magnitude
  BodyBody -> Body
  

8.creates a second, independent tidy data set with the average of each variable for each activity and each subject, and write the result to a file named tidydata.txt



  