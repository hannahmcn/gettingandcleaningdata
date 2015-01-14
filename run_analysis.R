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
head <- read.table("features.txt")
## Read the given variable names as a data frame
head <-mutate(head, tf = grepl("mean", V2) | grepl("std",V2), nw = gsub("[^A-z]", "", V2))
## Create 2 new columns in this data frame, one indicating whether
## or not that variable is a mean or standard deviation, and the 
## other removing all non-alphabet characters in the variable names
header <- c(head$nw, "Activity", "Sub")
## Create a vector using the variable names that had punctuation 
## removed and the words "Activity" and "Sub"
colnames(data) <- header
## Change the column names of the data to that vector
clean <- data[,c(head$tf,TRUE,TRUE)]
## Creates a new data frame containing only the variables that
## are a mean or standard deviation, as well as the activity
## and subject numbers
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
cleanfinal <- summarise_each(clean2, funs(mean))
## Summarize each variable as a mean, based on the subject and activity
print.data.frame(cleanfinal)
## Print the summarized data frame