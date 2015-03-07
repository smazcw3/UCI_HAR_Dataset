# 1. Merges the training and the test sets to create one data set.
train_X <- read.table("train/X_train.txt")
train_sub <- read.table("train/subject_train.txt")
train_Y <- read.table("train/Y_train.txt")
test_X <- read.table("test/X_test.txt")
test_sub <- read.table("test/subject_test.txt")
test_Y <- read.table("test/Y_test.txt")
merge_X <- rbind(train_X, test_X)
merge_sub <- rbind(train_sub, test_sub)
merge_Y <- rbind(train_Y, test_Y)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
mean_sd_indices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
merge_X <- merge_X[, mean_sd_indices]
names(merge_X) <- features[mean_sd_indices, 2]
names(merge_X) <- gsub("\\(|\\)", "", names(merge_X))
names(merge_X) <- tolower(names(merge_X))

# 3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
merge_Y[,1] = activities[merge_Y[,1], 2]
names(merge_Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.
names(merge_sub) <- "subject"
cleaned_data <- cbind(merge_sub, merge_Y, merge_X)
write.table(cleaned_data, "merged_cleandata.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uni_subjects = unique(merge_sub)[,1]
n_subjects = length(unique(merge_sub)[,1])
n_activities = length(activities[,1])
numCols = dim(cleaned_data)[2]
result = cleaned_data[1:(n_subjects*n_activities), ]
row = 1
for (i in 1:n_subjects) {
    for (j in 1:n_activities) {
        result[row, 1] = uni_subjects[i]
        result[row, 2] = activities[j, 2]
        tmp <- cleaned_data[cleaned_data$subject==i & cleaned_data$activity==activities[j, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "tidy_data_set_with_averages.txt")

#tidy_data <- read.table("tidy_data_set_with_averages.txt")