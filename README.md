# Tidy up a study folder and create a data package

A 20-minute interactive, hands-on exercise for research data management training, built on
**real open data** from a pediatric oncology study. Learners get a folder of published data files and organise
it with a clear folder structure and a consistent file naming convention. An optional 5-minute extra adds a
README. A built-in checker gives instant feedback.

**▶ Start the exercise:** open [`index.html`](index.html), or go to the GitHub Pages site once it's enabled (see below).
**📄 Prefer to read it here on GitHub?** See [`exercise.md`](exercise.md).

## Downloads

| Download | Contents |
|---|---|
| [`BBWDP_data.zip`](downloads/BBWDP_data.zip) | The files learners work on, named as on figshare (1.6 MB) |
| [`template.zip`](downloads/template.zip) | Empty folder structure, file naming cheat sheet, README template |
| [`solution.zip`](downloads/solution.zip) | The tidied model solution, with a completed README |

You can also browse the same folders in [`materials/`](materials/).

## The data

The exercise uses a subset of the openly published data of the Bern-Basel 2021 wearable device pilot
(NCT04914702): device data for patients 01 and 02, the clinical data for all 20 patients, the three
data dictionaries (readme files) and the R export script.

- **Data:** Farner L, Koenig C, Ammann RA, Brack E (2024). *BernBasel2021WDP data.* figshare.
  https://doi.org/10.6084/m9.figshare.22507342. Licence: CC BY 4.0.
- **Article:** Koenig C, Ammann RA, Schneider C, Wyss J, Roessler J, Brack E (2024). Continuous timely
  monitoring of core temperature with two wearable devices in pediatric patients undergoing chemotherapy
  for cancer – a comparison study. *Supportive Care in Cancer* 32:188. https://doi.org/10.1007/s00520-024-08366-w

The starter folder contains these nine files exactly as published, with their figshare names, except that
the R script `Skript_Anleitung.R` is called `script.R`. Two files were added for the workshop:

- `cleaning_script.R`: a base-R script that removes the 4 double entries (exact duplicate rows) from the
  clinical file;
- `NonWD_data_both_devices.all_patients_cleaned.csv`: the output of that script. It is byte-for-byte the
  original file without the duplicate rows (same separator, encoding and line endings).

This gives learners a raw and a processed version of the same data. Only a
subset of the 41 published files is used.

## What's interactive

- **Step-by-step instructions** with expandable hints and answers.
- **File name checker:** type a name and get immediate feedback on each element of the convention.
- **Folder checker:** learners select their tidied folder and get feedback on structure, names,
  and whether each file is in the right place. It recognises files by their
  content, so it works after renaming. Everything runs in the browser; nothing is uploaded.
- **Progress tracker** that remembers which steps are done (per browser).

The folder checker needs a desktop browser (Chrome, Edge, Firefox or Safari). It doesn't work on phones.

## Repository structure

```
.
├── index.html               ← the interactive exercise
├── exercise.md              ← the same exercise as plain Markdown
├── README.md                ← this file
├── assets/
│   ├── lumc-logo.png        ← logo shown next to the title
│   └── solution-data.js     ← generated: used by the folder checker
├── downloads/               ← generated: the zip files learners download
│   ├── BBWDP_data.zip
│   ├── solution.zip
│   └── template.zip
├── materials/               ← the source folders the zips are made from
│   ├── starter/         ← becomes downloads/BBWDP_data.zip
│   ├── solution/
│   └── template/
└── scripts/
    └── make_zips.py         ← rebuilds downloads/ and assets/solution-data.js
```

## Publish it as a website (GitHub Pages)

1. Create a new repository on GitHub and upload all files and folders from this package.
   On the repository page, choose **Add file → Upload files** and drag in the *contents* of the folder.
   Make sure the hidden files `.nojekyll` and `.gitattributes` are uploaded as well.
2. Go to **Settings → Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**, select `main` and `/ (root)`, and click **Save**.
4. After a minute or two, the exercise is live at `https://<your-username>.github.io/<repository-name>/`.

## Changing the exercise

1. Edit the files in `materials/`. For example, add a file to `starter/` and its tidy
   counterpart to `solution/`.
2. Rebuild the zips and the checker data from the repository root:
   ```
   python scripts/make_zips.py
   ```
3. Commit everything, including the updated `downloads/` and `assets/solution-data.js`.

The checker compares learners' folders with `materials/solution/` automatically: the expected
folders, file locations and versions are all read from there. If you change the scenario,
also update the text in `index.html` and `exercise.md`.

**Important:** a file in `starter/` and its counterpart in `solution/` must have exactly the same
content, byte for byte. The checker recognises a file by its content, not its name. The
`.gitattributes` file stops Git from changing line endings in `materials/` for this reason.

## Notes for trainers

- **Time:** 20 minutes, plus 5 for the optional README and a few minutes of group discussion.
- **At least three files:** learners only have to rename and move three files in step 3. The checker
  accepts that, and lists the remaining files as an optional next step for fast learners.
- **Warn learners** not to open and save the CSV files in Excel: that changes the content, and the
  checker will no longer recognise the file.
- **Renaming breaks scripts:** `cleaning_script.R` still refers to the original file names. That's
  deliberate: it shows why naming conventions should be agreed at the start of a project. The solution
  README explains which two lines to update.
- **Discussion points:** there's no single correct structure. Should the data dictionaries sit next to the data
  instead of in `03_bbwdp_docs`? Are the original names "bad"? They're already better than many real
  project folders, so what does a convention add? Why might the published files be called `Readme` when
  they're data dictionaries?
- **Why no date in file names?** The data are de-identified (real dates replaced by study days). That's a
  nice way into a conversation about de-identification and what file names can reveal. Note that the data
  are not fully anonymous: with 20 children, most are unique on age, sex and diagnosis.

## Licence

The data and R script are reused under CC BY 4.0 (see "The data" above). Add a licence of your choice
for the exercise materials themselves, for example CC BY 4.0.
