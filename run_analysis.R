
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

#1a Load the activities 
#  I'm using mydir to build file path
mydir<-"UCI HAR Dataset"
dir(mydir)

activityNames<-read.table(paste(mydir,"activity_labels.txt",sep="/"))
     activityNames[,2]<-as.character(activityNames[,2])
                      
                                     

#1b load the features and get a list of the desired features (means & std dev)
featureNames<-read.table(paste(mydir,"features.txt",sep="/"))
     featureNames[,2]<-as.character(featureNames[,2])
     desiredFeatures<-grep(".*mean.*|.*std.*",featureNames[,2])
     desiredFeatures.names<-featureNames[desiredFeatures,2]
#1c load the data for train
typ="train"
mf<-paste(mydir,typ,sep="/")
#mf builds out the file path to the data subdirectory level (typ)

     subject_train<-read.table(paste(mf,"subject_train.txt",sep="/"))
     x_train<-read.table(paste(mf,"X_train.txt",sep="/"))
     y_train<-read.table(paste(mf,"y_train.txt",sep="/"))

#1d load the test
typ="test"
mf<-paste(mydir,typ,sep="/")

     subject_test<-read.table(paste(mf,"subject_test.txt",sep="/"))
     x_test<-read.table(paste(mf,"X_test.txt",sep="/"))
     y_test<-read.table(paste(mf,"y_test.txt",sep="/"))                        
                    
