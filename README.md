# ProgrammingAssignment4 - run_analysis()

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
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
