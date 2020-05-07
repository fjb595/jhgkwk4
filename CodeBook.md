This repo provides a script 'run_analysis.R' which downloads the UCI HAR  dataset 
from the URL listed below, and performs the following modifications
in order to facilitate further analysis:

* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each measurement.

* Uses descriptive activity names to name the activities in the data set.  The
  activity names are:
  + walking
  + walkingupstairs
  + walkingdownstairs
  + sitting
  + standing
  + laying

* Appropriately labels the data set with descriptive variable names.

* From the data set in the previous step, creates a second, independent tidy data set with
  the average of each variable for each activity and each subject.

Two datasets are created by run_analysis.R: har and harAvg.  Both datasets include the subset
of variables from the UCI HAR dataset listed below.  These variables are described in 
features_info.txt in the source dataset.  Note: to simplify further analysis, the variable
names have been converted to lower case and non-alphanumeric characters were removed.

The harAvg dataset consists of the average values of the variables listed below for each
activity and subject.  Note: 'avg' was prepended to each variable name except for 
Subject and Activity.


tbodyaccmeanx
tbodyaccmeany
tbodyaccmeanz
tbodyaccstdx
tbodyaccstdy
tbodyaccstdz
tgravityaccmeanx
tgravityaccmeany
tgravityaccmeanz
tgravityaccstdx
tgravityaccstdy
tgravityaccstdz
tbodyaccjerkmeanx
tbodyaccjerkmeany
tbodyaccjerkmeanz
tbodyaccjerkstdx
tbodyaccjerkstdy
tbodyaccjerkstdz
tbodygyromeanx
tbodygyromeany
tbodygyromeanz
tbodygyrostdx
tbodygyrostdy
tbodygyrostdz
tbodygyrojerkmeanx
tbodygyrojerkmeany
tbodygyrojerkmeanz
tbodygyrojerkstdx
tbodygyrojerkstdy
tbodygyrojerkstdz
tbodyaccmagmean
tbodyaccmagstd
tgravityaccmagmean
tgravityaccmagstd
tbodyaccjerkmagmean
tbodyaccjerkmagstd
tbodygyromagmean
tbodygyromagstd
tbodygyrojerkmagmean
tbodygyrojerkmagstd
fbodyaccmeanx
fbodyaccmeany
fbodyaccmeanz
fbodyaccstdx
fbodyaccstdy
fbodyaccstdz
fbodyaccmeanfreqx
fbodyaccmeanfreqy
fbodyaccmeanfreqz
fbodyaccjerkmeanx
fbodyaccjerkmeany
fbodyaccjerkmeanz
fbodyaccjerkstdx
fbodyaccjerkstdy
fbodyaccjerkstdz
fbodyaccjerkmeanfreqx
fbodyaccjerkmeanfreqy
fbodyaccjerkmeanfreqz
fbodygyromeanx
fbodygyromeany
fbodygyromeanz
fbodygyrostdx
fbodygyrostdy
fbodygyrostdz
fbodygyromeanfreqx
fbodygyromeanfreqy
fbodygyromeanfreqz
fbodyaccmagmean
fbodyaccmagstd
fbodyaccmagmeanfreq
fbodybodyaccjerkmagmean
fbodybodyaccjerkmagstd
fbodybodyaccjerkmagmeanfreq
fbodybodygyromagmean
fbodybodygyromagstd
fbodybodygyromagmeanfreq
fbodybodygyrojerkmagmean
fbodybodygyrojerkmagstd
fbodybodygyrojerkmagmeanfreq


UCI HAR dataset URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip































UCI Har URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip