--How many entries in the countries table are from Africa?
SELECT COUNT(*) AS 'No. of Countries'
FROM countries
WHERE continent = 'Africa';

--What was the total population of the continent of Oceania in 2005?
SELECT c.continent, SUM(p.population) AS 'Total Population'
FROM population_years AS p
JOIN countries AS c
ON p.country_id = c.id
WHERE c.continent = 'Oceania'
AND p.year = 2005;

--What is the average population of countries in South America in 2003?
SELECT c.continent, ROUND(AVG(p.population),2) AS 'Average Population' 
FROM population_years AS p
JOIN countries AS c
ON p.country_id = c.id
WHERE c.continent = 'South America'
AND p.year = 2003;

--What country had the smallest population in 2007?
SELECT c.name AS 'Country', MIN(p.population) AS 'Smallest Population (in Millions)'
FROM population_years AS p
JOIN countries AS c
ON p.country_id = c.id
WHERE p.year = 2007;

--What is the average population of Poland during the time period covered by this dataset?
SELECT c.name AS 'Country', AVG(p.population) AS 'Average Population'
FROM population_years AS p
JOIN countries AS c
ON p.country_id = c.id
WHERE c.name = 'Poland';

--How many countries have the word “The” in their name?
SELECT COUNT(*) AS 'No. of Countries'
FROM countries
WHERE name LIKE '%The%';

--What was the total population of each continent in 2010?
SELECT c.continent, SUM(population) AS 'Total Population (in Millions)'
FROM population_years AS p
JOIN countries AS c
ON p.country_id = c.id
WHERE p.year = 2010
GROUP BY c.continent
ORDER BY 2 DESC;