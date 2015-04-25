# STEP 0: Preliminary actions
# download & unzip files
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./ProjectData.zip")
unzip("ProjectData.zip")

# STEP 1: Merges the training and the test sets to create one data set.
# read files
## read 'training' data
x.train <- read.table("../CourseProject/UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("../CourseProject/UCI HAR Dataset/train/y_train.txt")
s.train <- read.table("../CourseProject/UCI HAR Dataset/train/subject_train.txt")

## read 'test' data
x.test <- read.table("../CourseProject/UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("../CourseProject/UCI HAR Dataset/test/y_test.txt")
s.test <- read.table("../CourseProject/UCI HAR Dataset/test/subject_test.txt")

# clip files
## clip training data files togehter
syx.train <- cbind(s.train, y.train, x.train)
head(syx.train[,1:4])
## clip test data files togehter
syx.test <- cbind(s.test, y.test, x.test)
head(syx.test[,1:4])
## combine all data
syx.all <- rbind(syx.train, syx.test)
head(syx.all)

# -------

# STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.

#reaed file with measurement labels
features <- read.table("../CourseProject/UCI HAR Dataset/features.txt", 
                       colClasses = "character") # convert to characther! 
str(features)
head(features)

# subset the columnt needed
features <- features[,2]

# create a variable with indexes of the variables containing only "mean" or "std"
columns <- grep("mean|std", features)

# create another variable with the indexes of the variables containing "Freq"
rm.columns <- grep("Freq", features)


# assume we don't need meanFreq -> get rid of that indexes
columns_cleaned <- columns[!columns %in% rm.columns]
length(columns_cleaned)
length(columns)


# create a subset of syx.all, containing only the measurements in interest
subset <- syx.all[, c(1,2, (columns_cleaned + 2))] # we need to add to to the indices, 
# beacause we have two more variables at the beginning
# dim(subset)
# names(subset)

# STEP 3: Uses descriptive activity names to name the activities in the data set
activities <- read.table("../CourseProject/UCI HAR Dataset/activity_labels.txt")
activities
# activities <- activities[,2]
activities[,2] <- tolower(activities[,2])


# names(sxy.all)
# sxy.all$activity[activities$V2]
head(subset[,1:3])

names(subset)
names(activities) <- c("code", "activity")

subset.merged <- merge(activities, subset, by.x = "code", by.y = "V1.1")
names(subset.merged)
head(subset.merged[,1:5])

# remove unnecessary column
subset.merged2 <- subset.merged[, -1]
names(subset.merged2)
head(subset.merged2[1:5])

# STEP 4: Appropriately labels the data set with descriptive variable names. 
col.names <- features[columns_cleaned]
length(col.names)

#the names given in step 1 are not valid column names! Fix: 
# valid_column_names <- make.names(names=names(sxy.all), unique=TRUE, allow_ = TRUE)
# names(sxy.all) <- valid_column_names

# class(col.names)
col.names <- features[columns_cleaned]
col.names
cn1 <- sub("^t", "time_", col.names)
cn2 <- sub("^f", "frequency_", cn1)
cn3 <- gsub("-", "_", cn2)
cn4 <- sub("\\(\\)", "", cn3)
cn5 <- sub("Acc", "Acceleration", cn4)

names(subset.merged2) <- c("activity", "id", cn5)
names(subset.merged2)
View(subset.merged2)


# STEP 5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

write.table(subset.merged2, "subset.merged2.csv", sep=",", row.names = F)
?write.table
table(subset.merged2$id, subset.merged2$activity)
names(subset.merged2)


# rehape data into long form
library(reshape2)
dataMelt <- melt(subset.merged2, id = c("id", "activity"), measure.vars = 3:68)
head(dataMelt)
dim(dataMelt)
str(dataMelt)
dataMelt$activity <- factor(dataMelt$activity)
dataMelt$id <- factor(dataMelt$id)
# colnames(dataMelt[,3])

# dataCast <- dcast(dataMelt, activity ~ variable)
# dataCast
# 
# ?ddply
write.table(dataMelt, "dataMelt.csv", sep = ",")


# rename "variable" into "feature" 

# names(dataMelt)
tidy1 <- ddply(dataMelt, .(id, activity, variable), summarize,
               mean = round(mean(value),2))b # this is it! 
head(tidy1, n = 70)
dim(tidy1)

# rename "variable" to "feature" via dplyr
tidy2 <- rename(tidy1, feature = variable)
head(tidy2)

write.table(tidy2, "tidyData.txt", row.name = F)
