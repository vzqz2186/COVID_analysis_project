# COVID-19 Data Analysis Project

Simple project to do some exploration and visualization of data related to COVID-19 mainly focused the United States and North America in general.

Data was obtained from ourworldindata.org, which keeps track of the data set and updates it daily, containing information regarding number of cases, deaths, vaccinations, demographics, vaccine boosters, etc. The data used in this project goes from January 28, 2020 to September 29, 2021.

Included in this repository are some SQL queries that I used to answer some questions that I personally had regarding the COVID-19 pandemic, as well as some Tableau visualizations for some of the points that I found interesting.

**1. COVID-19 fatalities across North America in 2020**

![COVID-19_fatalities_NA_2020](https://user-images.githubusercontent.com/82471196/141373846-3c6cb977-5b36-4851-9106-aa31bc08a302.png)

- **Workbook:** Fatalities NA 2020

This map is very self explanatory. It shows the fatality distribution across the continent of North America for the year of 2020. As it was to be expected, The contries with the largest populations have the most reported deaths. No data seems to have been presented for some of the smaller islands in the Caribbean, like Dominica and the Cayman Islands, therefore showing no reported deaths.

**2. Fatality chances if contracting COVID in North America**

![COVID-19 fatality chances NA](https://user-images.githubusercontent.com/82471196/141376258-b66176ac-26f1-47b7-9508-a7d02e160c79.png)

- **Workbook name:** Highest COVID-19 Fatality Chances NA

This table outlines the possibility of dying of COVID-19 if contracting it in various countries. The table only shows the five highest death percentages and uses the latest data available in the used dataset. What makes this table highly interesting is that despite having the highest amount of cases, the United States doesn't have as many deaths as other countries in the region in relation to their population. Mexico turns out to be the worst place to have COVID in North America, since its death percentage is 2.5 times greater that the second place, El Salvador. The rest of the list is composed by Caribbean islands. It is also to be noted that none of the percentages cross 10%, so most of the people that contract COVID-19 recover from it rather than succumb to it.

**3. New cases vs new vaccinations in the USA for 2021**

![USA cases vs vax 2021](https://user-images.githubusercontent.com/82471196/141383956-8767ff66-c693-4427-8b2b-afd3b0a0f147.png)

- **Workbook name:** USA new cases vs new vaccinations 2021

This chart outlines the progression of new cases and vaccinations in the USA from January to September 2021. New cases sharply decline with the increase of vaccinations. The lowest amount of new cases occur during June, where the USA experiences less than one million new COVID-19 cases. This is, however, followed by a steep rise in cases for the rest of the summer annd becomming more steady for August and September. Vaccinations steadily rise until reaching a maximum point in April before sharply decreasing for the rest of the year. The very high increase of cases after the summer despite most people beinng vaccinated at that point may suggest that booster shots may be necessary.

**4. Notable dates regarding COVID-19 in the USA for 2020 and 2021.

![USA most COVID-19 casesand deaths](https://user-images.githubusercontent.com/82471196/141384936-00424ad0-c341-4bd8-a085-ac23ad032f40.png)

**Workbook name:** Most COVID-19 cases and deaths

These are the days with most new cases and deaths for both 2020 and 2021 in the United States. Notice how most of the days with the most new cases for 2021 and all of the days with the most cases for 2020 take place in late December and early January, when there is a lot of people traveling to a lot of diffenect places for the holidays. The day with the most new deaths comes very late in the dataset, August 17, 2021 with one person shy from getting 1,000 deaths. Also, for both 2020 and 2021, 3 of the 5 days with the most new deaths happen during the spring, in April, May, and June, when people either start to get ready to go on vacation or are already on vacation.

Citations:

- Hannah Ritchie, Edouard Mathieu, Lucas Rodés-Guirao, Cameron Appel, Charlie Giattino, Esteban Ortiz-Ospina, Joe Hasell, Bobbie Macdonald, Diana Beltekian and Max Roser (2020) "Coronavirus Pandemic (COVID-19)". Published online at OurWorldInData.org. Retrieved from: 'https://ourworldindata.org/coronavirus' [Online Resource]
