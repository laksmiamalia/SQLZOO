'1. List the films where the yr is 1962 [Show id, title]'
SELECT id, title
FROM movie
WHERE yr=1962

'2. Give year of 'Citizen Kane'.'
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

'3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.'
SELECT id, title, yr
FROM movie
WHERE title LIKE '%STAR TREK%'
GROUP BY 3

'4. What id number does the actor 'Glenn Close' have?'
SELECT id
FROM actor
WHERE name = 'Glenn Close'

'5. What is the id of the film 'Casablanca''
SELECT id
FROM movie
WHERE title = 'Casablanca'

'6. Obtain the cast list for 'Casablanca'.'
'We will use movieid=11768, (or whatever value you got from the previous question)'
SELECT name
FROM actor LEFT JOIN casting ON ( id = actorid)
WHERE movieid = 11768

'7. Obtain the cast list for the film 'Alien''
SELECT name
FROM actor JOIN casting ON ( id = actorid )
WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien')

'8. List the films in which 'Harrison Ford' has appeared'
SELECT title
FROM movie JOIN casting ON ( id = movieid)
WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')

'9. List the films where 'Harrison Ford' has appeared - but not in the starring role.'
'[Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]'
SELECT title
FROM movie JOIN casting ON ( id = movieid)
WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')
AND ord <> '1'

'10. List the films together with the leading star for all 1962 films.'
SELECT MO.title, AC.name
FROM movie MO
JOIN casting CA on MO.id = movieid
JOIN actor AC on AC.id = actorid
WHERE MO.yr = 1962 AND CA.ord = '1'

'11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.'
SELECT yr,COUNT(title)
FROM movie MO
JOIN casting CA on MO.id = movieid
JOIN actor AC on AC.id = actorid
WHERE AC.name= 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

'12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.'
SELECT MO.title, AC.name
FROM movie MO
JOIN casting CA on MO.id = movieid
JOIN actor AC on AC.id = actorid
WHERE CA.ord = '1' AND CA.movieid IN (SELECT movieid FROM casting JOIN actor ON ( actorid = id ) WHERE name = 'Julie Andrews')

'13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.''
SELECT name
FROM casting 
JOIN actor on actorid = id
WHERE ord = '1'
GROUP BY 1 
HAVING COUNT(movieid) >= 15

'14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.'


'15. List all the people who have worked with 'Art Garfunkel'.'
