**Getting and Cleaning Data Course Project**
============================================

#####This readme file describes how to operate run_analysis.R Data used for this analysis is located in this repository in the '/Dados Bruto/UCI HAR Dataset' directory. For information regarding the data, please read the following notes: 'Dados Brutos/UCI HAR Dataset Folder/README.txt'

###General Description of run_analysis.R

This file reads data from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and performs the six steps located in the problem statement below.

### This script performs the following functions in the following order

1. Cleanup the environment

2. Setup the working directory

3. Download the file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

4. Unzip the file downloaded

5. Read only the necessaries files for the statement

6. Merge this files

7. Set correct variable names 

8. Remove the columns from data without Mean or Std like asked

9. Create second, independent tidy data set with the average of each variable for each activity and each subject

###Below is the problem statement for this assignment. The code is located in run_analysis.R

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

1. You should create one R script called run_analysis.R that does the following.

2. Merges the training and the test sets to create one data set.

3. Extracts only the measurements on the mean and standard deviation for each measurement.

4. Uses descriptive activity names to name the activities in the data set

5. Appropriately labels the data set with descriptive variable names.

6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.