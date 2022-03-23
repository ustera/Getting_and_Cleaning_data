# Getting and Cleaning data: Course Project
**Author**: Ekaterina Zalivina

## Review criteria
| Item | Links |
| --- | --- |
| Raw data | [Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) |
| Tidy dataset | [Link](Dataset.txt) |
| Codebook | [Link](Codebook.md) |
| Script | [Link](run_analysis.R) |

## How the script works

**1 step** - download the raw data from [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

**2 step** - import libraries `data.table`, `reshape2`, `dplyr` and get the working direcory

**3 step** - upload file 'features.txt' and extract necessary features (mean and std)

**4 step** - upload files from 'train' and combine all of them

**5 step** - upload files from 'test' and combine all of them

**6 step** - using factor combine test and train, add activity labels

**7 step** - create new data set from **step 6**, count the average of each variable for each activity and each subject in new dataset and use pivot wider

**8 step** - write in new file the dataset from **step 7**

## Link to the script

[Script](run_analysis.R)
