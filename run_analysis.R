# ---- cOURSE PROJECT SCRIPT -----

# STEP 0: Preliminary actions: download & unzip files

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./ProjectData.zip")
unzip("ProjectData.zip")


# STEP 1: Merges the training and the test sets to create one data set.

# 1.1 read files
## 1.1.1 read 'training' data
x.train <- read.table("UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
s.train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## 1.1.2 read 'test' data
x.test <- read.table("UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
s.test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# 1.2 clip files together
## 1.2.1 clip training data files togehter
## the order of clipping is "subject" (s), "activity" (y), "measurements" (x)
syx.train <- cbind(s.train, y.train, x.train)

## 1.2.2 clip test data files togehter, same order as for the training data
syx.test <- cbind(s.test, y.test, x.test)

## 1.2.3 combine all data
syx.all <- rbind(syx.train, syx.test)


# STEP 2: Extracts only the measurements on the mean and standard deviation 
# for each measurement.

# 2.1 read file with measurement labels (a.k.a. "features")
features <- read.table("UCI HAR Dataset/features.txt")
# str(features)
# head(features)

# 2.2 subset the column needed
features <- features[,2]

# 2.3 create a vector of indexes of the variables containing only "mean" or "std"
columns <- grep("mean|std", features)

# 2.4 create another variable with the indexes of the variables containing "Freq"
rm.columns <- grep("Freq", features)

# 2.5 assume we don't need meanFreq -> get rid of that indexes
columns_cleaned <- columns[!columns %in% rm.columns]
# length(columns_cleaned)
# length(columns)

# 2.6 create a subset of syx.all, containing only the measurements in interest
subset <- syx.all[, c(1,2, (columns_cleaned + 2))] # we need to add 2 to the indices, 
# beacause we have two more variables at the beginning
# dim(subset)
# names(subset)


# STEP 3: Uses descriptive activity names to name the activities in the data set

# 3.1 read file with activity labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# 3.2 convert labels to lowercase
activities[,2] <- tolower(activities[,2])

# 3.3. check out the names of the variables in the subset created in step 2.6
head(subset[,1:3])
names(subset)

# 3.4 give activities descriptive variable names
names(activities) <- c("code", "activity")

# 3.5 merge activities & subset from step 2.6
subset.merged <- merge(activities, subset, by.x = "code", by.y = "V1.1")

# 3.6 check out results
names(subset.merged)
head(subset.merged[,1:5]) # "code" and "activity" are in fact duplicates

# 3.7 remove duplicate column ("code")
subset.merged2 <- subset.merged[, -1]
# names(subset.merged2)
# head(subset.merged2[1:5])


# STEP 4: Appropriately labels the data set with descriptive variable names. 

# remember "columns_cleaned" is vector containing only the indexes of the variables 
# specified in the task description ("mean | std", "meanFred" excluded)
# columns_cleaned

# 4.1. create a vector containing the names of the measurements needed
col.names <- features[columns_cleaned]
# length(col.names) # check result
# col.names
# class(col.names)

# the labels extracted in step 4.1 are not valid column names 
# 4.2 Fix labels by editing text
cn1 <- sub("^t", "time_", col.names)
cn2 <- sub("^f", "frequency_", cn1)
cn3 <- gsub("-", "_", cn2)
cn4 <- sub("\\(\\)", "", cn3)
cn5 <- sub("Acc", "Acceleration", cn4) # this is the final manipulation

# 4.3 assign names to the final (so far) version of the data
names(subset.merged2) <- c("activity", "id", cn5)
# names(subset.merged2)
# View(subset.merged2)


# STEP 5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# 5.1 reshape data into long form, so that different measurements become levels 
# of the variable "feature" 
library(reshape2)
dataMelt <- melt(subset.merged2, id = c("id", "activity"), measure.vars = 3:68)

# 5.2 Check results from step 5.1
# head(dataMelt)
# dim(dataMelt)
str(dataMelt)

# 5.3 we need to coerce variable "activity" to factor 
dataMelt$activity <- factor(dataMelt$activity)


# 5.4 summarize data by subject (id), activity and feature (variable), giving the mean
# (as is the task description) 
library(plyr)
tidy1 <- ddply(dataMelt, .(id, activity, variable), summarize,
               mean = round(mean(value),2)) # this is it! 
# head(tidy1, n = 70)
# dim(tidy1)

# 5.5 rename "variable" to "feature" via dplyr
library(dplyr)
tidy2 <- rename(tidy1, feature = variable)

# check results
# head(tidy2)

# 5.6 write the final data set into a *.txt file
write.table(tidy2, "tidyData.txt", row.name = F)

# 5.7 remove all objects but "tidy2"
rm(list=setdiff(ls(), "tidy2"))
