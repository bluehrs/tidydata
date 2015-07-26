run_analysis <- function() {
  #read all files into data frames
  testsubject <- read.table("./test/subject_test.txt")
  testx <- read.table("./test/X_test.txt")
  testy <- read.table("./test/y_test.txt")
  trainsubject <- read.table("./train/subject_train.txt")
  trainx <- read.table("./train/X_train.txt")
  trainy <- read.table("./train/y_train.txt")
  activities <- read.table("activity_labels.txt")
  features <- read.table("features.txt")
  #add subjects and activities to test data frame
  test <- mutate(testx,subject=testsubject[,1])
  test <- mutate(test,activity=testy[,1])
  #add subjects and activities to train data frame
  train <- mutate(trainx,subject=trainsubject[,1])
  train <- mutate(train,activity=trainy[,1])
  #combine test and train into one combined data frame
  combined <- merge(test,train,all=TRUE)
  #add variable names to combined data frame from features data frame
  featurenames <- features[,2]
  featurenames <- as.character(featurenames)
  names(combined) <- c(featurenames, "subject", "activity")
  #find mean and std variables
  featuresindex <- grep("mean()|std()",features$V2,value=TRUE)
  #remove meanFreq variable if accidentally included
  featuresindex <- grep("meanFreq()",featuresindex,value=TRUE, invert=TRUE)
  #keep only mean and std variables and subject and activity
  combined <- combined[,c(featuresindex,"subject","activity")]
  #turn activity numbers into names
  combined$activity <- as.factor(combined$activity)
  levels(combined$activity) <- activities[,2]
  #create tidy data set with average of each variable for each activiy and subject
  tidy <- aggregate(combined[,1:66],by=list(subject = combined$subject, 
                                            activity = combined$activity),FUN=mean)
  #write tidy data set to file
  write.table(tidy,"tidy.txt",row.name=FALSE)
}