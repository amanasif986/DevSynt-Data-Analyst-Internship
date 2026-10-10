# Customer Churn and Retention Analysis

Analysis of customer churn for a telecom company, built as part of a data analysis internship. The goal was to find out why customers leave, identify which customers are most at risk, and turn that into practical retention recommendations backed by real numbers.

## Dataset

Telco Customer Churn dataset (IBM sample, originally from Kaggle). 7,043 customers, 21 features covering demographics, account details, services used, and whether the customer churned.

## What's in this repo

- **Telco_Customer_Churn_Analysis.ipynb** – the main analysis. Covers data cleaning, churn analysis across six different angles, two statistical tests, customer segmentation, and revenue at risk, all with charts and plain language explanations.
- **Telco_Customer_Churn_Analysis_Summary.pdf** – a one page summary of the key findings and recommendations.
- **Telco-Customer-Churn-Cleaned.pbix** – a Power BI dashboard with KPI cards, five charts, and three slicers, built from the cleaned dataset.
- **Telco_Cleaned_for_PowerBI.csv** – the cleaned dataset used to build the dashboard.

## Key findings

- Overall churn rate is 26.5 percent, about 1 in 4 customers.
- Month to month contracts churn far more than one year or two year contracts. Confirmed with a chi square test.
- Customers in their first 12 months churn the most. Risk drops the longer someone stays.
- Customers who churned paid more per month on average than customers who stayed. Confirmed with a t test.
- Customers paying by electronic check churn much more than those on automatic payments.
- Total revenue already lost to churn is about $139,131 per month.

## Tools used

Python (pandas, matplotlib, scipy) for the analysis, Power BI for the dashboard.

## Notes

No machine learning prediction model was built for this task, per the assignment requirements. The focus was on descriptive analysis, statistical testing, and business recommendations.
