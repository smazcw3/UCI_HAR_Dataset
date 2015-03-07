Getting and Cleaning Data Course Project
========================================

1. Firstly, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and you will get the folder named "UCI HAR Dataset". Rename it with "UCI_HAR_Dataset"

2. Secondly, make sure that the folder "UCI_HAR_Dataset" and the run_analysis.R script is residing in the same folder.

3. Thirdly, use the command source("run_analysis.R") in RStudio. After running the script, you will get two text files as output in the currently working directory. Below is a short description for these files::

  * merged_cleandata.txt: This file contains a data frame called cleaned_data with 10299*68 dimension.
  * tidy_data_set_with_averages.txt: This file contains a data frame called result with 180*68 dimension.
  
4. Finally, use tidy_data <- read.table("tidy_data_set_with_averages.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features. 