Getting and Cleaning Data
=========================

Work for the course [Getting and Cleaning Data](https://www.coursera.org/course/getdata), 
part of the [Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1).

Usage
-----

The script `run_analysis.R` prepares the tidy data for later analysis. 
In order to run it you must have installed recent versions of the 
[magrittr](http://cran.r-project.org/package=magrittr) (at least 1.0.1), 
[dplyr](http://cran.r-project.org/package=dplyr) (at least 0.3.0.2), and 
[stringr](http://cran.r-project.org/package=stringr) (at least 0.6.2) packages. 
The script is divided into three functions that together carry out the steps 
of the analysis:

* `retrieve_raw_data`:

* `tidy_raw_data`:

* `summarize_tidy_data`:

The three functions are called together as follows:


```R
raw_data_dir <- "UCI HAR Dataset"
retrieve_raw_data(raw_data_dir)
tidy_data <- tidy_raw_data(raw_data_dir)
summarized_tidy_data <- summarize_tidy_data(tidy_data)
write.table(summarized_tidy_data, "summarized_tidy_data.txt", row.names = FALSE)
```

For information about the data, please see [the code book](CodeBook.md).


Author
------

Yasser Gonzalez Fernandez
* Email: contact@yglezfdez.com
* Homepage: http://yglezfdez.com
