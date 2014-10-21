#####1. Merges the training and the test sets to create one data set.#####

###### Training data starts...............................................
# A. Read subject training data (subject_train.txt)
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt", 
                col.names=c("subject_id"))
# Assign row number to ID column
subject_train$ID <- as.numeric(rownames(subject_train))

# B. Read training data (X_train.txt)
X_train = read.table("UCI HAR Dataset/train/X_train.txt")
# Assign row number to ID column
X_train$ID <- as.numeric(rownames(X_train))

# C. Read activity training data (Y_train.txt)
Y_train = read.table("UCI HAR Dataset/train/y_train.txt", 
        col.names=c("activity_id"))
# Assign row number to ID column
Y_train$ID <- as.numeric(rownames(Y_train))

# Merge subject_train, y_train and X_train into single data set (train_data)
train_data <- merge(subject_train, Y_train, all=TRUE)
train_data <- merge(train_data, X_train, all=TRUE)
####### ................................................Training data ends

###### Test data starts...................................................
# D. Read subject test data (subject_test.txt)
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt", 
               col.names=c("subject_id"))
# Assign row number to ID column
subject_test$ID <- as.numeric(rownames(subject_test))

# E. Read test data (X_test.txt)
X_test = read.table("UCI HAR Dataset/test/X_test.txt")
# Assign row number to ID column
X_test$ID <- as.numeric(rownames(X_test))

# F. Read activity test data (Y_test.txt)
y_test = read.table("UCI HAR Dataset/test/y_test.txt", 
         col.names=c("activity_id"))  # max = 6
# Assign row number to ID column
y_test$ID <- as.numeric(rownames(y_test))

# Merge subject_test, y_test and X_test into single data set (train_test)
test_data <- merge(subject_test, y_test, all=TRUE) 
test_data <- merge(test_data, X_test, all=TRUE) 
####### .....................................................Test data ends

# Merge Training and Test data sets
merged_dataset1 <- rbind(train_data, test_data)

###2. Extracts only the measurements on the mean and standard deviation for 
###   each measurement.
features = read.table("UCI HAR Dataset/features.txt", 
           col.names=c("feature_id","feature_label"),)
MeanStd_features <- features[grepl("mean\\(\\)", features$feature_label) | 
                     grepl("std\\(\\)", features$feature_label), ]
MeanStd_dataset2 <- merged_dataset1[, c(c(1, 2, 3), 
                    MeanStd_features$feature_id + 3) ]

##3. Uses descriptive activity names to name the activities in the data set##
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt", 
                  col.names=c("activity_id", "activity_label"),) #
WithActivNames_dataset3 = merge(MeanStd_dataset2, activity_labels, all=TRUE)

###4. Appropriately labels the data set with descriptive variable names. ###
Labeled_dataset4 = WithActivNames_dataset3
MeanStd_features$feature_label = gsub("\\(\\)", "", 
                                      MeanStd_features$feature_label)
MeanStd_features$feature_label = gsub("-", ".", 
                                      MeanStd_features$feature_label)
for (i in 1:length(MeanStd_features$feature_label)) {
        colnames(Labeled_dataset4)[i + 3] <- MeanStd_features$feature_label[i]
}

###5. From the data set in step 4, creates a second, independent tidy data set 
###   with the average of each variable for each activity and each subject.
col_label1 <- c("ID","activity_label")
cache_dataset5 <- Labeled_dataset4[,!(names(Labeled_dataset4) %in% col_label1)]
tidy_dataset6 <-aggregate(cache_dataset5, by=list(subject = 
                cache_dataset5$subject_id, activity = 
                cache_dataset5$activity_id), FUN=mean, na.rm=TRUE)
col_label2 <- c("subject","activity")
tidy_dataset6 <- tidy_dataset6[,!(names(tidy_dataset6) %in% col_label2)]
tidy_dataset6 = merge(tidy_dataset6, activity_labels)
write.table(tidy_dataset6, file = "tidy_data.txt", row.names = FALSE)