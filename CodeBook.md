#Cousera Cleaning Data Course Project 

The featured dataset were downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###The following we performed on the dataset and wrote to the summary.txt

	1. get all the columns with mean() and std().  All the "()-" characters were removed from the column name.
	2. get activity labels
	3. get test data (join data in test/X_test.txt, test/y_test.txt and test/suject_test.txt with columns from step 1)
	4. get train data (join data in the train/X_train.txt, train/y_train.txt and train/subject_train.txt with columns from step 1) 
	5) row join test data and train data
	6) merger data from 5 with activity from step 2 
	7) write to the summary.txt file with the aggregate the data from step 6 by suject, activity and get the mean


### below is a list of fields in the summary.txt file 
subject   subject 1 to 30 that were in the experience
activity  six activities(WALKING, WALKing_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STADING, LAYING) 
tBodyAccmeanX tBodyAccmeanY tBodyAccmeanZ tBodyAccstdX tBodyAccstdY tBodyAccstdZ tGravityAccmeanX tGravityAccmeanY tGravityAccmeanZ tGravityAccstdX tGravityAccstdY tGravityAccstdZ tBodyAccJerkmeanX tBodyAccJerkmeanY tBodyAccJerkmeanZ tBodyAccJerkstdX tBodyAccJerkstdY tBodyAccJerkstdZ tBodyGyromeanX tBodyGyromeanY tBodyGyromeanZ tBodyGyrostdX tBodyGyrostdY tBodyGyrostdZ tBodyGyroJerkmeanX tBodyGyroJerkmeanY tBodyGyroJerkmeanZ tBodyGyroJerkstdX tBodyGyroJerkstdY tBodyGyroJerkstdZ tBodyAccMagmean tBodyAccMagstd tGravityAccMagmean tGravityAccMagstd tBodyAccJerkMagmean tBodyAccJerkMagstd tBodyGyroMagmean tBodyGyroMagstd tBodyGyroJerkMagmean tBodyGyroJerkMagstd fBodyAccmeanX fBodyAccmeanY fBodyAccmeanZ fBodyAccstdX fBodyAccstdY fBodyAccstdZ fBodyAccJerkmeanX fBodyAccJerkmeanY fBodyAccJerkmeanZ fBodyAccJerkstdX fBodyAccJerkstdY fBodyAccJerkstdZ fBodyGyromeanX fBodyGyromeanY fBodyGyromeanZ fBodyGyrostdX fBodyGyrostdY fBodyGyrostdZ fBodyAccMagmean fBodyAccMagstd fBodyBodyAccJerkMagmean fBodyBodyAccJerkMagstd fBodyBodyGyroMagmean fBodyBodyGyroMagstd fBodyBodyGyroJerkMagmean fBodyBodyGyroJerkMagstd
