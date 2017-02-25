# ProgrammingAssignment4 - run_analysis()

This repo contains 3 files

* Codebook.md - the codebook describing the data
* README.md - this file
* run_analysis.R - the R script to perform the analysis

For this assignment, a function called **run_analysis()** is created. This function would read the information from the following files via its inner function **read_labels_features()**

* activity_labels.txt
* features.txt

After that, the **run_analysis()** function would make use of the **read_dataset()** function, to read the following files

* test/subject_test.txt
* test/y_test.txt
* test/X_test.txt
* train/subject_train.txt
* train/y_train.txt
* train/X_train.txt

Because the data reading task for both data sets are the same, a single function was created.

The **run_analysis()** function choose only the mean & std values from the data and calculate their average values according to different subject and activity.

The procedures for procuding the necessary data are as following:

1. Read the activity_labels & features
2. Read the X_test/X_train, y_test/y_train, subject_test/subject_train
3. Combine the read data to all_X, all_y & all_subject
4. Apply the values of the features to be the column names of all_X
5. Create a data frame called "data" which "cbind" all_subject, all_y & all_X
6. Create another data frame called average_data
7. For samples having the same feature & activity, we calculate the average values and append them to the average_data
8. For the Activity column of the average_data, replace its values from numberic id to string, following the activity labels

For each row, it contains the following information

* Subject
* Activity
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z 
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X

