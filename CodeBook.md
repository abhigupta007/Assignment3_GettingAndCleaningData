Assignment3_GettingAndCleaningData
==================================
1. Variable Description (added below columns using )
    ActivityId -  using test label
    ActivityName - from the activity labels file
    SubjectId - the subjects who were part of this study
    All other 561 variables (came from features.txt)

2. Data - since all the files were available across folders, I placed all of them in a single working directory

    STEPS FOR DATA PROCESSING
3. Read information about features, activity, subject, test data set and training data set
4. combined test set, training data set and added activity names
5. filtered for columns with mean() and std()
6. TidyDataset() was then created by averaging the values - across these features
    
