## Structure of raw data

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- train
  - 'train/X_train.txt': Training set.
  - 'train/y_train.txt': Training labels.
  - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- test
  - 'test/X_test.txt': Test set.
  - 'test/y_test.txt': Test labels.
  - 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

## Variables
`file` - the path to the file on the computer 

`features` - vector with necessary features (*mean* or *std*) from 'features.txt'

`activity_lables`- activity labels from 'activity_labels.txt'

`train` - combined train data from 'train/X_train.txt', 'train/y_train.txt', 'train/subject_train.txt'

`test` - combined test data from 'test/X_test.txt', 'test/y_test.txt', 'test/subject_test.txt

`full_data` - combining `test` and `train` data

`dataset2` - new dataset from `full_data` with the average of each variable for each `activity` and each `subject`
