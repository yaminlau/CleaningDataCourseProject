# Cousera Data Science Specialization - Data Cleaning 
# course project

library(dplyr)

# get data fields that match the regexField from test and train from datadir.
# aggregated by subject, activity and mean of all the column to the writefile.
getAverageBySubjectActivity <- function (dataDir, writeFile, regexField = "mean\\(|std\\(") 
{
	# merge data from test and train and grep only field with the regex
	data = mergeTestAndTrainData(dataDir, regexField)
	
	#aggregate the data by subject, activity and summerize with mean of each column.
	sd <- data %>% 
		group_by (subject, activity) %>% 
		summarise_each(funs(mean(., na.rm=TRUE)), -activitykey)
	
	#write aggregated data to file 
	write.table(sd, writeFile, row.names=FALSE)
}

# combine the test and train dataset with the regex of fields, defaulted to mean and std
mergeTestAndTrainData <- function (dataDir, regexField = "mean\\(|std\\(")
{
	# get the fields to extract
	colToExtract <- colToExtract(paste(dataDir,"features.txt", sep='/'), regexField)
	
	# get the activity descriptions
	activityDesc <- read.table( paste(dataDir,"activity_labels.txt", sep='/'), nrows = 6)
	colnames(activityDesc) <- c("activitykey", "activity")
	
	#extract test data
	testData <- paste(dataDir, "test/X_test.txt", sep='/')
	testAct <- paste(dataDir, "test/y_test.txt", sep='/')
	testSubject <- paste(dataDir , "test/subject_test.txt", sep='/')
	testFrame <- getData(testData, testAct, testSubject, colToExtract)
	
	#extract train Data
	trainData <- paste(dataDir, "train/X_train.txt", sep='/')
	trainAct <- paste(dataDir, "train/y_train.txt", sep='/')
	trainSubject <- paste(dataDir, "train/subject_train.txt", sep='/')
	trainFrame <- getData(trainData, trainAct, trainSubject, colToExtract)	
	
	#mergedData
	mergedData <- merge(rbind(testFrame, trainFrame), activityDesc, x.by= "activitykey", y.by = "activitykey")
	#mergedData <- merge(testFrame, activityDesc, x.by= "activitykey", y.by = "activitykey")
	
	rm(testFrame, trainFrame)
	mergedData
}


# extract column with the regex from column file
colToExtract <- function (colFile, regex = "mean\\(|std\\(") {
	#read files with column field and only grep the columns that match the regex
	colLabel <-  read.csv(colFile, sep = " ", header = FALSE)
	colLabel <- colLabel[grep(regex, colLabel[[2]]),]
	colnames(colLabel) <- c("colNum", "colName")
	
	#modify the column names
	#colLabel$colName <- gsub("mean", "Mean", colLabel$colName)
	#colLabel$colName <- gsub("std", "Std", colLabel$colName)
	colLabel$colName <- gsub("\\(|\\)|\\-", "", colLabel$colName)	
	colLabel
}


# extract data from data, activity and subject file and join the data into one set
getData <- function ( dataFile,  activityFile, subjectFile, colList ) {
	# read data file
    df <- read.table(dataFile, colClasses="numeric", strip.white = TRUE)
    df <- df[,colList[[1]]]
    colnames(df) <- colList[[2]]
     
    # read activity file
    actList <- read.table(activityFile, strip.white = TRUE, colClasses="numeric")
    colnames(actList) <- c("activitykey")
  
	#read subject file
  	subList <- read.table(subjectFile, strip.white = TRUE, colClasses="numeric")  
    colnames(subList) <- c("subject")
  
 	#combine the three dataset 
    cbind(subList, actList, df)
}

