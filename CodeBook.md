Code Book
=========

The data linked in the course website represent information collected
using the accelerometers of a smartphone. A group of volunteers performed 
different physical activities wearing the device. The raw data collected 
from the sensors was pre-processed and a 561-feature vector with time 
and frequency domain variables is provided. A full description is available
at the site where the data was obtained:

> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

and the following publication:

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
> *Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly
> Support Vector Machine*. International Workshop of Ambient Assisted Living
> (IWAAL 2012). Vitoria-Gasteiz, Spain, 2012.

This code book describes the transformations performed to this data set 
to obtain tidy data that can be used for later analysis.

Transformations
---------------

The following transformations were applied to the original data set:

1.  The original data was divided into 70% training data and 30% test data.
    In the tidy data set, the training and test partitions were merged into 
    one data set.

2.  The original data set contains raw data collected from the accelerometer 
    and the gyroscope, along with the 561 features calculated from these values.
    In the tidy data set, only the features corresponding to the mean and 
    standard deviation of the measurements were selected (resulting 
    in 66 features).

3.  The activities performed by the volunteers are encoded in the original data 
    set using integer values. In the tidy data set, these values were mapped to
    their corresponding descriptive names, e.g. `WALKING`.

4.  The names of the variables in the original data set make use of abbreviations.
    In the tidy data set, all the abbreviations were expanded to their full form.
    The generated variable names are lower-case words, separated by `_`.
    The only exception is `std` that stands for "standard deviation",
    a widely accepted mathematical notation.

5.  The values of the selected features (mean and standard deviation values)
    are summarized by calculating the average for every subject-activity pair.

For information about the R script that implements these transformations,
please see the file [README.md](README.md).

Variables
---------

The tidy data set contains a total of 68 variables, which can be separated
in the following three groups.

*   `subject_id` - The first variable identifies the volunteer from whom 
    the data was collected. Each subject is assigned an integer value 
    from 1 to 30.

*   `activity` - The second variable is a categorical variables that identifies
    the activity that the volunteer performed. It takes the following values:
    `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`,
    `WALKING_UPSTAIRS`.

*   The remainder variables are 66 continuous variables, corresponding to the
    average of the selected features (mean and standard deviation of the
    measurements). The variables starting with `time_` and `frequency_`
    correspond to time and frequency domain signals, respectively.
    All the values are normalized and bounded within [-1,1].

The tidy data set contains 180 observations, one for every possible combination
of the 30 subjects performing the 6 different activities.
