# Titanic Dataset – Data Cleaning & Preparation

## Overview
This project cleans and prepares the Titanic dataset for analysis using Python and Pandas.

## What This Project Does
- Loads and inspects the raw Titanic dataset
- Identifies data quality issues (missing values, data types)
- Handles missing values in Age, Cabin, and Embarked
- Converts columns to appropriate data types
- Renames columns for readability
- Maps coded values (e.g. 0/1, M/F) to make it more readable
- Exports a cleaned dataset ready for analysis

## Files
- `Titanic_project.ipynb` – Jupyter notebook with all cleaning steps
- `Raw-titanicDataset.csv` – original raw dataset
- `Cleaned_titanic_dataset.csv` – cleaned output dataset

## Tools Used
- Python
- Pandas
- Jupyter Notebook

## Key Cleaning Steps
- Missing `Age` values filled with median
- Missing `Embarked` values filled with mode
- Missing `Cabin` values filled with `'Unknown'`
- Categorical columns converted to `category` dtype
- Columns renamed for clarity (e.g. `SibSp` → `Siblings_Spouses_Aboard`)
- Coded values mapped to readable text (e.g. `1` → `'First Class'`, `0`/`1` → `'No'`/`'Yes'`)
