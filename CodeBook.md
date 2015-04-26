### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### Summary of the Data files used

* Values for the Activity Varible comprises of data from “y_train.txt” and “y_test.txt”
* Values for the Subject Varible comprises of data from “subject_train.txt” and subject_test.txt"
* Values for the Features Varible comprises of data from “X_train.txt” and “X_test.txt”
* Descriptive Features Names are provided by “features.txt”
* Descriptive Activity Names are provided by “activity_labels.txt”

More information about the files is available in `README.txt`. 
More information about the features is available in `features_info.txt`.

### Data files not used

The data files in the "Inertial Signals" folders were ignored.

### Steps

* Load required Packages
* Load Training DataFrames
* Load Test DataFrames
* Load Meta Data for Descriptive Names
* Merge the similar Dataframes for Test and Training
* Assign Descriptive Names to Column Headings
* Assign Descriptive Names to Acivites, the Convert the Varible to a Factor.
* Merge into one DataFrame which now contains desciptive names in all the column headings.
* Subset name of Features by measurements on the mean and standard deviation
* Subset MergedDF by seleted names of Features
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
* The tidy data set will output to a Text file.

