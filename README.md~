#Getting and Cleaning Data Course Project

The script 'run_analysis.R' in this repository downloads the project data if it is not present in the working directory and performs the 5 steps described in the course project's instruction page:

1. If the data file is not present in the working directory the project data is downloaded.
2. The contents of the zipped file are extracted unto the working directory.
3. After reading the files in tabular format with 'read.table', all the similar data is merged using the 'rbind()' function.
4. Then, only the measurements on the mean and standard deviation are taken from the whole dataset. After extracting these columns, they are given the correct names taken from 'features.txt'.
5. The activity names and IDs from 'activity_labels.txt' are retrieved and they are substituted in the dataset.
6. Columns with vague column names are corrected.
7. Finally, a new tidy dataset 'Output_TidyDataSet.txt' with the average for each variable for each activity and each subject (30 subjects * 6 activities = 180 rows) is generated.

'CodeBook.md' describes the variables, the data, and any transformations or work that was performed to clean up the data.

'run_analysis.R' contains the code to perform the analyses described in the 5 steps. It can be run in RStudio by importing the file :source("run_analysis.R").

The final output of the script 'run-analysis.R' is called 'Output_TidyDataSet.txt', and is uploaded in the course project's form and this repository.
