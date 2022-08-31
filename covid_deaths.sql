--Covid 19 data exploration

--viewing data
SELECT *
FROM covid.covid_deaths


--selecting data we need 

SELECT location, date, total_cases, total_deaths, population
FROM covid.covid_deaths
WHERE continent IS NOT NULL

-- total cases vs total deaths
--shows chances of dying if infected with covid in India

SELECT location, date, total_cases, total_deaths, (total_deaths / total_cases) * 100 AS death_percentage
FROM covid.covid_deaths
WHERE location = 'India' 
AND continent IS NOT NULL
ORDER BY death_percentage DESC

--Total cases vs population
-- Percent population infected with covid

SELECT location, date, population, total_cases, (total_cases/population) * 100 as percent_infected
FROM covid.covid_deaths
Order BY 1, 2

--countries with highest infection rate 

SELECT location, population, MAX(total_cases) AS highest_infection_count, MAX(total_cases / population) * 100 AS percent_infected
FROM covid.covid_deaths
GROUP BY location, population
ORDER BY percent_infected DESC

--countries with highest death count

SELECT location, MAX(total_deaths) as total_death_count
FROM covid.covid_deaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY total_death_count DESC

--Continents with highest death count

SELECT continent, MAX(total_deaths) as total_death_count
FROM covid.covid_deaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count DESC

--Global numbers across the world

SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths) / SUM(new_cases) * 100 AS death_percentage
FROM covid.covid_deaths
WHERE continent IS NOT NULL
