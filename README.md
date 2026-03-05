# sql-chicago-crime-analysis
SQL analysis of Chicago crime and socioeconomic datasets using SQLite and Python

 Chicago Crime Data Analysis (SQL)

This project analyzes public datasets using SQL to extract insights related to crime statistics, socioeconomic indicators, and school safety metrics.

The project was completed as part of the IBM Data Analyst Professional Certificate and demonstrates practical SQL skills including joins, filtering, aggregation, and subqueries.

## Tools Used

- SQL
- SQLite
- Python
- Pandas
- Jupyter Notebook

## Dataset

The analysis uses public datasets including:

- Chicago Crime Data
- Chicago Socioeconomic Indicators
- Chicago Public Schools Data

These datasets were loaded into a SQLite database and queried using SQL.

## Key SQL Skills Demonstrated

- SELECT queries
- Filtering with WHERE
- Aggregations (COUNT, AVG)
- GROUP BY operations
- Subqueries
- Data exploration and analysis

## Example Questions Answered

Some of the analysis questions include:

- Total number of crimes recorded
- Community areas with lowest income
- Crimes involving minors
- School safety scores by school type
- Most crime-prone community areas

## Example Query

```sql
SELECT community_area_name
FROM CENSUS_DATA
WHERE hardship_index = (
    SELECT MAX(hardship_index)
    FROM CENSUS_DATA
);
