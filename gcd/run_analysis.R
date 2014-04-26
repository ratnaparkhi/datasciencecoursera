#run_anlysis.R
# Performs the following.
# 1.  Merges the training and the test sets to create one data set.
#     [Assumption - (i) Data from diretories Intertial Signals is not used, because 
#     the data from respective subject, X, y files is assumed to be the processed 
#     form of the raw data in Inertial Signals directories. 
#      (ii) So, only the Data from X_train.txt, y_train.txt, subject_train.txt and 
#      X_test.txt, y_test.txt, subject_test.txt is used alongwith features.txt and 
#      activity_labels.txt. ]
# 2.	Extracts only the measurements on the mean and standard deviation for 
#     each measurement. 
#     [Assumption - Measurements like meanfreq() are to be included.]
# 3.	Uses descriptive activity names to name the activities in the data set
# 4.	Appropriately labels the data set with descriptive activity names. 
# 5.	Creates a second, independent tidy data set with the average of each 
#     variable for each activity and each subject. 
#     Output tidy set file is UCI-HAR-TidyDataset.csv
#     All processing - extracting files and creating tidy output
#     is done in current directory. 

library(reshape2)

## Step 0 - Unzip getdata-projectfiles-UCI HAR Dataset.zip in current directory.
# Assumption - getdata-projectfiles-UCI HAR Dataset.zip should be in current directory. 

unzip("getdata-projectfiles-UCI HAR Dataset.zip")

## Step 1 - Merge the training and test data sets to create one data set. 
# Read features info - to be used as labels.
featuresfile = "UCI Har Dataset\\features.txt"
features = read.table(featuresfile)
flabels = features[, 2]
# Get and combine training data
ftrain = "UCI HAR Dataset\\train\\x_train.txt"
dtrain = read.table(ftrain)
names(dtrain) = flabels

ftrainsubject = "UCI HAR Dataset\\train\\subject_train.txt"
dtrainsub = read.table(ftrainsubject)
names(dtrainsub) = "subject"

ftrainactivity = "UCI HAR Dataset\\train\\y_train.txt"
dtrainact = read.table(ftrainactivity)
names(dtrainact) = "activity"
#dim(dtrainact)

m1dtrain = cbind(dtrainact, dtrain)
totaltrain = cbind(dtrainsub, m1dtrain)
#dim(totaltrain)

# Get and combine test data
ftest = "UCI HAR Dataset\\test\\x_test.txt"
dtest = read.table(ftest)
names(dtest) = flabels

ftestsubject = "UCI HAR Dataset\\test\\subject_test.txt"
dtestsub = read.table(ftestsubject)
names(dtestsub) = "subject"

ftestactivity = "UCI HAR Dataset\\test\\y_test.txt"
dtestact = read.table(ftestactivity)
names(dtestact) = "activity"
#dim(dtestact)

m1dtest = cbind(dtestact, dtest)
totaltest = cbind(dtestsub, m1dtest)
#dim(totaltest)

# Combine train and test data
subactdata = rbind(totaltrain, totaltest)
#dim(subactdata)

## Step 2.  Extract only the measurements on the mean and standard deviation for 
# each measurement. Only those features with 'mean()' or 'std()' in their names 
# extracted. Features with 'Mean' in their name are ignored. 
# 
colnames = tolower(names(subactdata)) 
names(subactdata) = colnames
selcols = grep('mean()|std()', colnames)
selcols = c(1,2,selcols)
#length(selcols)
sadata = subactdata[,selcols]
#dim(sadata)
#Exclude measurements with names like 'angle(tbodyaccmean,gravity)' as 
#these are not means. 
colnames1 = names(sadata)
selcols1 = grep('^angle', colnames1)
# length(selcols1)
sadata1 = sadata[,-selcols1]
#dim(sadata1)

## Step 3.  Use descriptive activity names to name the activities in the data set
# Description names are -1 WALKING, 2 WALKING UPSTAIRS' 3 WALKING DOWNSTAIRS' 4 SITTING
# 5 STANDING and 6 LAYING
# 
sadata1$activity = gsub('1', 'Walking', sadata1$activity)
sadata1$activity = gsub('2', 'Walking Upstairs', sadata1$activity)
sadata1$activity = gsub('3', 'Walking Downstairs', sadata1$activity)
sadata1$activity = gsub('4', 'Sitting', sadata1$activity)
sadata1$activity = gsub('5', 'Standing', sadata1$activity)
sadata1$activity = gsub('6', 'Laying', sadata1$activity)

## 4.  Labels the data set with descriptive activity names. 
# This is done in step 3. 

# Sort the data on subject followed by activity
subData = sadata1[order(sadata1$subject, sadata1$activity), ]

## Step 5. Create a second, independant tidy data se with the average of 
# each variable for each activity and each subject. 

# Create a list of varialbes.
varnames = names(subData)
vars = varnames[3:length(varnames)]
subDataMelted = melt(subData, id=c("subject", "activity"), message.vars = vars)
subActMeanData = dcast(subDataMelted, subject+activity ~ variable, mean)
#dim(subActMeanData)
write.table(subActMeanData, "UCI-HAR-TidyDataset.txt", sep=",")
unlink("UCI Har Dataset", recursive=TRUE)



