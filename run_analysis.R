# Transform the data from the "Human Activity Recognition Using Smartphones"

# Create one R script called run_analysis.R that does the following.
#
#    1.Merges the training and the test sets to create one data set.
#    2.Extracts only the measurements on the mean and standard deviation 
#      for each measurement. 
#    3.Uses descriptive activity names to name the activities in the data set
#    4.Appropriately labels the data set with descriptive variable names. 
#    5.From the data set in step 4, creates a second, independent tidy data set 
#      with the average of each variable for each activity and each subject.


#set the working directory for the new project
prjdir<-"C:/Users/e41538/Desktop/GitHub/WK4_Project"
setwd(prjdir)

#Load some libraries I like to work with
library(downloader)
library(data.table)
library(reshape2)
library(curl)

library(tidyr)
library(qdap)
library(dplyr)

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
     desiredFeatures<-grep(".*mean.*|.*std.*",featureNames[,2]) #use grep to get a vector of columns
     desiredFeatures.names<-featureNames[desiredFeatures,2]   #use the vector to pull the names

#1c load the data for train
typ="train"
mf<-paste(mydir,typ,sep="/")

#mf builds out the file path to the data subdirectory level (typ)

     subject_train<-tbl_df(read.table(paste(mf,"subject_train.txt",sep="/")))
     x_train<-tbl_df(read.table(paste(mf,"X_train.txt",sep="/")))
     y_train_activities<-tbl_df(read.table(paste(mf,"y_train.txt",sep="/")))


#1d load the test
typ="test"
mf<-paste(mydir,typ,sep="/")

     subject_test<-tbl_df(read.table(paste(mf,"subject_test.txt",sep="/")))
     x_test<-tbl_df(read.table(paste(mf,"X_test.txt",sep="/")))
     y_test_activities<-tbl_df(read.table(paste(mf,"y_test.txt",sep="/"))) 

     #bring the subjects together
     sb<-rbind(subject_train,subject_test)
     colnames(sb)<-("subjectID")
# bring the summary rows together for test and train
     xx<-rbind(x_train[,desiredFeatures],x_test[,desiredFeatures])
     colnames(xx)<-c(desiredFeatures.names)
#cleanup column names
     names(xx)<-gsub("^t","Time.",names(xx)) #expands the abreviations for time & freq
     names(xx)<-gsub("^f","Freq.",names(xx))
     names(xx)<-gsub("Gyro",".Gyroscope",names(xx))
     names(xx)<-gsub("Mag",".Magnitude.",names(xx)) 
     names(xx)<-gsub("Acc",".Acceleration.",names(xx)) 
     names(xx)<-sub("\\(\\)",".",names(xx)) #handles the (()) where it is in the middle
     names(xx)<-sub("\\(\\)$","",names(xx)) #handles the end of line (())

 #Bring Activity together and add text values to the dataset for ease of use
     act1<-rbind(y_train_activities,y_test_activities)
     act<-mutate(act1,lookup(act1[,1],activityNames) )
     colnames(act)<-c("activitycode","activity")


#bring columns together -Subjects, Activities and Summary Values
     masData<-cbind(sb,act,xx)
#    write.table(masData,file="masdata.txt") # this is just the interim file -I wanted to do some tabs on it

## The above code completes steps 1-4 of the project
     
     #    1.Merges the training and the test sets to create one data set.
     #    2.Extracts only the measurements on the mean and standard deviation 
     #      for each measurement. 
     #    3.Uses descriptive activity names to name the activities in the data set
     #    4.Appropriately labels the data set with descriptive variable names. 
     
# Step 5  From the data set in step 4, creates a second, independent tidy data set 
     #      with the average of each variable for each activity and each subject.
     
     # https://rpubs.com/bradleyboehmke/data_wrangling
     
# work in progress
     
tidy_data <-gather(masData,variableName,Value,4:82)
    tidy_data[,c("subjectID","activity","variableName","Value")] %>%
          group_by(subjectID,activity,variableName)              %>% 
               summarise(avg_val=mean(Value))                     %>%
                    write.table(file="tidy_data.txt", row.name=FALSE)  
   
     
     

          
     