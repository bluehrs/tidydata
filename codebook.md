Inputted raw data files:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

Outputted tidy data set:

- "tidy.txt"

- includes the average of each variable (aka feature) for each activity and each subject for only the mean() and std() variables (only 66 retained of the original 561 variables in the raw data)

- please see comments within "run_analysis.R" for step-by-step walkthrough or see them below:

#read all files into data frames
#add subjects and activities to test data frame
#add subjects and activities to train data frame
#combine test and train into one combined data frame
#add variable names to combined data frame from features data frame
#find mean and std variables
#remove meanFreq variable if accidentally included
#keep only mean and std variables and subject and activity
#turn activity numbers into names
#create tidy data set with average of each variable for each activiy and subject
#write tidy data set to file