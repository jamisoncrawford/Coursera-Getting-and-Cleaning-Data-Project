
# COURSERA: "GETTING & CLEANING DATA", COURSE PROJECT

## 2018-06-07
## R v. 3.4.3
## RStudio v. 1.1.414


# Install required packages

if( !require( dplyr ) ) { install.packages( "dplyr" ) }
if( !require( tidyr ) ) { install.packages( "tidyr" ) }

library( dplyr )
library( tidyr )


# (I) MERGE TRAINING & TEST SETS


# Create "./data" file and download zipped datasets

if( !file.exists( "./data" )){ dir.create( "./data" )}

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file( url, 
               destfile = "./data/dataset.zip", 
               method = "curl" )

rm( url )


# Unzip datasets and create file name vector: "names"

unzip( zipfile = "./data/dataset.zip" )
names <- unzip( zipfile = "./data/dataset.zip", list = TRUE )[[ "Name" ]]


# Store and rename columns in "activities"; relabel values to lowercase

activities <- read.table( file = names[1], 
                          stringsAsFactors = FALSE,
                          col.names = c( "activity_label", "activity" ))

activities$activity <- tolower( activities$activity )


# Store and rename columns in "features"

features <- read.table( file = names[2],
                        stringsAsFactors = FALSE,
                        col.names = c( "feature_label", "feature" ))


# Read in and store subject data: "test_subs", "train_subs"

test_subs <- read.table( names[ 16 ],
                         col.names = "subject" )
train_subs <- read.table( names[ 30 ],
                          col.names = "subject" )


# Read in and store training and test sets data: "test_set", "train_set"

test_set <- read.table( names[ 17 ],
                        col.names = features$feature )
train_set <- read.table( names[ 31 ],
                         col.names = features$feature )


# Read in and store training and test labels data: "test_labs", "train_labs"

test_labs <- read.table( names[ 18 ], 
                         col.names = "activity" )
train_labs <- read.table( names[ 32 ],
                          col.names = "activity" )


# Merge test and training datasets: "train_merged" + "test_merged" == "all_data"

train_merged <- bind_cols( test_subs, 
                           test_labs, 
                           test_set )

test_merged <- bind_cols( train_subs, 
                          train_labs, 
                          train_set )

all_data <- bind_rows( train_merged, 
                       test_merged )


# Convert variable "activity" to leveled and labeled factors

all_data$activity <- factor( x = all_data$activity, 
                             levels = activities[ , 1 ], 
                             labels = activities[ , 2 ] )


# Remove obsolete objects

rm( activities,
    features,
    train_labs,
    train_set,
    train_subs,
    train_merged,
    test_labs,
    test_set,
    test_subs,
    test_merged,
    names )


# (II) EXTRACT MEASURES ON MEAN & STANDARD DEVIATION COLUMNS


# Detect column names containing ".mean.." & ".std.." by position

select_cols <- grep( x = colnames( all_data ), 
                       pattern = "\\.mean\\.|\\.std\\." )


# Add variables "subject" and "activity"

select_cols <- c( 1, 2, select_cols )


# Select variables of interest: "select_data"; remove obsolete objects

select_data <- all_data %>%
    select( select_cols )

rm( select_cols )


# (III) CREATE TIDY DATASET; SUMMARIZE VARIABLE MEANS GROUPED BY ACTIVITY, SUBJECT


# Gather "select_data" for tidy dataset
# Group by "variable", "activity", "subject"
# Aggregate mean, "average", for each subgroup
# Spread "average" to original columns: "tidy_data"

tidy_data <- gather( data = select_data, 
                     key = variable, 
                     value = value, 
                     3:68 ) %>%
    group_by( variable, subject, activity ) %>%
    summarize( average = mean( value ) ) %>%
    spread( key = variable, value = average )

# Write to .txt file: "tidy_data.txt"

write.table( x = tidy_data, 
             file = "tidy_data.txt", 
             row.names = FALSE )
