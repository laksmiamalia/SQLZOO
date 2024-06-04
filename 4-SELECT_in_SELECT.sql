'1. List each country name where the population is larger than that of 'Russia'.'
SELECT name FROM world
WHERE population > (SELECT population FROM world
                    WHERE name='Russia')

'2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.'
SELECT name FROM world
WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

'3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.'
SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))

'4. Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.'
SELECT name, population FROM world
WHERE population < (SELECT population FROM world WHERE name = 'Germany') AND population > (SELECT population FROM world WHERE name = 'United Kingdom')

'5. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)'
SELECT name FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe')

'6. Find the largest country (by area) in each continent, show the continent, the name and the area:'


'7. List each continent and the name of the country that comes first alphabetically.'
SELECT continent, name FROM world
GROUP BY 1
ORDER BY 2 ASC
'GROUP BY 1 mean number 1 in SELECT = continent'
'ORDER BY 2 mean number 2 in SELECT = name'

'8. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.'


'9. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.'
