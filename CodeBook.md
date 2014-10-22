Code Book
=========

The data linked in the course website represent information collected
using the accelerometers of a smartphone. A group of volunteers performed 
different activities wearing the device. The raw data collected from
the sensors was pre-processed, in order to provide a 561-feature vector
with time and frequency domain variables.

A full description is available at the site where the data was obtained:

> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

and the following publication:

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
> *Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly
> Support Vector Machine*. International Workshop of Ambient Assisted Living
> (IWAAL 2012). Vitoria-Gasteiz, Spain, 2012.

This code book describes the transformations performed to this data and a
description of the variables in the tidy dataset.

Transformations
---------------

The following transformations were applied to the original data set:

1.  The original data was into 70% training data and 30% test data.
    In the tidy data, the training and test were merged into one data set.

2.  The original data set contains raw data collected from the accelerometer 
    and the gyroscope, together with 561 features calculated from these values.
    In the generate tidy data set, only the features corresponding to the
    mean and standard deviation of the measurements were selected (resulting 
    in 66 features in the tidy data set).

3.  The activities performed by the volunteers are encoded in the original data 
    set using intenger values. In the generated tidy data, these values were 
    mapped to their corresponding descriptive names, e.g. `WALKING`.

4.  The names of variables in the original data set make use of abbreviations.
    In the generated tidy data set, all the abbreviations were expanded the 
    full form. The generated variable names are lower-case complete words,
    separated by `_`.

5.  The generated tidy data summarizes the reported feature values as the 
    average of each subject-activity pair.

For information about the R script implementing these transformations,
please see the file (README.md)[README.md].

Variables
---------
