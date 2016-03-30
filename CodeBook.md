## Variables

* 'x_train', 'y_train', 'x_test', 'y_test', 'subject_train' and 'subject_test' contain the data read from the downloaded files.
* 'x_data', 'y_data' and 'subject_data' contain merged data from the previous datasets.
* 'features' contains the correct names for the 'x_data' dataset, which are applied to the column names stored in 'mean_and_std_features', a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the 'activities' variable.
* 'all_data' merges 'x_data', 'y_data' and 'subject_data' into a single big dataset.
* Finally, 'averages_data' contains the average values which is stored in a '.txt' file.

## Functions

* read.table(): Used to read the files into R.
* rbind(): Used to combine similar data from two files.
* grep(): Used to match mean and standard deviation measures.
* names(): Used to substitute appropriate names.
* cbind(): Used to combine all the data into a single data set.
* write.table(): Used to export the final tidy data.
