# CODEBOOK

Contains variable descriptions and pseudocode



##Variables in Tidy Data Set

As described in the raw data features.info.txt:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured 

at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 

acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 

signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 

(Note the 'f' to indicate frequency domain signals). 

* testsubject
* activity
* tbodyacc.std.x.mean
* tbodyacc.std.y.mean
* tbodyacc.std.z.mean
* tgravityacc.std.x.mean
* tgravityacc.std.y.mean
* tgravityacc.std.z.mean
* tbodyaccjerk.std.x.mean
* tbodyaccjerk.std.y.mean
* tbodyaccjerk.std.z.mean
* tbodygyro.std.x.mean
* tbodygyro.std.y.mean
* tbodygyro.std.z.mean
* tbodygyrojerk.std.x.mean
* tbodygyrojerk.std.y.mean
* tbodygyrojerk.std.z.mean
* tbodyaccmag.std.mean
* tgravityaccmag.std.mean
* tbodyaccjerkmag.std.mean
* tbodygyromag.std.mean
* tbodygyrojerkmag.std.mean
* fbodyacc.std.x.mean
* fbodyacc.std.y.mean
* fbodyacc.std.z.mean
* fbodyaccjerk.std.x.mean
* fbodyaccjerk.std.y.mean
* fbodyaccjerk.std.z.mean
* fbodygyro.std.x.mean
* fbodygyro.std.y.mean
* fbodygyro.std.z.mean
* fbodyaccmag.std.mean
* fbodybodyaccjerkmag.std.mean
* fbodybodygyromag.std.mean
* fbodybodygyrojerkmag.std.mean
* tbodyacc.mean.x.mean
* tbodyacc.mean.y.mean
* tbodyacc.mean.z.mean
* tgravityacc.mean.x.mean
* tgravityacc.mean.y.mean
* tgravityacc.mean.z.mean
* tbodyaccjerk.mean.x.mean
* tbodyaccjerk.mean.y.mean
* tbodyaccjerk.mean.z.mean
* tbodygyro.mean.x.mean
* tbodygyro.mean.y.mean
* tbodygyro.mean.z.mean
* tbodygyrojerk.mean.x.mean
* tbodygyrojerk.mean.y.mean
* tbodygyrojerk.mean.z.mean
* tbodyaccmag.mean.mean
* tgravityaccmag.mean.mean
* tbodyaccjerkmag.mean.mean
* tbodygyromag.mean.mean
* tbodygyrojerkmag.mean.mean
* fbodyacc.mean.x.mean
* fbodyacc.mean.y.mean
* fbodyacc.mean.z.mean
* fbodyaccjerk.mean.x.mean
* fbodyaccjerk.mean.y.mean
* fbodyaccjerk.mean.z.mean
* fbodygyro.mean.x.mean
* fbodygyro.mean.y.mean
* fbodygyro.mean.z.mean
* fbodyaccmag.mean.mean
* fbodybodyaccjerkmag.mean.mean
* fbodybodygyromag.mean.mean
* fbodybodygyrojerkmag.mean.mean

##Pseudo Code

The R script run_analysis.R will create this trasformation if the as long as the extacted data folder is present in your working directory 

R package dependancy is data.table

the following is a step by step process I used to tramsform the data.

1. Create a dataset for 8 text files found in the extracted data folder.
these files are X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt,
features.txt, activity.labels.txt

2. Add column names to X_test.txt and X_train.txt by adding features.txt as column names

3. get only the columns relating to mean and standard deviation in the column name from X_test.txt and X_train.txt

4. Add the column from subject_test.txt to X_text and the column from subject_train.txt to X_train.txt.

5. Transform y_test.txt and y_train.txt from numbers into activities listed in activity_labels.txt.

6. Add a new column for activities using the transformed y_test.txt to X_test.txt and the transformed y_train.txt to X_train.txt.

7. Combine X_test.txt and X_train.txt by into a new data set(total.data.set) with 10,299 obs and 68 columns.

8. remove hyphens capital letters and brakets from the column names in total.data.set.

10. Calculate the mean for variable for each activity performed by each participant in the study.

11. Return the resultin data set.
 