## CookBook
=======
The Test and Train datasets consist of 3 files containing the details of the measurements, the subject who performed the experiment and the activities. Each file contains a fixed number of row which match with the other files whereby each row can be associated to the other files by its line numbre.

The different type of variables are explained below:

###Activities 

File name: y_test.txt, y_train.txt

	Code	Type
	1		WALKING
	2		WALKING_UPSTAIRS
	3		WALKING_DOWNSTAIRS
	4		SITTING
	5		STANDING
	6		LAYING

###Subjects and experiment groups

File name: subject_test.txt

	Subject#	Group
	2			Test
	4			Test
	9			Test
	10			Test
	12			Test
	13			Test
	18			Test
	20			Test
	24			Test
	1			Train
	3			Train
	5			Train
	6			Train
	7			Train
	8			Train
	11			Train
	14			Train
	15			Train
	16			Train
	17			Train
	19			Train
	21			Train
	22			Train
	23			Train
	25			Train
	26			Train
	27			Train
	28			Train
	29			Train
	30			Train

###Measurements

File name: X_test.txt, X_train.txt

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

	tBodyAcc-XYZ
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc-XYZ
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag
	gravityMean
	tBodyAccMean
	tBodyAccJerkMean
	tBodyGyroMean
	tBodyGyroJerkMean

The set of measurements were summarized using the functions below:

	mean(): Mean value
	std(): Standard deviation
	mad(): Median absolute deviation 
	max(): Largest value in array
	min(): Smallest value in array
	sma(): Signal magnitude area
	energy(): Energy measure. Sum of the squares divided by the number of values. 
	iqr(): Interquartile range 
	entropy(): Signal entropy
	arCoeff(): Autorregresion coefficients with Burg order equal to 4
	correlation(): correlation coefficient between two signals
	maxInds(): index of the frequency component with largest magnitude
	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
	skewness(): skewness of the frequency domain signal 
	kurtosis(): kurtosis of the frequency domain signal 
	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
	angle(): Angle between to vectors.

The above datasets are read using read.csv function and store as a dataframe. 

	training_a <- read.csv("UCI HAR Dataset\\train\\y_train.txt", header=FALSE, sep="")

In order to merge the 3 datasets, a temporal Id column was created and a sequential number was given. 

	training_a$id <- 1:7352
	
Then the Merge function can be used to join the records with same line number.	
	
	training_dataset <- merge(training_s,training_a, by.x="id", by.y="id")
	
The Test and Train datasets were concatenated using rbind function
	
	full_dataset <- rbind(training_dataset,test_dataset)
	
The final dataset is a subsetting of the original dataset but only with the columns requested.

	dataset <- full_dataset[ ,colMeanStd]

Finally, the numeric Activity values was replaced by an string with the meaning of each one.
	
	dataset$Activity[dataset$Activity == 1] <- "WALKING"
	dataset$Activity[dataset$Activity == 2] <- "WALKING_UPSTAIRS"
	dataset$Activity[dataset$Activity == 3] <- "WALKING_DOWNSTAIRS"
	dataset$Activity[dataset$Activity == 4] <- "SITTING"
	dataset$Activity[dataset$Activity == 5] <- "STANDING"
	dataset$Activity[dataset$Activity == 6] <- "LAYING"
	
The second dataset was generated with Aggregate function using the measurement columns (from 4 to 89) and grouping be Activities and Subject.
	
	aggregate(dataset[, 4:89],list(Activity=dataset$Activity,Subject=dataset$Subject), mean ) 