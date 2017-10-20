## Synopsis

This repository contains the solution files for the Getting and Cleaning Data Course Project.

The project involves cleaning and subsetting a data set taken from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

More specifically, the script _run_analysis.R_ does the following:

1. Merges the given training and test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data in Step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Code Example and Operation

The script _run_analysis.R_ performs the steps outlined above in the following order: 1, 4, 3, 2, 5.

It operates as follows:

* Read the labels for the activities and the features from the given data

* Read and combine the training and test data using a combination of rbind and cbind

* Label the variables and the activities using descriptive names

* Extract the relevant data using simple subsetting (with the help of grepl to construct the appropriate vector)

* Constructs the table of averages using ddply and numcolwise

* Writes the table of averages to _uci_har_avgs.txt_

The script assumes that the directory _UCI HAR Dataset_ exists in the working directory.

The script defines no new functions, and requires the *plyr* library.

## Usage

Simply source _run_analysis.R_ in an R session.
