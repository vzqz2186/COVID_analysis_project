/*
COVID-19 data analysis project, version 2

     Author: Daniel Vazquez
       Date: 11/1/2021
Description: Data exploration for COVID-19 data mainly focused on data for the United States,
             North America, and Central America. These queries pull data from a dataset
			 obtained from ourworldindata.org, which keeps track of the data and it is
			 maintained on a daily basis. The copy of the data set contains data for almost
			 two years, starting on January 28, 2020 and ending on September 29, 2921.

     Source: "Coronavirus pandemic (COVID-19)" https://ourworldindata.org/coronavirus

"Story Board"
    1. COVID-19 death climb in USA for 2020 ................................................ (DONE)
    2. Top 5 days with most new cases in USA for 2020 ...................................... (DONE)
	3. Top 5 COVID deadliest days in the USA for 2020 ...................................... (DONE)
    4. Death rates across North America in 2020 ............................................ (DONE)
    5. Most likely country to die if contracting COVID ..................................... (DONE)
    6. Vaccinations vs total cases in the USA for 2021 ..................................... (DONE)
    7. Vaccination numbers in North America (vaccination distribution accross the continent) (DONE)
    8. Top 5 days with most new cases in USA for 2021 ...................................... (DONE)
	9. Top 5 COVID deadliest days in the USA for 2021 ...................................... (DONE)
   10. Deaths vs vaccinations in the USA for 2021 .......................................... 
*/

-- USE covid_project;


-- 1. COVID-19 cases and deaths in USA for 2020
SELECT location, date, total_deaths FROM deathdata
WHERE location = 'United States' AND date < '2021-01-01'
ORDER BY date ASC;


-- 2. Top 5 days with the highest number of new cases in the United States for 2020
SELECT TOP 5 location, date, new_cases from deathdata
WHERE location = 'United States' AND date < '2021-01-01'
ORDER BY new_cases DESC;


-- 3. Top 5 days with highest number of COVID-19 deaths in the United States for 2020
SELECT TOP 5 location, date, new_deaths from deathdata
WHERE location = 'United States' AND date < '2021-01-01'
ORDER BY new_deaths DESC;


-- 4. COVID-19 death counts in North America
SELECT location, MAX(cast(total_deaths AS INT)) AS death_count FROM deathdata
WHERE continent = 'North America' AND date < '2021-01-01'
GROUP BY location
ORDER BY death_count DESC;


-- 5. Comparing total cases and total deaths. How "lethal" is COVID-19 if contracting it in North America?
SELECT location, total_cases, total_deaths, ROUND((total_deaths/total_cases), 2) AS death_case_ratio
FROM deathdata WHERE continent = 'North America' AND date = (SELECT MAX(date) FROM deathdata)
ORDER BY death_case_ratio DESC;


-- 6. Compare cases and vaccinations during 2021 in the United States
SELECT d.location, d. date, d.new_cases, v.new_vaccinations
FROM deathdata AS d JOIN vaccinationdata AS v
ON d.location = v. location and d.date = v.date
WHERE d.location = 'United States' AND d.date >= '01-01-2021';


-- 7. Vaccination breakdown accross North America
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


-- 8. Top 5 days with most new cases in USA for 2021
SELECT TOP 5 location, date, new_cases from deathdata
WHERE location = 'United States' AND date >= '2021-01-01'
ORDER BY new_cases DESC;


-- 9. Top 5 COVID deadliest days in the USA for 2021
SELECT TOP 5 location, date, new_deaths from deathdata
WHERE location = 'United States' AND date >= '2021-01-01'
ORDER BY new_deaths DESC;


-- 10. Deaths vs vaccinations in the USA
-- Has the death climb in the USA slowed down with the introduction of vaccines?
SELECT a.location, a.date, a.total_deaths, a.new_deaths, b.new_vaccinations, b.total_vaccinations
FROM deathdata AS a JOIN vaccinationdata AS b
ON a.location = b.location and a.date = b.date
WHERE a.location = 'United States' AND a.date >= '2021-01-01';