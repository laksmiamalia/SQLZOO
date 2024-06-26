'1. List the teachers who have NULL for their department.'
SELECT T.name
FROM teacher T LEFT JOIN dept D ON ( T.dept = D.id )
WHERE T.dept IS NULL

'2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.'
SELECT T.name, D.name
FROM teacher T INNER JOIN dept D ON ( T.dept=D.id )

'3. Use a different JOIN so that all teachers are listed.'
SELECT T.name, D.name
FROM teacher T LEFT JOIN dept D ON ( T.dept=D.id )

'4. Use a different JOIN so that all departments are listed.'
SELECT T.name, D.name
FROM teacher T RIGHT JOIN dept D ON ( T.dept=D.id )

'5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266''
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile
FROM teacher

'6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.'
SELECT T.name, COALESCE(D.name, 'None') AS dept
FROM teacher T LEFT JOIN dept D ON ( T.dept=D.id )

'7. Use COUNT to show the number of teachers and the number of mobile phones.'
SELECT COUNT(name) AS name, COUNT(mobile) AS mobile
FROM teacher

'8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.'
SELECT D.name, COUNT(T.name)
FROM teacher T RIGHT JOIN dept D ON ( T.dept=D.id )
GROUP BY 1

'9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.'
SELECT name,
CASE WHEN dept IN (1,2) THEN 'Sci'
ELSE 'Art'
END AS department
FROM teacher

'10. 
