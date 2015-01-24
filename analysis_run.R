## Read activity file
  setwd("C:/coursera/getting_cleaning_data/data/UCI HAR Dataset/")
  temp = read.table("activity_labels.txt", sep = "")
  activityLabels = as.character(temp$V2)
## Read feature file
  temp = read.table("features.txt", sep = "")
  attributeNames = temp$V2
## Read attributes file
  Xtrain = read.table("train/X_train.txt", sep = "")
  names(Xtrain) = attributeNames
## Read train data activity file
  Ytrain = read.table("train/y_train.txt", sep = "")
  names(Ytrain) = "Activity"
  Ytrain$Activity = as.factor(Ytrain$Activity)
  levels(Ytrain$Activity) = activityLabels
## Read train data subject file
  trainSubjects = read.table("train/subject_train.txt", sep = "")
  names(trainSubjects) = "subject"
  trainSubjects$subject = as.factor(trainSubjects$subject)
## Create train dataset
  train = cbind(Xtrain, trainSubjects, Ytrain)
## Read test data file 
  Xtest = read.table("/test/X_test.txt", sep = "")
  names(Xtest) = attributeNames
## Read test activity file
  Ytest = read.table("test/y_test.txt", sep = "")
  names(Ytest) = "Activity"
  Ytest$Activity = as.factor(Ytest$Activity)
  levels(Ytest$Activity) = activityLabels
## Read test subject file
  testSubjects = read.table("test/subject_test.txt", sep = "")
  names(testSubjects) = "subject"
  testSubjects$subject = as.factor(testSubjects$subject)
## create test dataset
  test = cbind(Xtest, testSubjects, Ytest)
  
  rm(temp, Ytrain, Ytest, Xtrain, Xtest, attributeNames)
## Combine test & train datasets
  merged_data<-rbind(test,train)
## Select only mean & std columns
  mean_sd_data<-merged_data[,c(grep("\\mean()",names(merged_data)),grep("\\Std()",names(merged_data)))]
## Calculate avg of all the columns in the data
  avg_mean_sd_data<-as.data.frame(colMeans(mean_sd_data[,-1]))
## Write the data frame to txt file  
  write.table(avg_mean_sd_data,"C:/coursera/getting_cleaning_data/project/get_clean_data_assignment.txt",row.names=FALSE)
  
