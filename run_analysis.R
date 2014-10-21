
# Functions performing each part of the analysis:

retrieve_raw_data <- function(raw_data_dir, force = FALSE) {
    data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    data_destfile <- "UCI HAR Dataset.zip"
    if (force || !file.exists(data_destfile)) {
        download.file(data_url, data_destfile, method = "curl")
        download_date <- Sys.time()
    } else {
        download_date <- file.info(data_destfile)[, "ctime"]
    }
    if (force || !file.exists(raw_data_dir)) {
        unzip(data_destfile, overwrite = TRUE)
        orig_raw_data_dir <-"UCI HAR Dataset"
        if (raw_data_dir != orig_raw_data_dir) {
            file.rename(orig_raw_data_dir, raw_data_dir)
        }
    }
    return(download_date)
}


# Call the functions in order:

raw_data_dir <- "UCI HAR Dataset"

retrieve_raw_data(raw_data_dir)
