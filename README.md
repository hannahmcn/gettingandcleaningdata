---
Name: Hannah McNeill
Course: Getting and Cleaning Data - 010
Assignment Name: Course Project
Script Name: run_analysis.R
---
## Summary

The purpose of this script is to clean accelerometer data and to present it in a clear and concise manner.

The script "run_analysis.R" does this, and it can be run using the command:

 `> source("run_analysis.R")`
 
as long as the file "run_analysis.R" and the folders of the test and train data obtained from the accelerometer data set are in the current working directory.
 
This script will output a data frame with the accelerometer data summarized, so that the only variables shown are the subject number (column heading "Sub"), the activity name (column heading "Activity"), the average of the average reading for the given subject and activity name (column heading "Mean"), and the average of the standard deviation for the given subject and activity name (column heading "St.Dev"). 

You can view *just* the output from this function (stored in the file clean.txt) without runnuing the script itself using this command:

`> data <- read.table("clean.txt", header = TRUE)`

`> view(data)`

## Process

The process used to obtain this output is as follows: 

1. Read the x (readings), y (activities), and subject data for the test and train folders to tables (6 tables total)
2. Create new data frames called test & train using the x data 
3. Add the Y and subject values to their corresponding tables (6 tables reduced to 2)
4. Combine the test and train data frames by row (using rbind; 2 tables reduced to 1) 
5. Read the given variable names as a header
6. Create 2 new columns in this data frame, one indicating whether or not that variable is a mean or standard deviation, and the other removing all non-alphabet characters in the variable names
7. Create a vector using the variable names that had punctuation removed and the words "Activity" and "Sub" (give variables descriptive names)
8. Change the column names of the data to that vector
9. Creates a new data frame containing only the variables that are a mean or standard deviation, as well as the activity and subject numbers
10. Change the value for each activity to the given descriptive activity name
11. Group the clean data frame first by the subject then activity
12. Summarize each variable as a mean, based on the subject and activity, then print out the data frame

Each of these steps is also commented in the file "run_analysis.R" beneath the code that performs the process.  Please view the script if you wish to see the exact commands used to carry out this process. 

This script allows for the data to be observed in a more effective manner since the hundreds of readings are reduced to a mean and standard deviation for each subject and activity.  Since both the mean and the standard deviation are given, there is enough information given so that further analysis can be done (i.e. creating distribution plots), without having to process thousands of lines of data.
