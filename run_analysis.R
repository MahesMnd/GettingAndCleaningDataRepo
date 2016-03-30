library(plyr)

# Download the data for the course project

if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")){
  writeLines("Data file is not present in the working directory.\nDownloading Data file...")
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url = fileURL, destfile =  "getdata-projectfiles-UCI HAR Dataset.zip", quiet = TRUE)
  writeLines("Data file downloaded.")
}  

# Extract the contents of the zipped data file

if (!file.exists("UCI HAR Dataset")) { 
  writeLines("Extracting data from zipped file...")
  unzip("getdata-projectfiles-UCI HAR Dataset.zip") 
}


# Step 1
# Merge the training and the test sets to create one data set
writeLines("Merging training and test sets...")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

writeLines("Training and test sets merged.")
# End Step 1

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("UCI HAR Dataset/features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

writeLines("Mean and standard deviation for each measurement extracted.")
# End Step 2

# Step 3
# Use descriptive activity names to name the activities in the data set

activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

writeLines("Descriptive activity names used to name the activities in the data set.")
# End Step 3

# Step 4
# Appropriately label the data set with descriptive variable names

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

writeLines("Labelled the dataset with descriptive variable names.")
# End Step 4

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject from the data set in step 4.

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "Output_TidyDataset.txt", row.name=FALSE)

writeLines("Tidy data set: \'Output_TidyDataset.txt\' created.")
# End Step 5
