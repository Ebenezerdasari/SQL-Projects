-- This is the first query:

SELECT DISTINCT year from population_years;

-- Add your additional queries below:

--What is the largest population size for Gabon in this dataset?

SELECT country, MAX(population) as 'Population (in millions)'
FROM population_years
WHERE country = 'Gabon';

--What were the 10 lowest population countries in 2005?

SELECT country, population
FROM population_years
WHERE year = 2005
ORDER BY population ASC
LIMIT 10;


--What are all the distinct countries with a population of over 100 million in the year 2010?

SELECT DISTINCT country, population
FROM population_years
WHERE population > 100 AND year = 2010
ORDER BY population DESC;


--How many countries in this dataset have the word “Islands” in their name?

SELECT COUNT(DISTINCT country) AS 'No. of Countries'
FROM population_years
WHERE country LIKE '%Islands%';

--What is the difference in population between 2000 and 2010 in Indonesia?

WITH i_00 AS(
  SELECT country, population AS pop
  FROM population_years
  WHERE country = 'Indonesia'
  AND year = 2000
), i_10 AS(
  SELECT country, population AS pop
  FROM population_years
  WHERE country = 'Indonesia'
  AND year = 2010
)

SELECT i_10.country, i_10.pop - i_00.pop AS 'Population'
FROM i_10
JOIN i_00
ON i_10.country = i_00.country;


