---
output: html_document
---
# GetCleanData_CourseProject

This repo is created for the Coursera's "Getting and Cleaning Data" course project. It contains two files:

* an R script that creates a tidy data set (as described by the task specification);
* a code book giving information oabout the variables and their levels. 

The strategy undertaken is as follows:

In **STEP 1**, the separate files are clipped together using cbind and rbind commands, to form file containing all the information from the training and the test sets. 

In **STEP 2**, a subset of the STEP 1 data set is created, containing only the variables of intreset (i.e., containing measurements of mean and standard deviation). To do this, the file containing the feature names is read and a vector of indexes is created corresponding to the measurements of interest. Then a subset is created, containing the columns with the corresponding indexes, precede by "id"" and "activity". 

It is assumed that mean frequencies are not needed for this subset, so an additional effort is made to exclude these from the subset. 

In **STEP 3**, descriptive activity names to name the activities in the data set are given by first reading the file containing activity labels, then doing some editing (convert to lower case), and finally merging the table with the subset created in Step 2, using the common variable (label code). The duplicate column ("code") is then deleted.

In **STEP 4**, measurements are given appropriate descriptive names. Some text editing is made to discard illegal characters and replace the abbreviations with more informative strings. For the ease of reading, some underscores ("_") and uppercase letters are added. The full description of the features is given in the code book. 

Finally in this step the edited vector is assigned as names for the data set from Step 3. To conform with the data set structure, first the "activity" abd "id" names are assigned, followed by the vector described above. 

In the final **STEP 5**, a second, tidy data set is created, with the average of each variable for each activity and each subject. To do this, first the data set is reshaped into "long" form, so that different measurements become levels of one variable ("feature"). The data are then summarized by subject, activity, and measurement using the ddply command form the plyr package [(Wickham, 2011)](http://www.jstatsoft.org/v40/i01/). The resulting data set is written to "tidyData.txt"" file. As a final step, all the abject in the R workplace but the final data set ("tidy2") are removed.

Additional details are given as comments in the R script

##References
Hadley Wickham (2011). The Split-Apply-Combine Strategy for Data Analysis. Journal of Statistical Software, 40(1), 1-29. URL http://www.jstatsoft.org/v40/i01/. 


