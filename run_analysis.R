# load the required packages.  they are already installed if you are using RStudio
require(dplyr)
require(utils)

# download and expand arcive containing dataset if necessary
if (!dir.exists("UCI HAR Dataset")) {
  if (!file.exists("ucihar.zip"))
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  "ucihar.zip", method="curl")
  unzip("ucihar.zip")
}

#
# merge the training and the test data to create one data set. (requirement 1)
#   notes:
#   + For convenience of implementation, the activity column represented by table 'y' 
#         and the subject column are not bound at this time.  see below for details
#
#   + Per README.txt, the 'Intertial Data' folders contains unprocessed accelerometer 
#         and gyroscope signal data and thus was intentionally omitted as it is
#         outside the scope of this exercise
#   
har <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"),
           read.table("UCI HAR Dataset/test/X_test.txt"))
y <- rbind(read.table("UCI HAR Dataset/train/y_train.txt"),
           read.table("UCI HAR Dataset/test/y_test.txt"))
subject <-rbind(read.table("UCI HAR Dataset/train/subject_train.txt"),
                read.table("UCI HAR Dataset/test/subject_test.txt"))

# Appropriately label the data set with descriptive variable names. (requirement 4)
names(har)<-read.table(file.path(dataPath,"features.txt"))$V2

# Extract only the measurements on the mean and standard deviation for each measurement. (requirement 2)
#    note: meanFreq columns are intentionally included
har<-subset(har,select= grep("mean|std",features$V2,value=TRUE))

# normalize feature names by removing non-alphanumeric characters and making lowercase
names(har) <- names(har) %>% tolower %>% gsub("-","",.) %>% gsub("\\()","",.)

# bind the activity and subject columns
har<-cbind("Activity"=y$V1,har)
har<-cbind("Subject"=subject$V1,har)

# Use descriptive activity names to name the activities in the data set (requirement 3)
activityLabels<- read.table(file.path(dataPath,"activity_labels.txt"))$V2 %>% tolower %>% sub("_","",.)
x$Activity=cut(har$Activity,breaks=c(0:length(activityLabels)),labels=activityLabels)

# create a second, independent tidy data set with the average of each variable for each activity and each subject. (requirement 5)
harAvg <- har %>% group_by(Subject,Activity) %>% summarize_all( mean )

# prepend "avg" to each variable name except the first two: subject and activity
#   note: if this behavior is not deseriable, remove or comment the following line:
names(harAvg)<-c(names(harAvg)[1:2], sapply(names(harAvg)[-(1:2)], function(x) paste("avg",x,sep="")))

# write the output file required by the submission instructions
write.table(harAvg,"harAvg.txt",row.names = FALSE)


