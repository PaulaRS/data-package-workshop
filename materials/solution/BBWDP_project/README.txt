This README file was updated on 2026-11-09 by the data package workshop team

GENERAL INFORMATION
Study/project title: Bern-Basel 2021 wearable device pilot (BBWDP) - workshop subset
Description: Prospective, observational two-center study (Bern and Basel, Switzerland)
  comparing two wearable devices (CORE and Everion) for continuous core temperature
  monitoring in 20 pediatric patients undergoing chemotherapy, who wore both devices
  for 14 days (ClinicalTrials.gov NCT04914702). This package contains device data for
  2 of the 20 patients, clinical data for all patients (raw and cleaned), data
  dictionaries, and two R scripts.
Authors: Data: Farner L, Koenig C, Ammann RA, Brack E.
  Article: Koenig C, Ammann RA, Schneider C, Wyss J, Roessler J, Brack E.
Contact: see the figshare record, https://doi.org/10.6084/m9.figshare.22507342

ORGANIZATION
- Folder structure:
├── 01_bbwdp_data
│   ├── raw               # data as collected and exported - never edit these files
│   └── processed         # clinical data with double entries removed
├── 02_bbwdp_code         # R scripts: export of device data, removal of double entries
├── 03_bbwdp_docs         # documentation: data dictionaries (variables, types, units)
└── README.txt

- File naming conventions: bbwdp_description_vNN (e.g. bbwdp_core-patient01_v01.csv)
  Scripts are named after what they do, without project code or version number
  (e.g. remove-duplicates.R). The project code is in the folder name.
  The data are de-identified (real dates were replaced by study days), so file names
  contain no dates.

- File formats:
  .csv  data and data dictionaries; semicolon (;) separated, Latin-1 encoded
  .R    R scripts (base R)

DATA-SPECIFIC INFORMATION
- Time is given as StudyDay: day 1 is the start of the study for that patient, and the
  fraction of the day is the time of day (1.5 = day 1, 12:00).
- Device data (CORE, Everion): one row per minute. Clinical data: one file with three
  event types (administration and follow up, study day, discrete measurement).
- See the data dictionaries in 03_bbwdp_docs for all variables and units.

PROCESSING
02_bbwdp_code/remove-duplicates.R reads the raw clinical file, removes 4 rows that
are exact duplicates of earlier rows (ear temperature measurements entered twice), and
writes 01_bbwdp_data/processed/bbwdp_clinical-all-patients-cleaned_v01.csv. All other values
are unchanged.
Note: the script still uses the original file names (input_file and output_file at the
top). After renaming, change them to
  ../01_bbwdp_data/raw/bbwdp_clinical-all-patients_v01.csv
  ../01_bbwdp_data/processed/bbwdp_clinical-all-patients-cleaned_v01.csv
and run the script from 02_bbwdp_code.

ORIGINAL FILE NAMES
bbwdp_core-patient01_v01.csv                 CORE_data.patient_01.csv
bbwdp_core-patient02_v01.csv                 CORE_data.patient_02.csv
bbwdp_everion-patient01_v01.csv              Everion_data.patient_01.csv
bbwdp_everion-patient02_v01.csv              Everion_data.patient_02.csv
bbwdp_clinical-all-patients_v01.csv          NonWD_data_both_devices.all_patients.csv
bbwdp_clinical-all-patients-cleaned_v01.csv  NonWD_data_both_devices.all_patients_cleaned.csv (*)
bbwdp_data-dictionary-core_v01.csv           CORE_data_Readme.csv
bbwdp_data-dictionary-everion_v01.csv        Everion_data_Readme.csv
bbwdp_data-dictionary-clinical_v01.csv       Readme_NonWD_data_both_devices.all_patients.csv
export-device-data.R                         Skript_Anleitung.R (script.R in the workshop folder)
remove-duplicates.R                          cleaning_script.R (*)
(*) made for this workshop, not part of the figshare record

SOURCE AND LICENCE
Data and export script are reused under CC BY 4.0 from:
- Data: Farner L, Koenig C, Ammann RA, Brack E (2024). BernBasel2021WDP data. figshare. https://doi.org/10.6084/m9.figshare.22507342 - licence CC BY 4.0
- Article: Koenig C, Ammann RA, Schneider C, Wyss J, Roessler J, Brack E (2024). Continuous timely monitoring of core temperature with two wearable devices in pediatric patients undergoing chemotherapy for cancer - a comparison study. Supportive Care in Cancer 32:188. https://doi.org/10.1007/s00520-024-08366-w
The full dataset (all 20 patients) is available on figshare.
