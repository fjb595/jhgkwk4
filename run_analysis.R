# d/l and expand arcive containing dataset
if (!file.exists("ucihar.zip"))
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                "ucihar.zip", method="curl")
unzip("ucihar.zip")

# path to dataset root
dataPath<-"UCI HAR Dataset"

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
x <- rbind(read.table(file.path(dataPath,"train","X_train.txt")),
           read.table(file.path(dataPath,"test","X_test.txt")))
y <- rbind(read.table(file.path(dataPath,"train","y_train.txt")),
           read.table(file.path(dataPath,"test","y_test.txt")))
subject <-rbind(read.table(file.path(dataPath, "train","subject_train.txt")),
                read.table(file.path(dataPath, "test","subject_test.txt")))

# Appropriately label the data set with descriptive variable names. (requirement 4)
names(x)<-read.table(file.path(dataPath,"features.txt"))$V2

# Extract only the measurements on the mean and standard deviation for each measurement. (requirement 2)
#    note: meanFreq columns are intentionally included
x<-subset(x,select= grep("mean|std",features$V2,value=TRUE))

# normalize feature names by removing non-alphanumeric characters and making lowercase
names(x) <- names(x) %>% tolower %>% gsub("-","",.) %>% gsub("\\()","",.)

# bind the activity and subject columns
x<-cbind("Activity"=y$V1,x)
x<-cbind("Subject"=subject$V1,x)

# Use descriptive activity names to name the activities in the data set (requirement 3)
activityLabels<- read.table(file.path(dataPath,"activity_labels.txt"))$V2 %>% tolower %>% sub("_","",.)
x$Activity=cut(x$Activity,breaks=c(0:length(activityLabels)),labels=activityLabels)

# create a second, independent tidy data set with the average of each variable for each activity and each subject. (requirement 5)
xAvg <- x %>% group_by(Subject,Activity) %>% summarize_all( mean )

# prepend "avg" to each variable name except the first two: subject and activity
#   note: if this behavior is not deseriable, remove or comment the following line:
names(xAvg)<-c(names(xAvg)[1:2], sapply(names(xAvg)[-(1:2)], function(x) paste("avg",x,sep="")))


