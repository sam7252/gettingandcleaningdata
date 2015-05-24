# Code Book



## Input Data

The raw input data was generated from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The embedded accelerometer and gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The raw data is available at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

For description of the variables please see the "README.txt" and the "features_info.txt" included in the above zip archive.


## Transformations

For the actual code used in the transformation of the input data to the output data please see the "run_analysis.R" file in this repo. In addition, refer to the accompanying "README.md" in this repo for a description of how the R script works and the inputs, transformations and the outputs of each step in the transformation.

In brief:
1. The testing observations were appended to the training observations to produce a single activity, subject and features dataset
2. Names were assigned to each of the variables in the datasets
3. The datasets were merged
4. Only the mean and standard deviation variables were extracted for each subject and activity
5. Descriptive labels were substituted for the numeric identifiers used in the activity observations
6. Variables names were modified to be descriptive, lowercase, free of underscores or white spaces, as needed
7. An independent tidy data set calculating the average of all of the observations of each variable for each activity and each subject is generated.


## Output Data

The output data of running the R script "run_analysis.R" in this repo on the input data above has been saved to the file "tidy_data.txt", a text file with tab-separated values.

The tidy dataset consists of the average of all observations across 30 volunteers and 6 activities, for a total of 180 measurements, of 66 feature variables. The 68 columns in the dataset are as follows:

subject
activity
timebodyaccelerometer-mean()-x
timebodyaccelerometer-mean()-y
timebodyaccelerometer-mean()-z
timebodyaccelerometer-standarddeviation()-x timebodyaccelerometer-standarddeviation()-y timebodyaccelerometer-standarddeviation()-z timegravityaccelerometer-mean()-x
timegravityaccelerometer-mean()-y
timegravityaccelerometer-mean()-z
timegravityaccelerometer-standarddeviation()-x timegravityaccelerometer-standarddeviation()-y timegravityaccelerometer-standarddeviation()-z timebodyaccelerometerjerk-mean()-x
timebodyaccelerometerjerk-mean()-y
timebodyaccelerometerjerk-mean()-z
timebodyaccelerometerjerk-standarddeviation()-x timebodyaccelerometerjerk-standarddeviation()-y timebodyaccelerometerjerk-standarddeviation()-z timebodygyroscope-mean()-x
timebodygyroscope-mean()-y
timebodygyroscope-mean()-z
timebodygyroscope-standarddeviation()-x
timebodygyroscope-standarddeviation()-y
timebodygyroscope-standarddeviation()-z
timebodygyroscopejerk-mean()-x
timebodygyroscopejerk-mean()-y
timebodygyroscopejerk-mean()-z
timebodygyroscopejerk-standarddeviation()-x timebodygyroscopejerk-standarddeviation()-y timebodygyroscopejerk-standarddeviation()-z timebodyaccelerometermagnitude-mean() timebodyaccelerometermagnitude-standarddeviation() timegravityaccelerometermagnitude-mean() timegravityaccelerometermagnitude-standarddeviation() timebodyaccelerometerjerkmagnitude-mean() timebodyaccelerometerjerkmagnitude-standarddeviation() timebodygyroscopemagnitude-mean()
timebodygyroscopemagnitude-standarddeviation()
timebodygyroscopejerkmagnitude-mean() timebodygyroscopejerkmagnitude-standarddeviation() frequencybodyaccelerometer-mean()-x
frequencybodyaccelerometer-mean()-y
frequencybodyaccelerometer-mean()-z
frequencybodyaccelerometer-standarddeviation()-x frequencybodyaccelerometer-standarddeviation()-y frequencybodyaccelerometer-standarddeviation()-z frequencybodyaccelerometerjerk-mean()-x frequencybodyaccelerometerjerk-mean()-y frequencybodyaccelerometerjerk-mean()-z frequencybodyaccelerometerjerk-standarddeviation()-x frequencybodyaccelerometerjerk-standarddeviation()-y frequencybodyaccelerometerjerk-standarddeviation()-z frequencybodygyroscope-mean()-x
frequencybodygyroscope-mean()-y
frequencybodygyroscope-mean()-z
frequencybodygyroscope-standarddeviation()-x frequencybodygyroscope-standarddeviation()-y frequencybodygyroscope-standarddeviation()-z frequencybodyaccelerometermagnitude-mean() frequencybodyaccelerometermagnitude-standarddeviation() frequencybodyaccelerometerjerkmagnitude-mean() frequencybodyaccelerometerjerkmagnitude-standarddeviation() frequencybodygyroscopemagnitude-mean() frequencybodygyroscopemagnitude-standarddeviation() frequencybodygyroscopejerkmagnitude-mean() frequencybodygyroscopejerkmagnitude-standarddeviation()