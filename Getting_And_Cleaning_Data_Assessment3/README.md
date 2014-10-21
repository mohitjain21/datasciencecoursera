# Getting and Cleaning Data Course Project

##This repo has the following files and folders.

1. UCI HAR Dataset :"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". This zip contains the input data for performing the transformation.
2. "CodeBook.md"" A code book that describes the data source, the data set,  set files, tasks to perform and the transformation dons. It also specifies the list of many variables used in the data preparation.
3. "run_analysis.R"" contains the R script to processes the data 
4. "tidy_data.txt"" is the required tidy dataset in the text format.
5. "ReadMe.md" 

## Tasks to Perform

To create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to perform the tasks at hand.

1. Extract the zip in the same folder where the run_analysis.R and working directory is located. You should have a "UCI HAR Dataset" folder with other files and folders.
2. Run the "run_analysis.R" using source("run_analysis.R") in RStudio or similar environment.
3. You should have a new file "tiny_data.txt" created in your working directory.