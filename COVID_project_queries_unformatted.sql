-- CREATE DATABASE covid;
-- USE covid_project;

-- Show all entries for the United States in the 'deaths' table
-- Test to see if death table showed up correctly
SELECT * FROM deathdata WHERE location = 'United States' ORDER BY 3,4;


-- Show all entries for Mexico in the 'vaccinations' table
-- Test to see if vaccination table showed up correctly
SELECT * FROM vaccinationdata WHERE location = 'Mexico';


-- Listing cases and deaths in the country of Mexico
SELECT location, date, total_cases, total_deaths, ROUND(((total_deaths/total_cases)*100),2) AS death_percentage FROM deathdata
WHERE location = 'Mexico' ORDER BY 1,2;


-- Top 10 days with highest number of new COVID-19 cases in Mexico
SELECT TOP 10 location, date, new_cases from deathdata
WHERE location = 'Mexico'
ORDER BY new_cases DESC;


-- Top 10 days with highest number of COVID-19 deaths in the United States
SELECT TOP 10 location, date, new_deaths from deathdata
WHERE location = 'United States'
ORDER BY new_deaths DESC;


-- Comparing total cases, total deaths, and population in North America
-- What percentage has contracted COVID and what percentace has died from it as of the latest dates?
SELECT location, population, total_cases, ROUND(((total_cases/population)*100),2) AS case_percentage, total_deaths,
       ROUND(((total_deaths/population)*100),2) AS death_percentage
FROM deathdata WHERE continent = 'North America' AND date = (SELECT MAX(date) FROM deathdata)
ORDER BY 4 DESC;


-- Comparing total cases and total deaths
-- How "lethal" is COVID-19 if contracting it in North America?
SELECT location, total_cases, total_deaths, ROUND((total_deaths/total_cases), 2) AS death_case_ratio
FROM deathdata WHERE continent = 'North America' AND date = (SELECT MAX(date) FROM deathdata)
ORDER BY death_case_ratio DESC;


-- COVID-19 death counts in North America
SELECT location, MAX(cast(total_deaths AS INT)) AS death_count FROM deathdata
WHERE continent = 'North America'
GROUP BY location
ORDER BY death_count DESC;


-- Compare cases and vaccinations during 2021 in the United States
SELECT d.location, d. date, d.new_cases, v.new_vaccinations
FROM deathdata AS d JOIN vaccinationdata AS v
ON d.location = v. location and d.date = v.date
WHERE d.location = 'United States' AND d.date >= '01-01-2021';


-- Comparing partially vaccinated and fully vaccinated in North America
SELECT location, MAX(CAST(people_vaccinated AS INT)) AS vaccinated,
       MAX(CAST(people_fully_vaccinated AS INT)) AS fully_vaccinated
FROM vaccinationdata WHERE continent = 'North America'
GROUP BY location
ORDER BY vaccinated DESC;


-- Vaccination breakdown accross North America
-- Vaccination vs population, percentage of partial and full vaccinations
DROP TABLE IF EXISTS #vacpercent -- Create temp table (delete temp if it already exists)
-- Create temp table 
CREATE TABLE #vacpercent
    (location NVARCHAR(255),
     population FLOAT,
	 vaccinated FLOAT,
	 fully_vaccinated FLOAT)
-- Populate temp table
INSERT INTO #vacpercent
SELECT a.location, a.population, MAX(CAST(b.people_vaccinated AS FLOAT)) AS vaccinated,
       MAX(CAST(b.people_fully_vaccinated AS FLOAT)) AS fully_vaccinated
FROM deathdata AS a JOIN vaccinationdata AS b
ON a.location = b.location
WHERE a.continent = 'North America'
GROUP BY a.location, a.population;
-- Percentage calculations
SELECT *, ROUND(((vaccinated/population)*100),2) AS vaccination_percentage,
       ROUND(((fully_vaccinated/population)*100),2) AS full_vaccination_percentage
FROM #vacpercent
ORDER BY location;
