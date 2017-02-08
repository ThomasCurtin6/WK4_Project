---
title: "CodeBook"
author: "Thomas Curtin"
date: "February 8, 2017"
output: html_document
---

#Code Book for Tidy UCI HAR Dataset

This codebook describes the data in the output file tidy_data.txt created by the run_analysis.r file found in this subdirectory.  For information about the original project, "Human Activity Recognition Using Smartphones"  please visit this site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The README.md file also stored in this project provides information about the original source of the data located here:

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names


#Interim source data set

The source data was gathered using the tidyr Package to create a interim summarised view with 813,621 observations and 5 variables organized in a narrow/tall format. 



This contained the following information:

**subjectID**     -The identifier for each participant/subject with values ranging from 1-30

**activitycode**  -The identifier code for each activity with values ranging from 1-6

**activity**      -The english text description of the activity corresponding to the six activity                       code values

**variableName**  -The english text containing original numeric measurement name

**Value**         -The value for each original measurement




subjectID activitycode   activity              variableName                Value
--------- -------------  --------------  --------------------------------  --------------------
     1         5         STANDING        Time.Body.Acceleration.-mean.-X    0.2885845
     1         5         STANDING        Time.Body.Acceleration.-mean.-X    0.2784188
     1         5         STANDING        Time.Body.Acceleration.-mean.-X    0.2796531


# Final published tidy_data.txt file


This summarised data was then grouped per instructions to create a text file with 3 variables and 180 observations organized in a narrow/tall format

The code to produce this was:

     tidy_data <- gather(masData,variableName,Value,4:82) %>% 
        group_by(subjectID,activity) %>% 
           summarise(avg_val=mean(Value)) %>%          
               write.table(file="tidy_data.txt", row.name=FALSE)



* **subjectID**     -The identifier for each participant/subject with values ranging from int 1-30
* **activity**      -the english text description of the activity 
* **avg_val**         -the mean of the value for each original measurement summarized at the subjectID and activity level

        

subjectID                   activity            avg_val
---------------------    ------------------- ------------------   
     1                   LAYING                -0.5629116
     1                   SITTING               -0.5847260
     1                   STANDING              -0.6042467
     1                   WALKING               -0.1630823
     1                   WALKING_DOWNSTAIRS    -0.1233816
     1                   WALKING_UPSTAIRS      -0.3071040
     
###Reading the tidy_data.txt file back into R

     once downloaded, this data can be easily read with the following code:

     *chk<-read.table(file="tidy_data.txt", header=TRUE)*

This creates a simple data frame with 180 observations and three variables




