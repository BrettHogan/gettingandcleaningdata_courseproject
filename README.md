# README.MD

This Repo contains the following

*README.md - contains information about the raw data, the reasoning behind the transformation.

*Codebook.md - Contains the features in the transformed data set, and psuedocode to perform the transformations.

*run_analysis.R - contains the R script used to perform the Transformation.

*mytidydata2.txt - The data set after the transfomations


##RAW DATA

For the course project I used the data from this link where you can find all the information regarding the 
raw data collected from the accelerometers from the Samsung Galaxy S smartphone.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

here is the site where the data was obtained.    

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###Summary of Raw Data Set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record in te raw data set it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. Aset of 6 activities 
- An identifier of the subject who carried out the experiment. A set of 30 participants in the experiment

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

###References:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


##Reasoning behind Transformations

After combining the test and train data sets, and adding in the activity and participant into the raw data set 563 features were present with 10,299 observations.

I removed all capital letters, hyphens and brakets in the column names to adhere to clean data principles. I changed the activities from a number to a description of the activity.

I decided to focus on the features related to the mean and standard deviations of each variable resulting in a data set of 68 features and 10,299 variables.

I then calculated the mean of the mean and standard deviation for each participant and activity of the participant. 

this data set contains 68 features and 180 observations. One observation for each participant (30) doing each activity (6).

The R script run_analysis.R will create this trasformation if the as long as the extacted data folder is present in your working directory 

R package dependancy is data.table
