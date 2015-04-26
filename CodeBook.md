## Samsung data Code Book

The data set is based on the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) provided for the course project of the "Getting & Cleaning Data" course form Coursera John Hopkins "Data Science" Specialization. The original data is taken from the webpage [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ). As explained ont the page, the data were collected from 30 volunteers wearing Samsung Galaxy smarphones on their waist, for six activities (to be described below). The data were collected via accelerometers and gyroscopes built in the devices, where the accelerometer measured the linear acceleration while the gyroscope measured the angular velocity. As is mentioned on the webpage, "a vector of features was obtained by calculating variables from the time and frequency domain". A more detailed description is availabe on the [webpage](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ). 

For the purposes of the task, the raw data provided in the course was filtered and reshaped, as described in the README.md file. This resulted in four variables, described in what follows.

<p>**id:** &nbsp;&nbsp;&nbsp;unique identification number assigned to each participant </p>
<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;30 levels: from 1 to 30 </p>
        

<p>**activity:** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Type of activity measured </p>
<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6 levels: </p>
* "Walking"
* "Walking Upstairs"
* "Walking downstairs"
* "Sitting"
* "Stading"
* "Laying"
        

<p> **feature:** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Measurements from the devices containing mean and standard deviation (as specified in the Course Project)</p>

<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;66 levels: </p>
* "time_BodyAcceleration_mean_ X"    mean linear body acceleration on the X axis (time domain)           
* "time_BodyAcceleration_mean_Y"     mean linear body acceleration on the Y axis (time domain)                     
*"time_BodyAcceleration_mean_Z"             mean linear body acceleration on the Z axis (time domain)              
* "time_BodyAcceleration_std_X"              standard deviation of linear body acceleration on the X axis (time domain)            
* "time_BodyAcceleration_std_Y"              standard deviation of linear body acceleration on the Y axis (time domain)              
* "time_BodyAcceleration_std_Z"              standard deviation of linear body acceleration on the Z axis (time domain)             
* "time_GravityAcceleration_mean_X"          mean gravity acceleration on the X axis (time domain)  
* "time_GravityAcceleration_mean_Y"          mean gravity acceleration on the Y axis (time domain) 
* "time_GravityAcceleration_mean_Z"          mean gravity acceleration on the Z axis (time domain)  
* "time_GravityAcceleration_std_X"           standard deviation of gravity acceleration on the X axis (time domain) 
* "time_GravityAcceleration_std_Y"           standard deviation of gravity acceleration on the Y axis (time domain)  
* "time_GravityAcceleration_std_Z"           standard deviation of gravity acceleration on the Z axis (time domain) 
* "time_BodyAccelerationJerk_mean_X"         mean linear body acceleration on the X axis, Jerk signals (time domain)  
* "time_BodyAccelerationJerk_mean_Y"         mean linear body acceleration on the Y axis, Jerk signals (time domain) 
* "time_BodyAccelerationJerk_mean_Z"         mean linear body acceleration on the Z axis, Jerk signals (time domain)  
* "time_BodyAccelerationJerk_std_X"          standard deviation of linear body acceleration on the X axis, Jerk signals (time domain) 
* "time_BodyAccelerationJerk_std_Y"          standard deviation of linear body acceleration on the Y axis, Jerk signals (time domain)  
* "time_BodyAccelerationJerk_std_Z"          standard deviation of linear body acceleration on the Z axis, Jerk signals (time domain) 
* "time_BodyGyro_mean_X"                     mean body angular velocity on the X axis (time domain)
* "time_BodyGyro_mean_Y"                     mean body angular velocity on the Y axis (time domain) 
* "time_BodyGyro_mean_Z"                     mean body angular velocity on the Z axis (time domain)  
* "time_BodyGyro_std_X"                      standard deviation of body angular velocity on the X axis (time domain) 
* "time_BodyGyro_std_Y"                      standard deviation of body angular velocity on the Y axis (time domain)  
* "time_BodyGyro_std_Z"                      standard deviation of body angular velocity on the Z axis (time domain) 
* "time_BodyGyroJerk_mean_X"                 mean body angular velocity on the X axis, Jerk signals (time domain)  
* "time_BodyGyroJerk_mean_Y"                 mean body angular velocity on the Y axis, Jerk signals (time domain)  
* "time_BodyGyroJerk_mean_Z"                 mean body angular velocity on the Z axis, Jerk signals (time domain)   
* "time_BodyGyroJerk_std_X"                  standard deviation of body angular velocity on the X axis, Jerk signals (time domain)  
* "time_BodyGyroJerk_std_Y"                  standard deviation of body angular velocity on the Y axis, Jerk signals (time domain)  
* "time_BodyGyroJerk_std_Z"                  standard deviation of body angular velocity on the Z axis, Jerk signals (time domain) 
* "time_BodyAccelerationMag_mean"            mean magnitude of linear body acceleration, calculated using the Euclidean norm (Time domain)  
* "time_BodyAccelerationMag_std"             standard deviation of the magnitude of linear body acceleration, calculated using the Euclidean norm (Time domain) 
* "time_GravityAccelerationMag_mean"         mean magnitude of gravity acceleration, calculated using the Euclidean norm (Time domain)  
* "time_GravityAccelerationMag_std"          standard deviation of the magnitude of gravity acceleration, calculated using the Euclidean norm (Time domain) 
* "time_BodyAccelerationJerkMag_mean"        mean magnitude of linear body acceleration, calculated using the Euclidean norm, Jerk signals (Time domain)  
* "time_BodyAccelerationJerkMag_std"         standard deviation of the magnitude of linear body acceleration, calculated using the Euclidean norm, Jerk signals (Time domain) 
* "time_BodyGyroMag_mean"                    mean magnitude of body angular velocity, calculated using the Euclidean norm (Time domain)  
* "time_BodyGyroMag_std"                     standard deviation of the magnitude of body angular velocity, calculated using the Euclidean norm (Time domain)
* "time_BodyGyroJerkMag_mean"                mean magnitude of body angular velocity, calculated using the Euclidean norm, Jerk signals (Time domain)  
* "time_BodyGyroJerkMag_std"                 standard deviation of the magnitude of body angular velocity, calculated using the Euclidean norm, Jerk signals (Time domain) 
* "frequency_BodyAcceleration_mean_X"        mean linear body acceleration on the X axis (frequency domain)  
* "frequency_BodyAcceleration_mean_Y"        mean linear body acceleration on the Y axis (frequency domain) 
* "frequency_BodyAcceleration_mean_Z"        mean linear body acceleration on the Z axis (frequency domain)  
* "frequency_BodyAcceleration_std_X"         standard deviation of the linear body acceleration on the X axis (frequency domain) 
* "frequency_BodyAcceleration_std_Y"         standard deviation of the linear body acceleration on the Y axis (frequency domain)  
* "frequency_BodyAcceleration_std_Z"         standard deviation of the linear body acceleration on the z axis (frequency domain) 
* "frequency_BodyAccelerationJerk_mean_X"    mean linear body acceleration on the X axis, Jerk signals (frequency domain)  
* "frequency_BodyAccelerationJerk_mean_Y"    mean linear body acceleration on the Y axis, Jerk signals (frequency domain) 
* "frequency_BodyAccelerationJerk_mean_Z"    mean linear body acceleration on the Z axis, Jerk signals (frequency domain)  
* "frequency_BodyAccelerationJerk_std_X"     standard deviation of the linear body acceleration on the X axis, Jerk signals (frequency domain) 
* "frequency_BodyAccelerationJerk_std_Y"     standard deviation of the linear body acceleration on the Y axis, Jerk signals (frequency domain)  
* "frequency_BodyAccelerationJerk_std_Z"     standard deviation of the linear body acceleration on the Z axis, Jerk signals (frequency domain) 
* "frequency_BodyGyro_mean_X"                mean body angular velocity on the X axis (frequency domain)  
* "frequency_BodyGyro_mean_Y"                mean body angular velocity on the Y axis (frequency domain) 
* "frequency_BodyGyro_mean_Z"                mean body angular velocity on the Z axis (frequency domain) 
* "frequency_BodyGyro_std_X"                 standard deviation of the body angular velocity on the X axis (frequency domain) 
* "frequency_BodyGyro_std_Y"                 standard deviation of the body angular velocity on the Y axis (frequency domain)  
* "frequency_BodyGyro_std_Z"                 standard deviation of the body angular velocity on the Z axis (frequency domain) 
* "frequency_BodyAccelerationMag_mean"       mean magnitude of linear body acceleration, calculated using the Euclidean norm (frequency domain)  
* "frequency_BodyAccelerationMag_std"        standard deviation of the magnitude of linear body acceleration, calculated using the Euclidean norm (frequency domain) 
* "frequency_BodyBodyAccelerationJerkMag_mean" mean magnitude of linear body acceleration, calculated using the Euclidean norm, Jerk signals (frequency domain)
* "frequency_BodyBodyAccelerationJerkMag_std"  standard deviation of the magnitude of linear body acceleration, calculated using the Euclidean norm, Jerk signals (frequency domain)
* "frequency_BodyBodyGyroMag_mean"            mean magnitude of body angular velocity, calculated using the Euclidean norm (frequency domain) 
* "frequency_BodyBodyGyroMag_std"             standard deviation of the magnitude of body angular velocity, calculated using the Euclidean norm (frequency domain)
* "frequency_BodyBodyGyroJerkMag_mean"        mean magnitude of body angular velocity, calculated using the Euclidean norm, Jerk signals (frequency domain) 
* "frequency_BodyBodyGyroJerkMag_std"         standard deviation of the magnitude of body angular velocity, calculated using the Euclidean norm, Jerk signals (frequency domain)

<p> **mean:** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the calulated average of each measurement for each activity and each subject </p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type: numeric



