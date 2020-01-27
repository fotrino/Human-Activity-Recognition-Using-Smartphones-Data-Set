# Human Activity Recognition Using Smartphones Data Set

## Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

This is Peer-graded Assignment for the "Getting and Cleaning Data Course Project".

## Files Included
- README.md
- CodeBook.md: the codebook that discribes the data and variables.
- run_analysis.R: the R script to download and perform the analysis.
- tidydata.txt: the resulting file after performing the analysis.

## How to Download the DataSet
Load the script in your R environment and run the following code:
```R
source("run_analysis.R")
downloadData()
```

## How to Run the Analysis
Load the script in your R environment and run the following code:
```R
source("run_analysis.R")
makeTidyData()
tidyData<-fread("tidyData.txt")
summary(tidyData)
```
This R Script has the following steps:
- Loads all the downloaded data.
- Assigns descriptive activity names to name the activities in the data set.
- Merge Train & Test Set into one named Total.
- Appropriately labels the data set with descriptive variable names.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Output
This scipts generates a [tidyData.txt](https://github.com/fotrino/Human-Activity-Recognition-Using-Smartphones-Data-Set/blob/master/tidyData.txt) with the cleaned-up data. Containing the activity label, subject and the requiered features.

## License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
