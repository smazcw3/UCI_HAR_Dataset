Getting and Cleaning Data Course Project CodeBook
=================================================
Original source for data for the Course Project was obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the Project was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The attached R script with the name run_analysis.R does the following to clean the data::

1. Read X_train.txt, subject_train.txt and Y_train.txt from the "/UCI_HAR_Dataset/train" folder and store them in *train_X*, *train_sub* and *train_Y* variables respectively.

2. Read X_test.txt, subject_test.txt and Y_test.txt from the "/UCI_HAR_Dataset/test" folder and store them in *test_X*, *test_sub* and *test_Y* variables respectively.

3. Merges the training and test sets to create one data set. Concatenate *train_X* and *test_X* to create 10299x561 data frame called *merge_X* ;  Concatenate *train_sub* and *test_sub* to create 10299x1 data frame called *merge_sub*;
Concatenate *train_Y* and *test_Y* to create 10299x1 data frame called *merge_Y*;

4. Read the features.txt file from  /UCI_HAR_Dataset/features.txt and store it in a variable called *features*. Here, we will only extract measurements on the mean and standard deviation. As a result, we get 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation.Clean the column names of the subset.

5. Read the activity_labels.txt file from the "/UCI_HAR_Dataset folder and store the data in a variable called *activities*.

6. Clean the activity names in the second column of *activities*. All feature names and activity names are converted to lower case, underscores and brackets () are removed.

7. Merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs. The result is saved as merged_cleandata.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements.

8. Finally, generate a second, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as tidy_data_set_with_averages.txt, a 180x68 data frame, where as before, the first column contains subject IDs, the second column contains activity names, and then the averages for each of the 66 attributes are in columns 3...68. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.