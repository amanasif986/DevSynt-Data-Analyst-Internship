# Chinook Business Analysis

## Headline numbers

| Metric | Value |
|---|---|
| Total Revenue | $2,328.60 |
| Total Orders | 412 |
| Total Customers | 59 |
| Average Order Value | $5.65 |
| Top Country | USA ($523.06) |
| Top Genre | Rock ($826.65) |
| Top Artist | Iron Maiden ($138.60) |
| Data Range | Jan 2021 – Dec 2025 |

## Project structure

```
├── analysis.sql             # 20 SQL queries 
├── analysis.ipynb           # Notebook: connects to the DB and runs 6 charts
├── business_insights.ipynb  # 5 business insights
├── Power_BI_dashboard.pbix  # Power BI dashboard
├── Chinook_Sqlite.sqlite    # Official Chinook sample database
└── README.md                # This file
```

## SQL analysis (`analysis.sql`)

20 queries covering all 20 required areas (revenue, customers, orders,
countries, genres, artists, tracks, time trends, growth, segmentation).
Demonstrates every required concept: `SELECT`, `WHERE`, `GROUP BY`,
`ORDER BY`, `JOIN`, `SUM`, `AVG`, `COUNT`, `CASE`, CTEs, a correlated
subquery, and a window function (`LAG`, used for monthly growth).


## Python analysis (`analysis.ipynb`)

6 visualizations (meets the minimum required), rendered inline:

1. Revenue by Country
2. Top 10 Customers by Spending
3. Revenue by Genre
4. Top Artists
5. Sales Trend by Year
6. Customer Distribution by Country

## Power BI dashboard (`Power_BI_dashboard.pbix`)

A working `.pbix` built on a Fact_Sales model, opens directly in Power
BI Desktop. The single page contains:

- A multi-row KPI card showing Total Revenue, Total Orders, Total
  Customers, and Average Order Value together
- Two clustered bar charts, one line chart, one bar chart, and one donut
  chart covering revenue by country, sales trend, top customers, revenue
  by genre, and top artists / customer distribution
- Three slicers for filtering by Country, Year, and Genre


## Business insights (`business_insights.ipynb`)

5 findings (meets the 5–7 required range), each with a finding, a
supporting number, and a recommended action:

1. USA is the anchor market (highest revenue and customer count)
2. Rock accounts for over a third of all revenue
3. Revenue is essentially flat across five years, with a 2025 dip
4. Purchase frequency is almost perfectly uniform across customers
5. Revenue is broadly distributed, not concentrated in a small VIP group

## Tools

Python 3.11 · pandas · matplotlib · SQLite (Chinook sample DB) ·
Power BI Desktop
