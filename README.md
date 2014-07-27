### Getting and Cleaning data course project

The script uses datasets obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and merge them together to create one data set.

The below files were used to generate the dataset.
 - X_test.txt: list of test measurements
 - y_test.txt: list of test activities (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING)
 - subject_test.txt: subjects who performed the experiments

 - X_train.txt: list of train measurements
 - y_train.txt: list of train activities (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING)
 - subject_train.txt: subjects who performed the experiments 

The Script works as follow:

1.  Read the 3 Test datasets and store them in separate data frame objects.
2.  Include a column with a sequential id that is used to merge the data.
3.  Merge the Test data into a dataset using the sequential ids and include a column with the type of the data ("Test")
4.  Read the 3 Train datasets and store them in separate data frame objects
5.  Include a column with a sequential id that is used to merge the data.
6.  Merge the Test data into a dataset using the sequential ids and include a column with the type of the data ("Train")
7.  Concatenate the Test and Train datasets
8.  Create a new dataset only with mean and standard deviation measurements and the rest of the attributes 
9.  Rename the colums with a descriptive value and remove ID column
10.  Replace activity values with a descriptive value

