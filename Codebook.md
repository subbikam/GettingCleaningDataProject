## The Codebook describes the variables, the data, and any transformations or work that were performed to clean up the data 

### Steps performed on the unzipeed data set is as follows
1. Read the raw contents from folders in R (test and train data of X, Y, Activity, Features)
2. Combine test and train data of X into a single data frame
3. Combine test and train data of y into a single data frame
4. Combine test and train data of Subject into a single data frame
5. Create an object mean_and_std for storing names of measures that have mean or std in them
6. Combine all data of X, Y, Subject data. Also, join the activity description data frame
7. Filter the data frame to only those variables that match with mean_and_std
8. Take the mean of mean and std variables, and summarize by subject and activity 
9. Write the output into a text file called 'tidydata.txt'

#### Variable names are as follows:

##### Raw Data
These variables store the data as they are read from individual files
* subject_test & subject_train: contains the subjects (1 to 30)
* x_test and x_train: contain the data of 561 variables in both test and training mode
* y_test and y_train: contain the activity labels for each record in x
* activity labels: contain the mapping of activity labels to activity (walking, running etc)
* features: contain the mapping of feature names to the column headers of x test and train files


##### Transformation of Data
These variables store the data as they are transformed from raw data
* x_full : contains combined data of X test and train
* y_full: contains combined data of Y test and train
* subject_full: contains combined data of Subject test and train
* mean_and_std: contains list of variables that have mean or std in them. used for filtering column names 
* filter_data: first joins x_full, y_full, subject_full and then filters the records based on the column names in * mean_and_std
* filter_data_avg : means and std variables in filter_data are summarized based on subject and activity

##### Output
* tidydata.txt: is a text file containing the output of filter_data_avg dataframe
