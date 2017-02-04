
#set the working directory for the new project
prjdir<-"C:/Users/e41538/Desktop/GitHub/WK4_Project"
setwd(prjdir)

#Load some libraries I like to work with
library(downloader)
library(data.table)
library(reshape2)
library(curl)
library(dplyr)
library(tidyr)

# Create one R script called run_analysis.R that does the following.
#
#    1.Merges the training and the test sets to create one data set.
#    2.Extracts only the measurements on the mean and standard deviation 
#      for each measurement. 
#    3.Uses descriptive activity names to name the activities in the data set
#    4.Appropriately labels the data set with descriptive variable names. 
#    5.From the data set in step 4, creates a second, independent tidy data set 
#      with the average of each variable for each activity and each subject.

# 0.  Get the data
source<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zippy <-"HARDATA"
download(source,zippy,mode="wb")
unzip(zippy)

#1A Load the activities 
mydir<-"UCI HAR Dataset"
activityNames<-read.table("UCI HAR Dataset/activity_labels.txt")
activityNames
#1b load the features
featureNames<-read.table("UCI HAR Dataset/features.txt")
featureNames


#1B  Load the training and test data sets