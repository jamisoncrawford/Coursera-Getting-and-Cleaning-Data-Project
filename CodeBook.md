# Getting and Cleaning Data: Project Code Book

**Overview:** The following variables correspond to the `tidy_data.txt` file in the [Getting and Cleaning Data Project Repository](https://github.com/jamisoncrawford/Coursera-Getting-and-Cleaning-Data-Project/new/master).

## Raw Data and Documentation

Raw data for this project is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
Documentation is included within the .zip file `FUCI HAR Dataset`. Additional documentation is available from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Subject & Activity Variables

- `subject` contains the subject ID for each of 30 volunteers within the age bracket of 19-48 years. These subjects performed each `activity`, described below, wearing a Samsung Galaxy S II smartphone on their waist. 
- `activity` contains 1 of 6 physical activities, labeled 1, 2, 3, 4, 5, and 6 for (1) `walking`, (2) `walking_upstairs`, (3) `walking_downstairs`, (4) `sitting`, (5) `standing`, and (6) `laying`, respectively. The experiment was video-recorded to label these data manually.

**Transformations:** `activity` was transformed from the raw data's numeric labels to text labels for comprehension.

## Feature Variables

**Overview:** Feature variables were measured in 3-axial (X-Y-Z) raw signals using an accelerometer and gyroscope and captures at a constant rate of 50 Hz. To remove noise, signals were filtered using a median filter and a 3rd order low-pass Butterworth filter with a corner frequency of 20 Hz. Acceleration signals were separated into body and gravity acceleration signals, again using a low-pass Butterworth filter and a corner frequency of 0.3 Hz. Body linear acceleration and angular velocity were derived to obtain Jerk signals. The magnitude of 3-dimensional signals were calcualted using Euclidean norm.

- `tBodyAcc-XYZ` indicates 3-axial body acceleration; time domain signal
- `tGravityAcc-XYZ` indicates 3-axial gravity acceleration; time domain signal
- `tBodyAccJerk-XYZ` indicates 3-axial body acceleration of jerk signals; time domain signal
- `tBodyGyro-XYZ` indicates 3-axial gyroscopic body signals; time domain signal
- `tBodyGyroJerk-XYZ` indicates 3-axial gyroscopic jerk signals; time domain signal
- `tBodyAccMag` indicates body acceleration computed using Euclidean Norm; time domain signal
- `tGravityAccMag` indicates gravity acceleration computed using Euclidean Norm; time domain signal
- `tBodyAccJerkMag` indicates body acceleration of jerk signals computed using Euclidean Norm; time domain signal
- `tBodyGyroMag` indicates gyroscopic signals computed using Euclidean Norm; time domain signal
- `tBodyGyroJerkMag` indicates gyroscopic jerk signals computed using Euclidean Norm; time domain signal
- `fBodyAcc-XYZ` indicates 3-axial body acceleration with Fast Fourier Transform (FFT); frequency domain signal
- `fBodyAccJerk-XYZ` indicates 3-axial body acceleration of jerk signals with Fast Fourier Transform (FFT); frequency domain signal
- `fBodyGyro-XYZ` indicates 3-axial gyroscopic body signals; frequency domain signal
- `fBodyAccMag` indicates body acceleration; frequency domain signal
- `fBodyAccJerkMag` indicates body acceleration of jerk signals with Fast Fourier Transform (FFT); frequency domain signal
- `fBodyGyroMag` indicates gyroscopic body signals with Fast Fourier Transform (FFT); frequency domain signal
- `fBodyGyroJerkMag` indicates gyroscopic body jerk signals with Fast Fourier Transform (FFT); frequency domain signal

**Variable Permutations:** The raw signal data contain various permutations of the above variables and several descriptive statistics, however only the following descriptive statistics were kep in `tidy_data.txt`:

- `mean()` indicating the average value of the inertial signals of each of the above measures
- `std()` indicating the standard deviation of the inertial signals of each of the above measures

**Additional Variable Transformations**

The resulting data in `tidy_data.txt` were the mean values of permutations of the above inertial signals and descriptive statistics grouped by `subject` and `activity`. Averaging these values by said groups reduced the data from 10,299 observations to 180, the product of 30 instances of `subject` and 6 distinct instances of physical `activity`.
