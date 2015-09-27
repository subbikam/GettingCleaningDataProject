library(plyr)


##Get files from Working Directory. Zip files are already extracted in WD
subject_test <- read.table(".//UCI HAR Dataset//test//subject_test.txt")
x_test <- read.table(".//UCI HAR Dataset//test//X_test.txt")
y_test <- read.table(".//UCI HAR Dataset//test//Y_test.txt")


subject_train <- read.table(".//UCI HAR Dataset//train//subject_train.txt")
x_train <- read.table(".//UCI HAR Dataset//train//X_train.txt")
y_train <- read.table(".//UCI HAR Dataset//train//Y_train.txt")

activity_labels <- read.table(".//UCI HAR Dataset//activity_labels.txt")
features <-read.table(".//UCI HAR Dataset//features.txt")

##1. Merges the training and the test sets to create one data set.

x_full <- rbind(x_test, x_train)
##assign names of features to headers of x_full
names(x_full) <- features[,2]


##2. Extracts only the measurements on the mean and standard deviation for each measurement.
colnames<- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

colnames_chart<-as.character(colnames)


x_filter<-subset(x_full,select=colnames_chart)

##create new set of subject data
subject_full <- rbind(subject_test, subject_train)
names(subject_full)<-"Subject"

## create a full set of Y data

y_full <- rbind(y_test, y_train)
names(y_full) <- "Activity"


##combine mean and std filtered with activity labels
filter_data <- cbind(subject_full, y_full, x_filter)

mean_and_std<- x_full[grep("mean\\(\\)|std\\(\\)", names(x_full)),]

##name labels of activity
names(activity_labels)<- c("Activity", "ActivityDescription")


##3. Uses descriptive activity names to name the activities in the data set
filter_data <- join(filter_data,activity_labels, by="Activity")


##4. Appropriately labels the data set with descriptive variable names. 
names(filter_data)<-gsub("^t", "Time ", names(filter_data))
names(filter_data)<-gsub("^b", "Body ", names(filter_data))
names(filter_data)<-gsub("Acc", "Acceleration ", names(filter_data))
names(filter_data)<-gsub("mean()", "Mean ", names(filter_data))
names(filter_data)<-gsub("()", "", names(filter_data))
names(filter_data)<-gsub("^f", "Frequency ", names(filter_data))
names(filter_data)<-gsub("Gyro", "Gyroscopic ", names(filter_data))
names(filter_data)<-gsub("std", "Std Dev ", names(filter_data))

##bring up column name
col_id <- grep("ActivityDescription", names(filter_data))


filter_data <- filter_data[, c(col_id,(1:ncol(filter_data))[-col_id])]




##5. From the data set in step 4, creates a second, independent tidy data set with 
##the average of each variable for each activity and each subject.
filter_data_avg <- aggregate(. ~Subject + Activity, filter_data, mean)

filter_data_avg <- subset(filter_data_avg, select=-ActivityDescription)
filter_data_avg <- join(filter_data_avg,activity_labels, by="Activity")

write.table(filter_data_avg, file = "tidydata.txt",row.name=FALSE)
