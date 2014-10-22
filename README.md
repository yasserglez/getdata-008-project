Getting and Cleaning Data
=========================

Work for the course [Getting and Cleaning Data](https://www.coursera.org/course/getdata), 
part of the [Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1).

Usage
-----

The script `run_analysis.R` prepares the tidy data for later analysis. 
In order to run it you must have installed recent versions of the packages
[magrittr](http://cran.r-project.org/package=magrittr) (at least 1.0.1), 
[dplyr](http://cran.r-project.org/package=dplyr) (at least 0.3.0.2), and 
[stringr](http://cran.r-project.org/package=stringr) (at least 0.6.2).
The script is divided into three functions that together carry out the steps 
of the analysis:

* `retrieve_raw_data` - This function downloads and extracts the zip file 
containing the raw data. The parameter `raw_data_dir` defines the directory
where the data will be extracted. Unless `force` is set to `TRUE`, the 
data will not be downloaded/unzipped again if it already exists on disk.
The function returns the time and date when the raw data was downloaded.

* `tidy_raw_data` - This function's input is the directory containing the
raw data and it returns the tidy data set obtained after performing steps
1, 2, 3, and 4 of the analysis.

* `summarize_tidy_data` - This function performs the step 5 of the analysis.
Its input is the `data.frame` returned by `tidy_raw_data`, and it creates
the second tidy data set with the average of each variable for each activity
and each subject. This data set can be written to disk using `write.table`.

The three functions are called together at the end of `run_analysis.R`
as follows:

```R
raw_data_dir <- "UCI HAR Dataset"
retrieve_raw_data(raw_data_dir)
tidy_data <- tidy_raw_data(raw_data_dir)
summarized_tidy_data <- summarize_tidy_data(tidy_data)
write.table(summarized_tidy_data, "summarized_tidy_data.txt", row.names = FALSE)
```

For information about the generated tidy data set, please see the file 
[CodeBook.md](CodeBook.md).


Author
------

Yasser Gonzalez Fernandez
* Email - contact@yglezfdez.com
* Homepage - http://yglezfdez.com
