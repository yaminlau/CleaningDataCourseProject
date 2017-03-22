# CleaningDataCourseProject
Course Project for Getting and Cleaning Data 

### The goal of the project is to tidy the data collected for Human Activity Recognition Using Smartphone

Create R script called run_analysis.R that does the following.
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the above data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### The follow functions were created in the run_analysis.R script to perform the above tasks.

getAverageBySubjectActivity (dataDir, writeFile, regexField = "mean\\\\(|std\\\\(") 
aggregated by subject, activity and mean of all the columns in the regexField to the writeFile.
* dataDir - the directory of the data set
* writeFile - file to write for the independent tidy data set
* regexField - the fields to extract (defaults to mean and std )  
example:  getAverageBySubjectActivity("./UCI HAR Dataset", "summary.txt")


mergeTestAndTrainData (dataDir, regexField = "mean\\\\(|std\\\\(")
combine the test and train dataset with the column names that match the regexField, defaulted to mean and std
* dataDir - the directory of the data set
* regexField - the fields to extract (defaults to mean and std )
example:  mergeTestAndTrainData ("./UCI HAR Dataset")

colToExtract (colFile, regexField= "mean\\\\(|std\\\\(")
extract column with the regex from column file
* colFile - file that descript the features ( features.txt)
* regexField - the fields to extract (defaults to mean and std )
example:  colToExact ("./UCI HAR Dataset/features.txt", "mean\\\\(|std\\\\(")

getData (dataFile, activityFile, subjectFile, colList )
extract data from data, activity and subject file and join the data into one set
* dataFile - the dataset (X_train.txt/X_test.txt)
* activityFile - the dataset label (y_train.txt/y_test.txt)
* subjectFile - the suject for the dataset (subject_train.txt/subject_test.txt
* colList - dataframe for the list of fields to extract, results from function colToExtract
