# File naming cheat sheet

## The pattern
```
projectcode_description_vNN.ext
```

| Element | Rule | Example |
|---|---|---|
| Project code | Short, lowercase, the same for every file | `bbwdp` |
| Description | 1-4 words, lowercase, separated by hyphens `-` | `core-patient01` |
| Version | `v` + two digits | `v01`, `v02` |
| Separator | Underscore `_` between elements | |

Many projects also start file names with a date (`YYYYMMDD` or `YYYY-MM-DD`), so files sort in time
order. This dataset is de-identified and has no real dates, so we leave the date out.

## Do
- Keep names short but meaningful.
- Use only letters `a-z`, digits `0-9`, hyphens `-` and underscores `_`.
- Use leading zeros (`patient01`, `v01`) so files sort correctly.

## Don't
- No spaces: `data patient 2.csv`
- No special characters: `! ? ( ) & # % ' " , é`
- No vague words: `final`, `new`, `old`, `copy`, `stuff`

## Examples
| Before | After |
|---|---|
| `CORE_data.patient_02.csv` | `bbwdp_core-patient02_v01.csv` |
| `Everion_data_Readme.csv` | `bbwdp_data-dictionary-everion_v01.csv` |
