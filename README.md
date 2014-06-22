The R-script run_analysis.R is meant to form a tidy data set from measurement data available at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script does following steps:
* Reads MEAN and STANDARD DEVIATION measurements from the data for the separate test groups "test" and "train".
* Arranges them into a tables corresponding to test subject and activity performed.
* Assigns labels for the activities as given in file "activity_labels.txt"
* Merges "test" and "train" into a single table.
* Prints the table into file "tidy_exercise.txt".