/*1 Show the population of Germany*/
SELECT population From world
WHERE name='Germany';

/*Show the name and the population for 'Sweden', 'Norway', 'Denmark'.*/
SELECT name, population FROM world
WHERE name IN ('Sweden','Norway','Denmark');

/*show the country and the area for countries with an area between 200,000 and 250,000. */
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 300000;

/*Give the name and the per capita GDP for those countries with a population of at least 200 million. */
SELECT name,gdp/1000000000000 FROM world
WHERE population>200000000
ORDER BY name DESC;

/*Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.*/
SELECT name, population/1000000 FROM world
WHERE continent = 'South America';

/*Show the name and population for France, Germany, Italy*/
SELECT name, population FROM world
WHERE name in ('France', 'Germany','Italy');

/*Show the countries which have a name that includes the word 'United'*/
SELECT name FROM world
WHERE name='United';

/*Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.*/
SELECT name, area, population FROM world
WHERE area>3000000 OR population>25000000;

/*Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.*/
SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population < 250000000)
  OR (area < 3000000 and population > 250000000);
  
  /*For South America show population in millions and GDP in billions both to 2 decimal places*/
  SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
  FROM world
  WHERE continent='South America';
  
  /*Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.*/
  SELECT name, ROUND(gdp/population, -3)
  FROM world
  WHERE gdp>1000000000000;
  
  /*Find the country that start with Y*/
  SELECT name FROM world
  WHERE name LIKE 'Y%';
  
  /*Find the countries that end with y*/
  SELECT name FROM world
  WHERE name LIKE '%y';
  
  /*Find the countries that contain the letter x*/
  SELECT name FROM world
  WHERE name LIKE '%x%';
  
  /*Find the countries that end with land*/
  SELECT name FROM world
  WHERE name LIKE '%land';
  
  /*Find the countries that start with C and end with ia*/
  SELECT name FROM world
  WHERE name LIKE 'C%ia';
  
  /*Find the country that has oo in the name*/
  SELECT name FROM world
  WHERE name LIKE '%oo%';
  
  /*Find the countries that have three or more a in the name*/
  SELECT name FROM world
  WhERE name LIKE 'a%a%a';
  
  /*Find the countries that have "t" as the second character.*/
  SELECT name FROM world
  WHERE name LIKE '_t%'
  ORDER BY name;
  
  /*Find the countries that have two "o" characters separated by two others.*/
  SELECT name FROM world
 WHERE name LIKE 'o_o%';
 
 /*Find the countries that have exactly four characters.*/
 SELECT name FROM world
 WHERE name LIKE '____';
  
  /*Find the country where the name is the capital city.*/
  SELECT name FROM world
  WHERE name=capital;
  
  /* Find the country where the capital is the country plus "City".*/
  SELECT name FROM world
  WHERE capital = concat(name, 'CITY');
  
  /* Find the capital and the name where the capital includes the name of the country.*/
  SELECT capital, name FROM world
  WHERE capital Like concat('%', name, '%');
  
  /*Find the capital and the name where the capital is an extension of name of the country.*/
  SELECT name, capital FROM world
  WHERE capital LIKE concat('%', name, '%') AND capital > name;
  
  /*Show the name and the extension where the capital is an extension of name of the country.*/
  SELECT name, REPLACE(capital, name, '') FROM world 
  WHERE capital LIKE concat('%', name, '%') AND capital > name;
  
  /*Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.*/
  SELECT name FROM world
  WHERE population = 200000000;
  
  /*Give the name and the per capita GDP for those countries with a population of at least 200 million.per capita GDP is the GDP divided by the population GDP/population*/
  SELECT name, gdp/population
  FROM world
  WHERE population>200000000;
  
  /*Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions. */
  SELECT name, population/1000000 
  FROM world
  WHERE continent = 'South America';
  
  /*Show the name and population for France, Germany, Italy*/
  SELECT name, population FROM world
  WHERE name IN ('France', 'Germany', 'Italy');
  
  /* Show the countries which have a name that includes the word 'United'*/
  SELECT name FROM world
  WHERE name LIKE '%United%';
  
  /*Show the countries that are big by area or big by population. Show name, population and area.*/
  SELECT name, area, population FROM world
  WHERE area>=3000000 OR population >=250000000;
  
  /*Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.*/
  SELECT name, area, population FROM world
  WHERE (area>=3000000 AND population <=250000000) OR (area<=3000000 AND population >=250000000);
  
  /*Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.*/
SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
FROM world
WHERE continent='South America';

/*Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

Show per-capita GDP for the trillion dollar countries to the nearest $1000.*/
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;

/*Greece has capital Athens.

Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

You can use the LENGTH function to find the number of characters in a string*/
SELECT name, capital FROM world
WHERE LEN(name)=LEN(capital);

/*The capital of Sweden is Stockholm. Both words start with the letter 'S'.
Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator.*/

SELECT name, capital
FROM world
WHERE (left(name,1)=left(capital,1)) AND (name<>capital);

/*Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.
Find the country that has all the vowels and no spaces in its name.
You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'*/

SELECT name
FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  And name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %';
  