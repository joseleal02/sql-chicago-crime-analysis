--  Find the total number of crimes recorded in the CRIME table
SELECT count(*) AS 'Total Number of Crimes' FROM chicago_crime_data;

-- List community area names and numbers with per capita income less than 11000
SELECT community_area_name, community_area_number, per_capita_income
FROM chicago_census_data
WHERE per_capita_income < 11000
ORDER BY per_capita_income DESC;

-- List all case numbers for crimes involving minors (children are not considered minors for the purposes of crime analysis)
SELECT case_number, description
FROM chicago_crime_data
WHERE description LIKE '%minor%';

-- List all kidnapping crimes involving a child
SELECT case_number, primary_type, description
FROM chicago_crime_data
WHERE description LIKE '%child%' AND primary_type LIKE '%kidnap%';

-- List the kind of crimes that were recorded at schools. (No repetitions)
SELECT DISTINCT primary_type AS 'Kinds of Crimes'
FROM chicago_crime_data
WHERE location_description LIKE '%school%';

-- List the type of schools along with the average safety score for each type
SELECT [Elementary, Middle, or High School] AS 'Type of School', round(avg(safety_score),1) AS 'Average Safety Score'
FROM chicago_public_schools_data
GROUP BY [Elementary, Middle, or High School]
ORDER BY avg(safety_score) DESC;

-- List 5 community areas with highest % of households below poverty line
SELECT community_area_name, PERCENT_HOUSEHOLDS_BELOW_POVERTY
FROM chicago_census_data
ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC
LIMIT 5;

-- Which community area is most crime prone? Display the coumminty area number only
SELECT community_area_number
FROM chicago_crime_data
GROUP BY community_area_number
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Use a sub-query to find the name of the community area with highest hardship index
SELECT community_area_name
FROM chicago_census_data 
WHERE hardship_index = (SELECT MAX(hardship_index) FROM chicago_census_data);

-- Use a sub-query to determine the Community Area Name with most number of crimes
SELECT cen.community_area_name, cen.community_area_number
FROM chicago_census_data AS cen
WHERE cen.community_area_number = (
    SELECT cr.community_area_number
    FROM chicago_crime_data AS cr
    GROUP BY cr.community_area_number
    ORDER BY COUNT(*) DESC
    LIMIT 1
    )
;