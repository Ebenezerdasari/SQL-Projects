-- How many people of each race are represented in this dataset?
SELECT race, COUNT(race) AS race_count
FROM peopledata.info 
GROUP BY race
ORDER BY race_count DESC

-- What is the average age of men?
SELECT ROUND(AVG(age), 2) AS avg_age_men
FROM peopledata.info 
WHERE sex = 'Male'

-- What is the percentage of people who have a Bachelor's degree?
SELECT ROUND(COUNT(education) / (SELECT COUNT(education)
                                 FROM peopledata.info) * 100, 2) AS percentage_bachelor
FROM peopledata.info 
WHERE education = 'Bachelors'

-- What percentage of people with advanced education (Bachelors, Masters, or Doctorate) make more than 50K?
SELECT ROUND(COUNT(education) / (SELECT COUNT(education)
							     FROM peopledata.info
								 WHERE education IN ('Bachelors', 'Masters', 'Doctorate')) * 100, 2) AS advanced_percentage
FROM peopledata.info
WHERE education IN ('Bachelors', 'Masters', 'Doctorate')
AND salary = '>50K'

-- What percentage of people without advanced education make more than 50K?
SELECT ROUND(COUNT(education) / (SELECT COUNT(education)
								 FROM peopledata.info
								 WHERE education NOT IN ('Bachelors', 'Masters', 'Doctorate')) * 100, 2) AS without_advanced_percentage
FROM peopledata.info
WHERE education NOT IN ('Bachelors', 'Masters', 'Doctorate')
AND salary = '>50K'

-- What is the minimum number of hours a person works per week?
SELECT MIN(hours_per_week) AS min_hours
FROM peopledata.info

-- What percentage of the people who work the minimum number of hours per week have a salary of more than 50K?
SELECT COUNT(salary) / (SELECT COUNT(hours_per_week)
                        FROM peopledata.info
                        WHERE hours_per_week = 1) * 100 AS min_num_work_percentage
FROM peopledata.info 
WHERE salary = '>50K' AND hours_per_week = 1

-- Identify the most popular occupation for those who earn >50K in India.
SELECT occupation, COUNT(occupation) AS occupation_count
FROM peopledata.info
WHERE native_country = 'India' AND salary = '>50K'
GROUP BY occupation
ORDER BY occupation_count DESC
LIMIT 1
