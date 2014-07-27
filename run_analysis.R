
#Read the Test data sets 
test_m <- read.csv("UCI HAR Dataset\\test\\X_test.txt", header=FALSE, sep="")
test_a <- read.csv("UCI HAR Dataset\\test\\y_test.txt", header=FALSE, sep="")
test_s <- read.csv("UCI HAR Dataset\\test\\subject_test.txt", header=FALSE, sep="")

#Set columns names so that can be easier to work
colnames(test_s) <- c("Subject")
colnames(test_a) <- c("Activity")

#Add a column with a sequential id to merge the rows
test_m$id <- 1:2947
test_a$id <- 1:2947
test_s$id <- 1:2947

#Merge the 3 data types
test_dataset <- merge(test_s,test_a, by.x="id", by.y="id")
test_dataset$DataType <- rep(c("Test"),2947)
test_dataset <- merge(test_dataset,test_m, by.x="id", by.y="id")


#Read the Training data sets 
training_m <- read.csv("UCI HAR Dataset\\train\\X_train.txt", header=FALSE, sep="")
training_a <- read.csv("UCI HAR Dataset\\train\\y_train.txt", header=FALSE, sep="")
training_s <- read.csv("UCI HAR Dataset\\train\\subject_train.txt", header=FALSE, sep="")

#Set columns names so that can be easier to work
colnames(training_s) <- c("Subject")
colnames(training_a) <- c("Activity")

#Add a column with a sequential id to merge the rows
training_m$id <- 1:7352
training_a$id <- 1:7352
training_s$id <- 1:7352

#Merge the 3 data types
training_dataset <- merge(training_s,training_a, by.x="id", by.y="id")
training_dataset$DataType <- rep(c("Training"),7352)
training_dataset <- merge(training_dataset,training_m, by.x="id", by.y="id")

#Concatenate both datasets
full_dataset <- rbind(training_dataset,test_dataset)

#Set a variable with the name of the columns with mean and standard deviation measurements
colMeanStd <- c("id","Subject","Activity","DataType", "V1","V2","V3","V41","V42","V43","V81","V82","V83","V121","V122","V123","V161","V162","V163","V201","V214","V227","V240","V253","V266","V267","V268","V294","V295","V296","V345","V346","V347","V373","V374","V375","V424","V425","V426","V452","V453","V454","V503","V513","V516","V526","V529","V539","V542","V552","V555","V556","V557","V558","V559","V560","V561","V4","V5","V6","V44","V45","V46","V84","V85","V86","V124","V125","V126","V164","V165","V166","V202","V215","V228","V241","V254","V269","V270","V271","V348","V349","V350","V427","V428","V429","V504","V517","V530","V543")

#Extracts only the columns required for the final dataset
dataset <- full_dataset[ ,colMeanStd]

#Remane columns with descriptive value
newCols <- c("Id","Subject","Activity","DataType","tBodyAcc-mean-X","tBodyAcc-mean-Y","tBodyAcc-mean-Z","tGravityAcc-mean-X","tGravityAcc-mean-Y","tGravityAcc-mean-Z","tBodyAccJerk-mean-X","tBodyAccJerk-mean-Y","tBodyAccJerk-mean-Z","tBodyGyro-mean-X","tBodyGyro-mean-Y","tBodyGyro-mean-Z","tBodyGyroJerk-mean-X","tBodyGyroJerk-mean-Y","tBodyGyroJerk-mean-Z","tBodyAccMag-mean","tGravityAccMag-mean","tBodyAccJerkMag-mean","tBodyGyroMag-mean","tBodyGyroJerkMag-mean","fBodyAcc-mean-X","fBodyAcc-mean-Y","fBodyAcc-mean-Z","fBodyAcc-meanFreq-X","fBodyAcc-meanFreq-Y","fBodyAcc-meanFreq-Z","fBodyAccJerk-mean-X","fBodyAccJerk-mean-Y","fBodyAccJerk-mean-Z","fBodyAccJerk-meanFreq-X","fBodyAccJerk-meanFreq-Y","fBodyAccJerk-meanFreq-Z","fBodyGyro-mean-X","fBodyGyro-mean-Y","fBodyGyro-mean-Z","fBodyGyro-meanFreq-X","fBodyGyro-meanFreq-Y","fBodyGyro-meanFreq-Z","fBodyAccMag-mean","fBodyAccMag-meanFreq","fBodyBodyAccJerkMag-mean","fBodyBodyAccJerkMag-meanFreq","fBodyBodyGyroMag-mean","fBodyBodyGyroMag-meanFreq","fBodyBodyGyroJerkMag-mean","fBodyBodyGyroJerkMag-meanFreq","angle-tBodyAccMean-gravity","angle-tBodyAccJerkMean-gravityMean","angle-tBodyGyroMean-gravityMean","angle-tBodyGyroJerkMean-gravityMean","angle-X-gravityMean","angle-Y-gravityMean","angle-Z-gravityMean","tBodyAcc-std-X","tBodyAcc-std-Y","tBodyAcc-std-Z","tGravityAcc-std-X","tGravityAcc-std-Y","tGravityAcc-std-Z","tBodyAccJerk-std-X","tBodyAccJerk-std-Y","tBodyAccJerk-std-Z","tBodyGyro-std-X","tBodyGyro-std-Y","tBodyGyro-std-Z","tBodyGyroJerk-std-X","tBodyGyroJerk-std-Y","tBodyGyroJerk-std-Z","tBodyAccMag-std","tGravityAccMag-std","tBodyAccJerkMag-std","tBodyGyroMag-std","tBodyGyroJerkMag-std","fBodyAcc-std-X","fBodyAcc-std-Y","fBodyAcc-std-Z","fBodyAccJerk-std-X","fBodyAccJerk-std-Y","fBodyAccJerk-std-Z","fBodyGyro-std-X","fBodyGyro-std-Y","fBodyGyro-std-Z","fBodyAccMag-std","fBodyBodyAccJerkMag-std","fBodyBodyGyroMag-std","fBodyBodyGyroJerkMag-std")
colnames(dataset) <- newCols

#Removes ID column which is longer required
dataset$Id<-NULL

#Rename activities with descriptive value
dataset$Activity[dataset$Activity == 1] <- "WALKING"
dataset$Activity[dataset$Activity == 2] <- "WALKING_UPSTAIRS"
dataset$Activity[dataset$Activity == 3] <- "WALKING_DOWNSTAIRS"
dataset$Activity[dataset$Activity == 4] <- "SITTING"
dataset$Activity[dataset$Activity == 5] <- "STANDING"
dataset$Activity[dataset$Activity == 6] <- "LAYING"

dataset

#write.table(dataset,file="dataset.csv",sep=",",row.names=FALSE)

#dataset2 <- aggregate(dataset[, 4:89],list(Activity=dataset$Activity,Subject=dataset$Subject), mean ) 
#write.table(dataset2,file="dataset2.csv",sep=",",row.names=FALSE)

