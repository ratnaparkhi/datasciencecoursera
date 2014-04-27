Code book for Accelerometer Tidy Data set
========================================

A) Tidy data: UCI-HAR-TidyDataset.txt
=====================================
This tidy dataset is created by running the steps give in 'C' below on the raw dataset given in 'B' below. 


B) Raw data
===========
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The raw dataset is generated/created for Human Activity Recognition using Samsung 
Smartphones. The data are generated from experiements on 30 subjects. Subjects wore 
waist-mounted smartphone with embedded inertial sensors, and performed 6 activities of daily living such as - Walking, Sitting, Walking upstairs etc. Further desription of the raw data is available at - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and also inside the readme files accompanying the raw dataset. 


C) Processing/Transformations done on raw data to create tidy data set
======================================================================

To get tidy data set from raw data, execute run_analysis.R. The raw data set zip file must be present in the current data directory. 

1.  The raw data was divided in two sets training and test for machine 
    learning purposes. Merged the training and the test sets to create one 
    data set.
    [Assumption - (i) Data from diretories Intertial Signals are not used, because 
    the data from respective subject, X, y files are assumed to be the processed 
    form of the raw data in Inertial Signals directories. 
    (ii) So, only the Data from X_train.txt, y_train.txt, subject_train.txt and 
    X_test.txt, y_test.txt, subject_test.txt are used alongwith features.txt and 
    activity_labels.txt.]
2.  The raw data had 561 features or measurements. Extracted only the 
    measurements on the mean and standard deviation for each measurement. 
    [Assumption - Measurements like meanfreq() are to be included.]
    This gave 79 features or mesurements to be included in the tidy data set. 
3.  Activity names were changed to include descriptive names given below instead 
    of codes. [(1) Walking, (2) Walking Upstairs, (3) Walking Downstairs, 
    (4) Sitting, (5) Standing, and (6) Laying] 
4.	Sorted the extracted data set, first on Subject and then on Activity.  
5.	The extracted data set had multiple readings for each measurement for 
    one subject for each activity. Hence each measurement is averaged (mean is
    computed) for each activity and each subject. This resulted in a data set with 
    180 rows (30 subject times 6 activities per subject) and 81 columns (79  measurements and Subject, Activity).

D) Description of variables in Tidy Data
========================================

1.  Each row in the tidy data set file has the average value of the extracted 79 measurements for one subject and one activity. There are 30 subjects and 6 activities. Hence the data set has 180 rows of averages of the extracted 79 measurements (features or variables). 

2. The extracted/selected 79 measurements (variables) are brifly described below : 
[Note: (i) The names containing 'Acc' indicate measurements from Accelerometer and names containing 'Gyro' indicate measurements from Gyroscope,and (ii) 't' in the name below represents time domain signal and 'f' represents 
frequency domain signal]


      (a) tbodyacc-xyz mean() or std(): 6 measurements with either mean or standard deviation 
of the body acceleration in X,Y and Z directions. 
[tbodyacc-mean()-x, tbodyacc-mean()-y, tbodyacc-mean()-z, tbodyacc-std()-x,      tbodyacc-std()-y, tbodyacc-std()-z]  


      (b) tgravityacc-xyz mean() or std(): 6 measurements with either mean or standard deviation of the gravity acceleration in X,Y and Z directions. 
[tgravityacc-mean()-x, tgravityacc-mean()-y, tgravityacc-mean()-z, tgravityacc-std()-x,      tgravityacc-std()-y, tgravityacc-std()-z]


      (c) tbodyaccjerk-xyz mean() or std(): 6 measurements with either mean or standard deviation of the body jerk in X,Y and Z directions. 
[tbodyaccjerk-mean()-x, tbodyaccjerk-mean()-y, tbodyaccjerk-mean()-z, tbodyaccjerk-std()-x,      tbodyaccjerk-std()-y, tbodyaccjerk-std()-z]


      (d) tbodygyro-xyz mean() or std(): 6 measurements with either mean or standard deviation of the gyroscope signal in X,Y and Z directions. 
[tbodygyro-mean()-x, tbodygyro-mean()-y, tbodygyro-mean()-z, tbodygyro-std()-x,      tbodygyro-std()-y, tbodygyro-std()-z]

      (d) tbodygyrojerk-xyz mean() or std(): 6 measurements with either mean or standard deviation of the jerk measurement from gyroscope in X,Y and Z directions. 
[tbodygyrojerk-mean()-x, tbodygyrojerk-mean()-y, tbodygyrojerk-mean()-z, tbodygyrojerk-std()-x,      tbodygyrojerk-std()-y, tbodygyrojerk-std()-z]

      (f) Magnitude of 3 dimensional signals in Euclidean norm: Following 18 (10 time domain and 8 frequency domain) measurements. 
tbodyaccmag mean() or std() 
tgravityaccmag mean() or std()
tbodyaccjerkmag mean() or std()
tbodygyromag mean() or std()
tbodygyrojerkmag mean() or std()
fbodyaccmag mean() or std()
fbodyaccJerkmag mean() or std()
fbodygyromag mean() or std()
fbodygyroJerkmag mean() or std()

      (g) Frequency domain mean() or std(): Similar to the time domain - 18 measurements - acc, jerk and gyro signal in X,Y,Z directions. 
fbodyacc-xyz mean() or std()
fbodyaccJerk-xyz mean() or std()
fbodygyro-xyz mean() or std() 

      (h) Mean frequency measurements: 13 measurements 
[fbodyaccjerk-meanfreq()-x,fbodyaccjerk-meanfreq()-y, fbodyaccjerk-meanfreq()-z,
fbodyacc-meanfreq()-x, fbodyacc-meanfreq()-y, fbodyacc-meanfreq()-z,        fbodygyro-meanfreq()-x, fbodygyro-meanfreq()-y, fbodygyro-meanfreq()-z, 
fbodyaccmag-meanfreq(), fbodybodyaccjerkmag-meanfreq(), fbodybodygyromag-meanfreq(), fbodybodygyrojerkmag-meanfreq()
