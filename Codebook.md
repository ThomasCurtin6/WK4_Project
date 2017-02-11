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

-LAYING

-SITTING

-STANDING

-WALKING

-WALKING_DOWNSTAIRS

-WALKING_UPSTAIRS


* **variableName**  -the measurement variable summarized from the trial.  

* **variableNames**
Freq.Body.Acceleration..Magnitude.-mean.
Freq.Body.Acceleration..Magnitude.-meanFreq.
Freq.Body.Acceleration..Magnitude.-std.
Freq.Body.Acceleration.Jerk-mean.-X
Freq.Body.Acceleration.Jerk-mean.-Y
Freq.Body.Acceleration.Jerk-mean.-Z
Freq.Body.Acceleration.Jerk-meanFreq.-X
Freq.Body.Acceleration.Jerk-meanFreq.-Y
Freq.Body.Acceleration.Jerk-meanFreq.-Z
Freq.Body.Acceleration.Jerk-std.-X
Freq.Body.Acceleration.Jerk-std.-Y
Freq.Body.Acceleration.Jerk-std.-Z
Freq.Body.Acceleration.-mean.-X
Freq.Body.Acceleration.-mean.-Y
Freq.Body.Acceleration.-mean.-Z
Freq.Body.Acceleration.-meanFreq.-X
Freq.Body.Acceleration.-meanFreq.-Y
Freq.Body.Acceleration.-meanFreq.-Z
Freq.Body.Acceleration.-std.-X
Freq.Body.Acceleration.-std.-Y
Freq.Body.Acceleration.-std.-Z
Freq.Body.Gyroscope-mean.-X
Freq.Body.Gyroscope-mean.-Y
Freq.Body.Gyroscope-mean.-Z
Freq.Body.Gyroscope-meanFreq.-X
Freq.Body.Gyroscope-meanFreq.-Y
Freq.Body.Gyroscope-meanFreq.-Z
Freq.Body.Gyroscope-std.-X
Freq.Body.Gyroscope-std.-Y
Freq.Body.Gyroscope-std.-Z
Freq.BodyBody.Acceleration.Jerk.Magnitude.-mean.
Freq.BodyBody.Acceleration.Jerk.Magnitude.-meanFreq.
Freq.BodyBody.Acceleration.Jerk.Magnitude.-std.
Freq.BodyBody.Gyroscope.Magnitude.-mean.
Freq.BodyBody.Gyroscope.Magnitude.-meanFreq.
Freq.BodyBody.Gyroscope.Magnitude.-std.
Freq.BodyBody.GyroscopeJerk.Magnitude.-mean.
Freq.BodyBody.GyroscopeJerk.Magnitude.-meanFreq.
Freq.BodyBody.GyroscopeJerk.Magnitude.-std.
Time.Body.Acceleration..Magnitude.-mean.
Time.Body.Acceleration..Magnitude.-std.
Time.Body.Acceleration.Jerk.Magnitude.-mean.
Time.Body.Acceleration.Jerk.Magnitude.-std.
Time.Body.Acceleration.Jerk-mean.-X
Time.Body.Acceleration.Jerk-mean.-Y
Time.Body.Acceleration.Jerk-mean.-Z
Time.Body.Acceleration.Jerk-std.-X
Time.Body.Acceleration.Jerk-std.-Y
Time.Body.Acceleration.Jerk-std.-Z
Time.Body.Acceleration.-mean.-X
Time.Body.Acceleration.-mean.-Y
Time.Body.Acceleration.-mean.-Z
Time.Body.Acceleration.-std.-X
Time.Body.Acceleration.-std.-Y
Time.Body.Acceleration.-std.-Z
Time.Body.Gyroscope.Magnitude.-mean.
Time.Body.Gyroscope.Magnitude.-std.
Time.Body.GyroscopeJerk.Magnitude.-mean.
Time.Body.GyroscopeJerk.Magnitude.-std.
Time.Body.GyroscopeJerk-mean.-X
Time.Body.GyroscopeJerk-mean.-Y
Time.Body.GyroscopeJerk-mean.-Z
Time.Body.GyroscopeJerk-std.-X
Time.Body.GyroscopeJerk-std.-Y
Time.Body.GyroscopeJerk-std.-Z
Time.Body.Gyroscope-mean.-X
Time.Body.Gyroscope-mean.-Y
Time.Body.Gyroscope-mean.-Z
Time.Body.Gyroscope-std.-X
Time.Body.Gyroscope-std.-Y
Time.Body.Gyroscope-std.-Z
Time.Gravity.Acceleration..Magnitude.-mean.
Time.Gravity.Acceleration..Magnitude.-std.
Time.Gravity.Acceleration.-mean.-X
Time.Gravity.Acceleration.-mean.-Y
Time.Gravity.Acceleration.-mean.-Z
Time.Gravity.Acceleration.-std.-X
Time.Gravity.Acceleration.-std.-Y
Time.Gravity.Acceleration.-std.-Z

* **avg_val**         -the mean of the value for each original measurement summarized at the subjectID and activity level

###Sample Data
        
 subjectID    activity                        variableName    avg_val
----------- -------------------  ------------------------- ------------------ 
      <int>    <chr>                               <chr>       <dbl>
         1   LAYING     Freq.Body.Acceleration.-mean.-X   -0.93909905
         1   LAYING     Freq.Body.Acceleration.-mean.-Y   -0.86706521
         1   LAYING     Freq.Body.Acceleration.-mean.-Z   -0.88266688
         1   LAYING Freq.Body.Acceleration.-meanFreq.-X   -0.15879267
         1   LAYING Freq.Body.Acceleration.-meanFreq.-Y    0.09753484
         1   LAYING Freq.Body.Acceleration.-meanFreq.-Z    0.08943766
     
###Reading the tidy_data.txt file back into R

     once downloaded, this data can be easily read with the following code:

     *chk<-read.table(file="tidy_data.txt", header=TRUE)*

This creates a simple data frame with 14,220 observations and four variables




