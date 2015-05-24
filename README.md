# Getting and Cleaning Data
### May 2015 Session


## Course Project

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. Raw data was collected from the accelerometers of the Samsung Galaxy S smartphone. A full description of the raw data is available at:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The purpose of this project is to demonstrate the authors ability to collect, work with, and clean a data set. The goal is to prepare tidy data, following the five steps outlined below, that can be used for later analysis. Furthermore, the general guidelines for producing the tidy dataset, as per the course lectures, are as follows:
* 1. Each column corresponds to a different variable
* 2. Each different observation of that variable is in a separate row
* 3. The first row of the dataset contains variable names
* 4. All variable names are
* 	a. Descriptive
* 	b. Lowercase
* 	c. Unique
* 	d. Free of underscores, dots or white spaces

The R script named "run_analysis.R" in this repo contains code that downloads the raw data above to the author's working directory and processes it to output a tidy dataset. Specifically, this document describes how the R script works, and the inputs, transformations and the outputs of each step.  For specific details of the tidy dataset variables refer to the accompanying "CodeBook.md" in this repo.


## R Script: run_analysis.R

### Downloading, Unzipping and Reading in the Raw Data
A folder named "data" is created for the raw data in the working directory. The raw data is downloaded into the "data" folder (for Windows) and date of download is noted so the version of the raw data downloaded can be tracked if needed. The raw data is unzipped into the "data" folder.

As per the description of the raw data in the zipped files. The dataset is comprised of the following files:
* "README.txt"
* "features_info.txt": Shows information about the variables used on the feature vector.
* "features.txt": List of all features.
* "activity_labels.txt": Links the class labels with their activity name.
* "train/X_train.txt": Training set.
* "train/y_train.txt": Training labels.
* "test/X_test.txt": Test set.
* "test/y_test.txt": Test labels.

The presence of all raw data files is confirmed. A shortcut file
path variable is created for reading in data. The raw data for the activity variable, subject variable and the feature variables are read into R.

The number of variables and the number of observations for training and testing are checked to ensure they have been properly read in.

### 1.Merges the training and the test sets to create one data set.
ASSUMPTION: The input of this step should be the raw data files and the output of this step should be a single dataset aggregating all the raw data.

First, the testing observations are appended to the training observations for *each* of the variables activity and subject and the feature variables. The number of variables and that each has the same number of obseervations is confirmed after appending. 

Second, names are assigned for each of the variables (this is required for Step 2) to the aggregated dataset. For the feature variables, the "features.txt" file containing the feature variable names is read in and the names assigned from the data contained in this file. The dataset is checked to ensure all variables have names.

Third, all variables are bound into a single dataset with one named variable per column. For sake of clarity subject is the first column and the different actvities upon which each subject is measured is in the second column. The dataset is check for completeness.

### 2.Extracts only the measurements on the mean and standard deviation for each measurement.
ASSUMPTION: The output of this step should be a subset of the single dataset outputted in Step 1. For each subject and activity, the subset should contain *all* observations of *only* those feature variables which contain a measurement of the mean or of the standard deviation.

A vector of the subject variable, the activity variable and only the relevant feature variables is created. The dataset outputted in Step 1 is then subsetted using this vector. The subset is checked to ensure all observations are present but only the relvant variables are present.

### 3.Uses descriptive activity names to name the activities in the data set.
## ASSUMPTION: The activity output of Step 2, with each of the activity variable's numeric observations replaced by its equivalent character description.

First, the "activity_labels.txt" file containing the ordered data.frame of numeric activity identifiers and corresponding activity descriptions, is read in. Second, the descriptions are tidied up as per the tidy dataset guidelines outlined above. Third, given the data.frame is ordered, it can be used to easily replace the numeric observations of the activity variable in the dataset outputted from Step 2 with their equivalent descriptions. The modified datset is checked to ensure the substitution was successful.

### 4.Appropriately labels the data set with descriptive variable names.
ASSUMPTION: The output of this step should be the dataset outputted in Step 3, with modifications made to the variable names. 

The names of the features varaiables are not very descriptive. As per the "features_info.txt" file the following clarifications are made:
* the prefix t is replaced with "time"
* the prefix f is replaced with "frequency"
* "Acc" is elaborated to "accelerometer"
* "Gyro" is elaborated to "gyroscope"
* "Mag" is elaborated  to "magnitude"
* "BodyBody" is clarified to "body"
* "std" is elaborated to "standarddeviation"

In addition all variable names are converted to lowercase and any white spaces are removed. The changes to the dataset are checked.

### 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The output of this step is the tidy dataset. The tidy dataset is a summary of the dataset outputted in Step 4, comprising a single observation of the mean of each of the feature variables for each of the activities performed by each of the test and train subjects. Thus, the tidy dataset should contain the same number of variables as the output dataset of Step 4. However, given 30 test and train subjects each performing 6 activities, the tidy dataset contains 180 observations.

The tidy dataset is checked and written to the author's working directory.
