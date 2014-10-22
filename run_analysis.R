library("dplyr")
library("magrittr")
library("stringr")

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

tidy_raw_data <- function(raw_data_dir) {
    # 1. Merge the training and the test sets to create one data set

    # Load the data from the train and test partitions into the same data.frame
    data <- NULL
    for (set in c("train", "test")) {
        set_dir <- file.path(raw_data_dir, set)
        subject <- read.table(file.path(set_dir, paste0("subject_", set, ".txt")))
        y <- read.table(file.path(set_dir, paste0("y_", set, ".txt")))
        X <- read.table(file.path(set_dir, paste0("X_", set, ".txt")))
        set_data <- cbind(subject, y, X)
        data <- rbind(data, set_data)
    }

    # Load the feature names and attach the column names to the data.frame
    features <- read.table(file.path(raw_data_dir, "features.txt"),
                           stringsAsFactors = FALSE)[, 2]
    colnames(data) <- c("subject_id", "activity", features)

    # 2. Extract only the measurements on the mean and standard deviation
    #    for each measurement

    selected_features <- features[str_detect(features, "(mean|std)\\(\\)")]
    data <- data[ , c("subject_id", "activity", selected_features)]

    # 3. Use descriptive activity names to name the activities in the data set

    activity_labels <- read.table(file.path(raw_data_dir, "activity_labels.txt"),
                                  stringsAsFactors = FALSE)[, 2]
    data <- mutate(data, activity = activity_labels[activity])

    # 4. Appropriately label the data set with descriptive variable names

    colnames(data) <- colnames(data) %>%
        str_replace("(mean|std)\\(\\)", "\\1") %>%
        str_replace("^t", "time") %>%
        str_replace("^f", "frequency") %>%
        str_replace("Body(Body)?", "_body") %>%
        str_replace("Mag", "_magnitude") %>%
        str_replace("Jerk", "_jerk") %>%
        str_replace("Acc", "_acceleration") %>%
        str_replace("Gravity", "_gravity") %>%
        str_replace("Gyro", "_gyroscope") %>%
        str_replace_all("\\-", "_") %>%
        tolower

    return(data)
}

summarize_tidy_data <- function(tidy_data) {
    # 5. From the data set in step 4, create a second, independent tidy
    #    data set with the average of each variable for each activity
    #    and each subject

    summarized_tidy_data <- tidy_data %>%
        group_by(subject_id, activity) %>%
        summarise_each("mean")

    return(summarized_tidy_data)
}

# Call the functions in order:

raw_data_dir <- "UCI HAR Dataset"
retrieve_raw_data(raw_data_dir)
tidy_data <- tidy_raw_data(raw_data_dir)
summarized_tidy_data <- summarize_tidy_data(tidy_data)
write.table(summarized_tidy_data, "summarized_tidy_data.txt", row.names = FALSE)
