library(data.table)
library(reshape2)
library(dplyr)
path <- getwd()

#Download data
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', 
              file.path(path, 'data.zip'))
unzip(zipfile = 'data.zip')

#Extract features
file <- paste0(path, '/UCI HAR Dataset/features.txt')
measurements <- read.table(file, sep = ' ', col.names = c('index', 'feature'))
ness_features <- grep('(mean|std)\\(\\)', measurements$feature)
features <- grep('(mean|std)\\(\\)', measurements$feature, value = TRUE)
features <- gsub('[()]', '', features)

#Combine train data
file <- paste0(path, '/UCI HAR Dataset/train/X_train.txt')
train <- fread(file)[, ness_features, with = FALSE]
data.table::setnames(train, colnames(train), features)
file <- paste0(path, '/UCI HAR Dataset/train/y_train.txt')
train_activities <- fread(file, col.names = c('activity'))
file <- paste0(path, '/UCI HAR Dataset/train/subject_train.txt')
train_subject <- fread(file, col.names = c('subject'))
train <- cbind(train_subject, train_activities, train)

#Combine test data
file <- paste0(path, '/UCI HAR Dataset/test/X_test.txt')
test <- fread(file)[, ness_features, with = FALSE]
data.table::setnames(test, colnames(test), features)
file <- paste0(path, '/UCI HAR Dataset/test/y_test.txt')
test_activities <- fread(file, col.names = c('activity'))
file <- paste0(path, '/UCI HAR Dataset/test/subject_test.txt')
test_subject <- fread(file, col.names = c('subject'))
test <- cbind(test_subject, test_activities, test)

#Combine train and test data
full_data <- rbind(train, test)
file <- paste0(path, '/UCI HAR Dataset/activity_labels.txt')
full_data$subject <- as.factor(full_data[, subject])
activity_lables <- fread(file, col.names = c('index', 'activity'))
full_data$activity <- factor(full_data[, activity], 
                                  levels = activity_lables$index,
                                  labels = activity_lables$activity)

#Create new dataset from previous
dataset2 <- melt(full_data, id = c('subject', 'activity'))
dataset2 %>% 
  group_by(subject, activity, variable)%>% 
  summarise(mean_value = mean(value)) %>% 
  tidyr::pivot_wider(names_from = variable, values_from = mean_value)-> dataset2

write.table(x = dataset2, file = 'Dataset.txt', row.name=FALSE)
