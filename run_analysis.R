library(plyr)
library(reshape2)

downloadData <- function(){
  ## Sets the URL where you get the data
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  ## Download & Unzip the File
  download.file(fileUrl, destfile = "dataset.zip", method = "curl")
  unzip("dataset.zip") 
}

makeTidyData <- function(){
  # Load Columns Names
  features <- read.table("./UCI HAR Dataset/features.txt") 
  
  # Load Activity Labels
  activity <- read.table("./UCI HAR Dataset/activity_labels.txt") 
  
  # Load Sets, labels and subjects
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt") # set
  Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") # labels
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") # subject
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt") # set
  Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") # labels
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") # subject
  
  # STEP 1: Uses descriptive activity names to name the activities in the data set
  # Add the Activity Labels Column
  Y_test <- join(Y_test, activity, by = "V1") 
  Y_train <- join(Y_train, activity, by = "V1") 
  
  # STEP 2: Merge Train & Test Set
  # Add Labels and Subject Columns to each table
  test <- cbind(subject_test, Y_test, X_test)
  train <- cbind(subject_train, Y_train, X_train)
  # Merge Resulting Tables into Total
  total <- rbind(test, train)
  
  # STEP 3: Appropriately labels the data set with descriptive variable names.
  colnames(total) <- c("subjectId", "activityId", "activityLabel", t(features)[2,])
  
  # STEP 4: Extracts only the measurements on the mean and standard deviation for each measurement.
  selectedCols <- grep("subjectId|activityLabel|mean\\(\\)|std\\(\\)", names(total))
  selectedData <- total[, c(selectedCols)]
  
  # STEP 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  idVars <- c("subjectId", "activityLabel")
  measureVars <- grep("mean\\(\\)|std\\(\\)", names(total), value = TRUE)
  totalMelt <- melt(selectedData, id.vars = idVars, measure.vars = measureVars)
  
  tidyData <- dcast(totalMelt, activityLabel + subjectId ~ variable, mean)
  
  write.table(tidyData, "tidyData.txt", row.names = FALSE)
}
