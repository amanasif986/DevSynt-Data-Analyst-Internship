# Titanic EDA — Survival Analysis

Exploratory data analysis on the Titanic dataset, looking at which factors most affected passenger survival — gender, class, age, fare, and family size.

## Files

- `Titanic_EDA.ipynb` — main notebook with all analysis, charts, and explanations
- `Cleaned_Titanic.csv` — cleaned dataset with engineered features (Family Size, Is Alone, Age Group)
- `Titanic_EDA_Report.pdf` — short PDF summary of the analysis

## What's in the notebook

- **Part 1:** Data understanding (shape, columns, missing values, duplicates)
- **Part 2:** Feature engineering (Family Size, Is Alone, Age Group)
- **Part 3:** 10 business questions, each with a chart and explanation
- **Part 4:** Statistical summary (mean, median, mode, std dev)
- **Dashboard:** Combined view of the key charts
- **Business Insights:** Key takeaways from the analysis

## Tools used

Python, Pandas, Matplotlib, Seaborn

## Key findings

- Only 38.4% of passengers survived
- Women survived at 74.2%, men at 18.9%
- First Class passengers survived at 63%, Third Class at 24.2%
- Survivors paid a higher median fare (£26 vs £10.50)
- Small families (2-4 people) had better survival odds than solo travellers

## Dataset

Cleaned version of the classic Titanic passenger dataset (891 passengers, 12 original columns).
