Assignment - Getting and Cleaning the Accelerometer Data
========================================================

1) Overview
===========
A) run_analysis.R - This file has the all the required R code for the assignment. Execute this file to generate the tidy dataset. It does the following - 
i) Unzip "getdata-projectfiles-UCI HAR Dataset.zip" in the current directory. 
ii) Complete the processing setps for the assignment and create a tidy data set file named - UCI-HAR-TidyDataset.txt [Note: Assignment Purpose/Goals are copied in Section 3 below for reference]
iii) Deletes (unlinks) the unzipped (extracted) raw data files. 

B) run_analysis.R Execution Summary
i) All the processing is done in current directory.
["getdata-projectfiles-UCI HAR Dataset.zip" must be present in current directory.]
ii) Approximate space requirement is 330 Mb.
iii) Tested on Windows 2008 R2 64bit OS with 8GB memory server. 
iv) Approximate time required to successfully execute  2 minutes. 
v) The tidy set has 181 rows (including header) and 81 columns. 

C) Code_book.md - Describes the variables, the data, and the transformations and processing performed by run_analysis.R to clean up the given data and generate the tidy data set - UCI-HAR-TidyDataset.txt. 

2) Processing steps/transformation done in run_analysis.R and assumptions. 
==========================================================================

1.  Merge the training and the test sets to create one data set.
    [Assumption - (i) Data from diretories Intertial Signals are not used, because 
    the data from respective subject, X, y files are assumed to be the processed 
    form of the raw data in Inertial Signals directories. 
    (ii) So, only the Data from X_train.txt, y_train.txt, subject_train.txt and 
    X_test.txt, y_test.txt, subject_test.txt are used alongwith features.txt and 
    activity_labels.txt.]
2.  Extract only the measurements on the mean and standard deviation for 
    each measurement. 
    [Assumption - Measurements like meanfreq() are to be included.]
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately label the data set with descriptive activity names. 
5.	Create a second, independent tidy data set with the average of each 
    variable for each activity and each subject. 
    Output tidy set file is UCI-HAR-TidyDataset.txt
    [NOte: All processing including extracting files and creating tidy output
    is done in current directory.] 

3) Assignment Purpose/Goal
==========================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

1.  Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive activity names. 
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


