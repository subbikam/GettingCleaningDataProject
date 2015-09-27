## The Codebook describes the variables, the data, and any transformations or work that were performed to clean up the data 

### The zip file is already copied and contents are extracted into the working directory. The name of the extracted folder is UCI HAR Dataset

#### Variable names are as follows:

##### Raw Data
subject_test & subject_train: contains the subjects (1 to 30)
x_test and x_train: contain the data of 561 variables in both test and training mode
y_test and y_train: contain the activity labels for each record in x
activity labels: contain the mapping of activity labels to activity (walking, running etc)
features: contain the mapping of feature names to the column headers of x test and train files


##### Transformation of Data
x_full : contains combined data of X test and train
y_full: contains combined data of Y test and train
subject_full: contains combined data of Subject test and train
mean_and_std: contains list of variables that have mean or std in them. used for filtering column names 
filter_data: first joins x_full, y_full, subject_full and then filters the records based on the column names in mean_and_std
filter_data_avg : means and std variables in filter_data are summarized based on subject and activity



##### Output
tidydata.txt: is a text file containing the output of filter_data_avg dataframe
