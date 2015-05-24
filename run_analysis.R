## One of the most exciting areas in all of data science right now is wearable
## computing. Companies like Fitbit, Nike, and Jawbone Up are racing to
## develop the most advanced algorithms to attract new users. Raw data was
## collected from the accelerometers of the Samsung Galaxy S
## smartphone. A full description of the raw data is available at:

## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## This file contains the code that downloads the raw data above to the
## author's working directory and processes it to output a tidy dataset.
## Refer to the accompanying README.md in this repo for a description of how
## the script below works and the inputs, transformations and the outputs of
## each step and the general principles behind the tidy dataset. For specific
## details of the tidy dataset variables refer to the accompanying CodeBook.md
## in this repo.

## Creates a folder "data" for the raw data in the working directory
if(!file.exists("data")) {
	dir.create("data")
}

## Downloads and unzips the raw data into the "data" folder (for Windows)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/raw_data.zip", mode = "wb")
dateDownloaded <- date # assigns the current date to the raw data
dateDownloaded # prints current date
unzip(zipfile = "./data/raw_data.zip", exdir = "./data") # unzips the raw data
# in the "data" folder

## Confirms that the unzipped raw data that is to be converted to tidy data is
## present
path_rf <- file.path("./data" , "UCI HAR Dataset") # creates a shortcut file
# path variable for reading in data
files <- list.files(path_rf, recursive = TRUE)
files # lists all files in the unzipped folder or in any folder in the
# unzipped folder

## Reads in the raw data for the activity variable, subject variable and
## feature variables
act_test_data <- read.table(file.path(path_rf, "test" , "Y_test.txt" ))
act_train_data <- read.table(file.path(path_rf, "train", "Y_train.txt"))
subj_test_data <- read.table(file.path(path_rf, "test", "subject_test.txt"))
subj_train_data <- read.table(file.path(path_rf, "train" , "subject_train.txt"))
feat_test_data <- read.table(file.path(path_rf, "test", "X_test.txt"))
feat_train_data <- read.table(file.path(path_rf, "train", "X_train.txt"))

## Checks the number of variables and that each has the same number of
## observations for training and testing, respectively
str(act_test_data)
str(act_train_data)
str(subj_test_data)
str(subj_train_data)
str(feat_test_data)
str(feat_train_data)

## 1.Merges the training and the test sets to create one data set.
## Appends the testing observations to training observations for the...
act_data <- rbind(act_train_data, act_test_data) #...activity variable data
subj_data <- rbind(subj_train_data, subj_test_data) #...subject variable data
feat_data <- rbind(feat_train_data, feat_test_data) #...feature variables
# data

## Checks number of variables, and that each has the same number of
## observations
str(act_data)
str(subj_data)
str(feat_data)

## Assigns names for each of the variables
names(act_data)<- c("activity") # "activity" for activity data
names(subj_data)<-c("subject") # "subject" for subject data
feat_names <- read.table(file.path(path_rf, "features.txt")) # reads in the
# dataset containing the names of the feature variables
feat_names # checks where feature variable names are in the dataset
names(feat_data)<- feat_names$V2 # assigns feature variable names for
# features data

## Checks names were correctly assigned to all variables
str(act_data)
str(subj_data)
str(feat_data)

## Binds all variables into a single dataset with one name variable per
## column 
temp_data <- cbind(subj_data, act_data)
data <- cbind(temp_data, feat_data)
str(data) # checks binding occurred correctly and all obs. and variables are
# present

## 2.Extracts only the measurements on the mean and standard deviation for
## each measurement.
mean_std_names <- feat_names$V2[grep("mean\\(\\)|std\\(\\)", feat_names$V2)] 
# stores only those feature variable names which contain "mean" or "std"
subset_names <- c("subject", "activity", as.character(mean_std_names))
# appends the above to "subject" "activity" to create a list of variable names
# based on which the data can be subsetted
subset_data <- subset(data, select = subset_names) # subsets the data
str(subset_data) # checks to see that the subsetting correctly includes all
# observations but only the relevant variables

## 3.Uses descriptive activity names to name the activities in the data set.  
act_labels <- read.table(file.path(path_rf, "activity_labels.txt")) # reads
# in activity label description data
act_labels # checks location of labels and whether they need to be tidied up
act_labels$V2 <- gsub("_", "", tolower(act_labels$V2)) # makes labels
# lowercase without underscores
subset_data$activity = act_labels[subset_data$activity, 2] # substitutes the
# activity descriptions in the subset_data for the activity numbers in the
# activity variable column
str(subset_data) # checks the substitution above occurred correctly

## 4.Appropriately labels the data set with descriptive variable names. 
names(subset_data) <- gsub("^t", "time", names(subset_data)) # clarifies prefix t
names(subset_data) <- gsub("^f", "frequency", names(subset_data)) # clarifies prefix f
names(subset_data) <- gsub("Acc", "accelerometer", names(subset_data)) # clarifies Acc
names(subset_data) <- gsub("Gyro", "gyroscope", names(subset_data)) # clarifies Gyro
names(subset_data) <- gsub("Mag", "magnitude", names(subset_data)) # clarifies Mag
names(subset_data) <- gsub("BodyBody", "body", names(subset_data)) # simplifies BodyBody
names(subset_data) <- gsub("std", "standarddeviation", names(subset_data)) # clarifies std
names(subset_data) <- gsub(" ", "", tolower(names(subset_data))) # converts all variable
# names to lowercase and removes any white spaces
str(subset_data) # checks the variable names were changed as expected

## 5.From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
tidy_data <- aggregate(subset_data[3:ncol(subset_data)], by = list(subject =
subset_data$subject, activity = subset_data$activity), mean) # creates an
# independent dataset comprising the mean of each of the feature variables
# in the output of Step 4 for each of the activities performed by each of
# the test and train subjects
str(tidy_data) # checks the number of vraiables and observations
write.table(tidy_data, file = "tidy_data.txt", row.name = FALSE) # writes the
# independent dataset to the author's working directory





