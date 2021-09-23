SELECT p.first_name p.last_name FROM person p WHERE p.DOB > '12/Dec/1991' and p.first_name LIKE '%A';

-- BETWEEN , LIKE, IS , IS  NOT, IN

-- Between syntax
SELECT p.first_name, 
p.last_name 
FROM person p
WHERE p.contacted 
BETWEEN 1 AND 20

-- LIKE can be used with strings which you want to match in your dataset
SELECT p.first_name, 
p.last_name 
FROM person p
WHERE p.first_name 
LIKE ‘J%’

-- IN it is useful to check out if you have something matching in the list
SELECT p.first_name, 
p.last_name 
FROM person p
WHERE p.first_name
IN (‘Jon’,’Fritz’)

--- what if you have a NULL value to match, you can use IS
SELECT p.first_name, 
p.last_name 
FROM person p
WHERE p.last_name
IS NULL

-- IS NOT oppsite to IS
SELECT p.first_name, 
p.last_name 
FROM person p
WHERE p.last_name
IS NOT NULL

-- If you want to use ORDER BY we shall also add ASC or DESC (ASC by default)
SELECT p.last_name, 
p.first_name 
FROM person p
ORDER BY p.last name

-- Use set function like SUM, AVG, MAX, MIN , COUNT on the columns to get the aggregated values properly
SELECT 
SUM( p.contacted_number) 
FROM person p

--count
SELECT 
COUNT(DISTINCT p.first_name) 
FROM person p

-- GroupBy
SELECT 
COUNT(p.first_name),
p.first_name 
FROM person p
GROUP BY p.first_name

-- HAVING restrict the results so you could use proper data
SELECT 
COUNT(DISTINCT p.first_name), 
p.first_name 
FROM person p
GROUP BY p.first_name
HAVING CLAUSE HAVING COUNT(DISTINCT 
p.first_name) >= 5

