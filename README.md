## Synopsis

This repository contains the solution files for the Getting and Cleaning Data Course Project.

The project involves cleaning and subsetting a data set taken from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

More specifically, the script run_analysis.R does the following:

1. Merges the given training and test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data in Step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Code Example and Operation

The script run_analysis.R performs the steps outlined above in the following order: 1, 4, 3, 2, 5.

It operates as follows:

* Read the labels for the activities and the features from the given data

* Read and combine the training and test data using a combination of rbind and cbind

* Label the variables and the activities using descriptive names

* Extract the relevant data using simple subsetting (with the help of grepl to construct the appropriate vector)

* Constructs the table of averages using ddply and numcolwise

* Writes the table of averages to _uci_har_avgs.txt_

The script defines no new function, and requires the plyr library.

## Motivation

A short description of the motivation behind the creation and maintenance of the project. This should explain **why** the project exists.

## Installation

Provide code examples and explanations of how to get the project.

## API Reference

Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live.

## Tests

Describe and show how to run the tests with code examples.

## Contributors

Let people know how they can dive into the project, include important links to things like issue trackers, irc, twitter accounts if applicable.

## License

A short snippet describing the license (MIT, Apache, etc.)
