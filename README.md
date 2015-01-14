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

## Process

The process used to obtain this output is as follows: 

1. Read the x (readings), y (activities), and subject data for the test and train folders to tables (6 tables total)
2. Create new data frames called test & train using the x data 
3. Add the Y and subject values to their corresponding tables (6 tables reduced to 2)
4. Combine the test and train data frames by row (using rbind; 2 tables reduced to 1) 
5. Create columns for the mean and standard deviation of all readings for each row
6. Create a new data frame with the columns containing the activity, mean, standard deviation, and subject variables
7. Change the numeric value for each activity to the given corresponding descriptive activity name
8. Group the clean data frame first by the subject, then activity
9. Use the summarize function to find the mean of the means and the mean of the standard deviations for each subject and activity
10. Print out the result from step 9

Each of these steps is also commented in the file "run_analysis.R" beneath the code that performs the process.  Please view the script if you wish to see the exact commands used to carry out this process. 

This script allows for the data to be observed in a more effective manner since the hundreds of readings are reduced to a mean and standard deviation for each subject and activity.  Since both the mean and the standard deviation are given, there is enough information given so that further analysis can be done (i.e. creating distribution plots), without having to process thousands of lines of data.
