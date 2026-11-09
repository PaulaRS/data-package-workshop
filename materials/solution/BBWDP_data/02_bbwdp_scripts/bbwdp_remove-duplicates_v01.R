# BBWDP - Bern-Basel 2021 wearable device pilot
#
# Script   cleaning_script.R
# Purpose  Remove double entries (exact duplicate rows) from the clinical data
# Input    NonWD_data_both_devices.all_patients.csv          (as published on figshare)
# Output   NonWD_data_both_devices.all_patients_cleaned.csv
# Needs    base R only (tested with R 4.3)
#
# The output has the same format as the input: semicolon-separated,
# Latin-1 encoded, Windows line endings. Only the duplicate rows are removed;
# all other values are written back exactly as they were read.


# 1. File names --------------------------------------------------------------
# Change these if you rename or move the files.

input_file  <- "NonWD_data_both_devices.all_patients.csv"
output_file <- "NonWD_data_both_devices.all_patients_cleaned.csv"


# 2. Read the data -----------------------------------------------------------
# Every column is read as text, and empty cells stay empty (not NA),
# so nothing changes when the file is written back.

clinical <- read.table(input_file,
                       sep = ";", header = TRUE, quote = "",
                       colClasses = "character", na.strings = character(0),
                       check.names = FALSE, comment.char = "",
                       fileEncoding = "latin1")

cat("Rows read:", nrow(clinical), "\n")


# 3. Find double entries -----------------------------------------------------
# A row counts as a double entry when every value is identical to an
# earlier row. The first occurrence is kept.

is_duplicate <- duplicated(clinical)

cat("Double entries found:", sum(is_duplicate), "\n")
if (any(is_duplicate)) {
  print(clinical[is_duplicate,
                 c("patient_num", "event_name", "c_tim_mea_studyday", "c_tem_mea")])
}


# 4. Remove them and save ----------------------------------------------------

clinical_cleaned <- clinical[!is_duplicate, ]

write.table(clinical_cleaned, output_file,
            sep = ";", quote = FALSE, row.names = FALSE,
            eol = "\r\n", fileEncoding = "latin1")

cat("Rows written:", nrow(clinical_cleaned), "to", output_file, "\n")
