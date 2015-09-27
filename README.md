## Document for Scripts in Getting Cleaning Data Project 
###This document explains how all of the scripts work and how they are connected


###The R file run_analysis.R does the following sequence of tasks:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Steps to execute the script
* Download the zip file from; https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Save the zip file in the working directory
* Unzip the file into a folder called "UCI HAR Dataset" and save it in the working directory
* Run the script "run_analysis.R"
* The output of the script is a file titled 'tidydata.txt' in the working directory

##Packages Required
The script requires (plyr) package and will install automatically

