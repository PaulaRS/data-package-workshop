# Tidy up a study folder and create a data package

> 💡 This is the plain-text version of the exercise. The [interactive version](index.html) has the same steps,
> plus a file name checker and a tool that checks your finished folder.

⏱ 20 minutes (+5 optional) · 📊 Based on real open data (CC BY 4.0) · ✍️ Author: Paula Ramos-Silva

## Instructions

In the **Bern-Basel 2021 wearable device pilot** (project code `BBWDP`), 20 children receiving chemotherapy
wore two wearable devices, the CORE® and the Everion®, for 14 days. Both devices measured core temperature
every minute, so that fever could be detected early.

You get part of the published data: device data from two patients, the clinical data for all patients (as
exported, and a cleaned version without double entries), three data dictionaries that describe the variables,
and two R scripts: one that exported the device data and one that cleaned the clinical data. All files sit together
in one folder, `BBWDP_data`, with names like `CORE_data.patient_01.csv` and `script.R`.
**Your job is to organise them into a clear structure with a consistent naming convention, so that anyone can
find their way around.**

> The data are real and openly published under CC BY 4.0
> ([Farner et al., 2024, figshare](https://doi.org/10.6084/m9.figshare.22507342);
> [Koenig et al., 2024, *Supportive Care in Cancer*](https://doi.org/10.1007/s00520-024-08366-w)).
> The published files are used unchanged; only a subset is used, and the export script was renamed.
> The cleaned clinical file and its cleaning script were made for this workshop.

**By the end of this exercise you can**

- tell raw data, processed data, documentation and code apart;
- set up a clear folder structure for a data package;
- apply a consistent file naming convention.

---

## Step 1: Download and explore the files

1. Download [BBWDP_data.zip](downloads/BBWDP_data.zip) and unzip it.
2. Open the folder `BBWDP_data` and look at the eleven files without opening the files.
3. Which ones do you think are raw data, processed data, documentation or code? Discuss with your neighbor.
4. Would a new colleague understand these names without help? What would you improve?

## Step 2: Create a folder structure

Download the [template](downloads/template.zip) and rename the folder `PROJECTCODE_project/` to `BBWDP_project/`. In its
subfolders, replace `projectcode` by `bbwdp` and move the files from `BBWDP_data` into the right subfolder.

```
BBWDP_project/
├── 01_bbwdp_data/
│   ├── raw/              data as collected – never edit
│   └── processed/        data made from raw data by a script
├── 02_bbwdp_scripts/     data analysis scripts
└── 03_bbwdp_docs/        documentation: data dictionaries
```

## Step 3: Rename the files

Give at least three files a name that follows this convention:

```
bbwdp_description_vNN.ext
```

| Element | Rule | Example |
|---|---|---|
| Project code | Always `bbwdp`, lowercase | `bbwdp` |
| Description | 1–4 lowercase words separated by `-`, no vague words | `core-patient01` |
| Version | `v` + two digits | `v01` |

Elements are separated by underscores `_`. No spaces, no special characters. Keep the extension as it is.
Since this is the first version of every file, they all get `v01`.

Raw data is your only source of truth: keep it apart and never edit it, so you can always redo the processing.

<details>
<summary>💡 Hint: Why is there no date in the name?</summary>

Many projects start file names with a date (`YYYYMMDD`). These data are **de-identified**: real dates were
replaced by study days. So the convention for this project leaves the date out.
</details>

<details>
<summary>💡 Hint: What happens to the scripts when I rename files?</summary>

Scripts refer to files by name. At the top of `cleaning_script.R`, `input_file` and `output_file` still use the
old names, so they need updating after renaming. **You don't have to do that now:** agree on names early in a project.
</details>

## Step 4: Check your work

Open the [interactive version](index.html), go to step 4 and select your newly organized `BBWDP_project` folder.
Your files stay on your computer.

## Step 5: Compare with the model solution

```
BBWDP_project/
├── README.txt
├── 01_bbwdp_data/
│   ├── processed/
│   │   └── bbwdp_clinical-all-patients-cleaned_v01.csv
│   └── raw/
│       ├── bbwdp_clinical-all-patients_v01.csv
│       ├── bbwdp_core-patient01_v01.csv
│       ├── bbwdp_core-patient02_v01.csv
│       ├── bbwdp_everion-patient01_v01.csv
│       └── bbwdp_everion-patient02_v01.csv
├── 02_bbwdp_scripts/
│   ├── bbwdp_csv-export_v01.R
│   └── bbwdp_remove-duplicates_v01.R
└── 03_bbwdp_docs/
    ├── bbwdp_data-dictionary-clinical_v01.csv
    ├── bbwdp_data-dictionary-core_v01.csv
    └── bbwdp_data-dictionary-everion_v01.csv
```

**Reflect:** Where did your choices differ? Which convention would you agree on with your team *before* a project starts?

## Optional extra: write a README

Copy `README-template.txt` from the [template](downloads/template.zip) to the top of `BBWDP_project`,
rename it to `README.txt` and fill it in:

- **General information:** the study title, a short description, the authors and a contact;
- **Organization:** the folder structure of *your* `BBWDP_project` folder (replace the example), the file naming
  convention you used, and the file formats.

Compare yours with the README in [solution.zip](downloads/solution.zip).

---

**Data:** Farner L, Koenig C, Ammann RA, Brack E (2024). *BernBasel2021WDP data.* figshare.
https://doi.org/10.6084/m9.figshare.22507342 (CC BY 4.0)
**Article:** Koenig C, Ammann RA, Schneider C, Wyss J, Roessler J, Brack E (2024). Continuous timely monitoring
of core temperature with two wearable devices in pediatric patients undergoing chemotherapy for cancer – a
comparison study. *Supportive Care in Cancer* 32:188. https://doi.org/10.1007/s00520-024-08366-w
