library(dplyr)
testx <- read.table("test/X_test.txt")
testy <- read.table("test/Y_test.txt")
sub1 <- read.table("test/subject_test.txt")
trainx <- read.table("train/X_train.txt")
trainy <- read.table("train/y_train.txt")
sub2 <- read.table("train/subject_train.txt")
## Read the test and train x, y, and subject data to tables
train <- trainx
test <- testx
## Create new data frames called test & train using the x data
train$Activity <- trainy$V1
train$Sub <- sub2$V1
test$Activity <- testy$V1
test$Sub <- sub1$V1
## add the Y and subject values to their corresponding tables
data <- rbind(test, train)
## Combine the test and train data frames by row
data$Mean <- apply(data, 1, mean)
data$St.Dev <- apply(data, 1, sd)
## Create columns for the mean and standard deviation,
## calculating those values for all rows and adding them
## to the corresponding column
clean <- data[c("Activity", "Mean", "St.Dev", "Sub")]
## Create a new data frame called clean with only the columns
## containing the activity, mean, standard deviation, and
## subject variables
a <- clean$Activity
a[a == 1] <- "Walking"
a[a == 2] <- "Walking Upstairs"
a[a == 3] <- "Walking Downstairs"
a[a == 4] <- "Sitting"
a[a == 5] <- "Standing"
a[a == 6] <- "Laying"
clean$Activity <- a
## Change the value for each activity to the given descriptive
## activity name
clean2 <- group_by(clean, Sub, Activity)
## Group the clean data frame first by the subject then activity
cleanfinal <- summarize(clean2, Mean = mean(Mean), St.Dev = mean(St.Dev))
## Use the summarize function to find the mean of the means and standard
## deviations for each subject and activity
print.data.frame(cleanfinal)
## Print the result