# run_analysis.R
#
# This function reads the following data
# activity_labels
# subjects
# train data & test data
#
# Then combine & find the average of the "mean" & "standard deviation" fields
#
run_analysis <- function() {
  
  read_labels_features <- function(basepath = character()) {

    #--------------------------------------------#
    # Format of activity_labels.txt is as following
    # 1 WALKING
    # 2 WALKING_UPSTAIRS
    # ...<DELETED>...
    # 6 LAYING
    
    activity_labels <- read.csv(paste0(basepath, "activity_labels.txt"), header=FALSE, sep=" ")
    colnames(activity_labels) <- c("id", "activity")
    
    #--------------------------------------------#
    # Format of features.txt is as following
    # 1 tBodyAcc-mean()-X
    # 2 tBodyAcc-mean()-Y
    # 3 tBodyAcc-mean()-Z
    # 4 tBodyAcc-std()-X
    # ...<DELETED>...
    # 561 angle(Z,gravityMean)
    
    features <- read.csv(paste0(basepath, "features.txt"), header=FALSE, sep=" ")
    colnames(features) <- c("id", "feature_name")
    
    list(activity_labels=activity_labels, features=features)
    
  }
  
  
  read_dataset <- function(basepath = character(), dataset = character()) {

    # ddd = dataset, which is either "train" or "test"
    
    #--------------------------------------------#
    # Format of ddd/subject_ddd.txt
    # subject_ddd.txt contains rows of integers (7392 in train), each for one sample
    # values : 1 - 30, which is one of the participants
    
    subject <- read.csv(paste0(basepath, dataset, "/subject_", dataset, ".txt"), header=FALSE, sep=" ")


    #--------------------------------------------#
    # Format of ddd/y_ddd.txt
    # y_ddd.txt contains rows of integers (7392 in train), each for one sample
    # values : 1 - 6, which is one of the activity labels

    y <- read.csv(paste0(basepath, dataset, "/y_", dataset, ".txt"), header=FALSE, sep=" ")

    
    #--------------------------------------------#
    # Format of ddd/X_ddd.txt
    # X_ddd.txt contains a matrix. The matrix contains many samples in rows (7392 in train)
    # each sample of data contains 561 features and each feature value is a 16-bytes fixed width number
    
    X <- read.fwf(paste0(basepath, dataset, "/X_", dataset, ".txt"), widths=rep(16, 561))

    
    list(subject=subject, y=y, X=X)
  }
  
  
  ### This part is the major part of the function
  
  ### Define the data path
  path <- "UCI HAR Dataset/"
  
  ### Read the activity_labels & features
  labels <- read_labels_features(path)
  activity_labels <- labels$activity_labels
  features <- labels$features
  
  train_data <- read_dataset(path, "train")
  test_data <- read_dataset(path, "test")
  
  # Combined data sets from test set & train set
  all_subject <- rbind(train_data$subject, test_data$subject)
  all_X <- rbind(train_data$X, test_data$X)
  all_y <- rbind(train_data$y, test_data$y)

  # Create columns for "subject" & "activity"
  colnames(all_subject) <- "Subject"
  colnames(all_y) <- "Activity"


  # Extract only columns of mean & std from X
  simplified_X <- all_X[, grep("(std|mean)\\(", features$feature_name)]
  colnames(simplified_X) <- features$feature_name[grep("(std|mean)\\(", features$feature_name)]

  # Combine the subjects and data into a single data frame
  data <- cbind(all_subject, all_y, simplified_X)

  average_data <- NULL
  
  # For each activity & each subject, find out the mean of all cols
  # Combine them into the average_data data frame
  for(i in 1:max(activity_labels$id)) {
    for(j in 1:max(all_subject)) {
      # tmp <- apply(data[data$Activity == i & data$Subject == j,], 2, mean)
      # if(!any(is.na(tmp)))
      #   average_data <- rbind(average_data, tmp)
      #   
      average_data <- rbind(average_data, apply(data[data$Activity == i & data$Subject == j,], 2, mean))
    }
  }

  # Change the numbers in y into text descriptions according to the Activity labels
  for(i in activity_labels$id) {
    average_data[average_data[, "Activity"] == i, "Activity"] <- as.character(activity_labels$activity[i])
  }
  
  average_data
}