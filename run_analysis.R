# Please refer to README.md for script and datafile locations
# Load required Packages
library(plyr)

# Values for the Activity Varible comprises of data from “y_train.txt” and “y_test.txt”
# Values for the Subject Varible comprises of data from “subject_train.txt” and subject_test.txt"
# Values for the Features Varible comprises of data from “X_train.txt” and “X_test.txt”
# Descriptive Features Names are provided by “features.txt”
# Descriptive Activity Names are provided by “activity_labels.txt”

# Load Training DataFrames
        SubjectTrainDF <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        ActivityTrainDF <- read.table("./UCI HAR Dataset/train/y_train.txt")
        FeatureTrainDF <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Load Test DataFrames
        SubjectTestDF <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        ActivityTestDF <- read.table("./UCI HAR Dataset/test/y_test.txt") 
        FeatureTestDF <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Load Meta Data for Descriptive Names
        FeatureNames <- read.table("./UCI HAR Dataset/features.txt")
        ActivityNames <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Merge similar Dataframes for Test and Training
        SubjectDF <- rbind(SubjectTrainDF, SubjectTestDF)
        ActivityDF <- rbind(ActivityTrainDF, ActivityTestDF)
        FeatureDF <- rbind(FeatureTrainDF, FeatureTestDF)


# Assign Descriptive Names to Column Headings
        names(SubjectDF)<-c("Subject")
        names(ActivityDF)<- c("Activity")
        names(FeatureDF) <- FeatureNames$V2

# Assign Descriptive Names to Acivites
        ActivityDF$Activity <- as.character(ActivityDF$Activity)
                for (i in 1:6){
                ActivityDF$Activity[ActivityDF$Activity == i] <- as.character(ActivityNames[i,2])
                }
        # And then Convert Varible to Factor
                ActivityDF$Activity <- as.factor(ActivityDF$Activity)

# Merge into one DataFrame which now contains desciptive names in all the column headings.
        MergedDF <- cbind(ActivityDF, FeatureDF, SubjectDF)

# Subset name of Features by measurements on the mean and standard deviation
        subFeaturesNames<-FeatureNames$V2[grep("mean\\(\\)|std\\(\\)", FeatureNames$V2)]

# Subset MergedDF by seleted names of Features
        Measurements <- c(as.character(subFeaturesNames), "Subject", "Activity" )
        ExtractedData <- subset(MergedDF,select=Measurements)

# Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject. 
        TidyData <-aggregate(. ~Subject + Activity, ExtractedData, mean)
        TidyData <-TidyData[order(TidyData$Subject,TidyData$Activity),]
        write.table(TidyData, file = "tidydata.txt",row.name=FALSE)
