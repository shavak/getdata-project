# Shavak Sinanan
# Getting and Cleaning Data Course Project
# Johns Hopkins University

# run_analysis.R

# this script assumes that the directory "UCI HAR Dataset" exists in the working directory

# use file.path() when reading to be platform friendly

library(plyr) # used for last step

features <- read.table(file.path("UCI HAR Dataset", "features.txt"), row.names = 1, colClasses = "character")[, 1] # to be used to label the columns
activity_labels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"), row.names = 1, colClasses = "character")[, 1] # to be used to label the activities

# read the subject, activity, and feature variables from the training and test directories using rbind to stitch them together
# order is important - train first and then test
subj <- rbind(read.table(file.path("UCI HAR Dataset", "train", "subject_train.txt")), read.table(file.path("UCI HAR Dataset", "test", "subject_test.txt")))
y <- rbind(read.table(file.path("UCI HAR Dataset", "train", "y_train.txt"), colClasses = "factor"), read.table(file.path("UCI HAR Dataset", "test", "y_test.txt"), colClasses = "factor"))
X <- rbind(read.table(file.path("UCI HAR Dataset", "train", "X_train.txt"), colClasses = "numeric"), read.table(file.path("UCI HAR Dataset", "test", "X_test.txt"), colClasses = "numeric"))

uci_har <- cbind(subj, y, X) # stitch the whole thing together: Step 1, check!
names(uci_har) <- c("Subject", "Activity", make.names(features)) # label variables descriptively: Step 4, check!
levels(uci_har$Activity) <- activity_labels # label activities descriptively: Step 3, check!

# now to the extraction
extraction_vector <- c(TRUE, TRUE, grepl("mean()", features, fixed = TRUE) | grepl("std()", features, fixed = TRUE)) # construct the extraction vector, this line is easy to modify
uci_har <- uci_har[, extraction_vector] # Step 2, check!

# now for the averaging
uci_har_avgs <- ddply(uci_har, .(Subject, Activity), numcolwise(mean))
names(uci_har_avgs)[-c(1, 2)] <- paste(names(uci_har_avgs)[-c(1, 2)], "mean", sep = ".") # Step 5, check!
fnm <- "uci_har_avgs.txt"
if(file.exists(fnm)) {
    file.remove(fnm)
}
conn <- file(fnm)
open(conn, "w")
write.table(uci_har_avgs, conn, quote = FALSE, row.names = FALSE) # write the table
close(conn)