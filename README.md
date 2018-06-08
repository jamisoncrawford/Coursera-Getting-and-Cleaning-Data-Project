# Getting and Cleaning Data: Final Course Project

**Overview:** Final course project for "Getting and Cleaning Data", Course 3 in Johns Hopkins University's "Data Science Specialization". 
This project merges modeling and hold-out data on inertial signals for Samsung wearable computing technology, relabeling variables and values to human-readable format and creating a tidy dataset of mean values across 68 variables of interest and 10,299 observations.

## Raw Data and Documentation

Raw data for this project is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
Documentation is included within the .zip file `FUCI HAR Dataset`. Additional documentation is available from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Instructions

Project instructions for final submission require the present `README.md` as well as the `CodeBook.md` containing variable definitions, the R script `run_analysis.r` for merging the modeling and hold-out data, selecting variables of interest, and aggregating mean values for those variables in a tidy dataset, `tidy_data.txt`.
Of the original 581 variables, variables of interest were comprised of 66 variables containing means and standard deviations. Lastly, all variables were to be renamed in human-readable format, as well as relabeling of six activities during which inertial signals were measured.

## Script

Script `run_analysis.r` performs the following tasks:

1. Detects and loads required packages [tidyr](http://tidyr.tidyverse.org/) and [dplyr](https://dplyr.tidyverse.org/), automatically installing if necessary;
2. Detects, creating if necessary, directory `./data`, in which it downloads and unzips `FUCI HAR Dataset`;
3. Creates a vector of file names `names` for reference;
4. Reads in `activities` and `features` data frames;
5. Reads in all training and testing data on subjects, activities, and features (normalized inertial measures);
6. Merges all data into a single data frame `all_data`;
7. Recodes `activity` variable as human-readable corresponding labels;
8. Extracts all variables containing "mean" and "standard deviation" statistics: `select_data`;
9. Gathers and produces aggregate mean values for each variable by `subject` and `activity`;
10. Spreads columns of aggregate mean values to create `tidy_data`, a tibble with 180 observations and 68 variables;
11. Writes `tidy_data.txt` to working directory
