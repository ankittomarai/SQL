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


-- work on multiple tables  to get the data 
SELECT p.first_name, 
e.email_address 
FROM 
person p, 
email_address e

-- inner join 
SELECT 
p.first_name, p.last_name, 
e.email_address 
FROM person p 
INNER JOIN 
email_address e 
ON 
p.person_id = 
e.email_address_person_id

-- INNER JOIN doesn’t deal with NULL values 
-- OUTER JOIN works even when no match 
-- NULL columns if no match in second table 
-- FULL OUTER JOIN returns all joined rows 
-- NULL when no match in either table 

-- LEFT OUTER JOIN
-- Another NULL-related JOIN 
-- All rows from the left side will be returned 
-- NULL for non-matching right side table
SELECT 
p.first_name, p.last_name, 
e.email_address 
FROM person p 
LEFT OUTER JOIN 
email_address e 
ON p.person_id = 
e.email_address_person_id;

-- RIGHT OUTER JOIN
-- Opposite of LEFT OUTER JOIN 
-- All rows from the right side will be returned 
-- NULL for non-matching left side table
SELECT 
p.first_name, p.last_name, 
e.email_address 
FROM person p 
RIGHT OUTER JOIN 
email_address e 
ON 
p.person_id = 
e.email_address_person_id

-- FULL OUTER JOIN 
SELECT 
p.first_name, p.last_name, 
e.email_address 
FROM person p 
FULL OUTER JOIN 
email_address e 
ON p.person_id = 
e.email_address_person_id;

-- INSERT INTO 
INSERT INTO 
person 
(person_id, 
first_name, 
last_name, 
contacted_number,
date_last_contacted,
date_added) 
VALUES 
(1, 
‘Jon’,
‘Flanders',
0,
NULL,
'2016-05-14 11:43:31');

-- INSERT all comlumns and values from a table 

INSERT INTO 
person p 
SELECT 
* FROM old_person op 
WHERE op.person_id > 300;

UPDATE 
email_address e 
SET
e.email_address = 
‘aaron@mail.com’ 
WHERE 
e.email_address_id = 5

DELETE FROM person p;

DELETE FROM person p 
WHERE 
p.id = 5;

DATA DEFINITION LANGUAGE (DDL)

-- Create the databases 
CREATE DATABASE Contact; 

USE DATABASE Contact; 
SELECT * FROM person p;

SELECT * FROM 
Contact.person p;


-- Create a table 
CREATE TABLE 
email_address 
(
email_address_id 
INTEGER,
email_address_person_id 
INTEGER,
email_address 
VARCHAR(55)
)

-- Primary key can be mix of many columns called composite or compound key but it is still a primary key
-- Constraints 
CREATE TABLE phone_number 
(
phone_number_id 
INTEGER NOT NULL,
phone_number_person_id 
INTEGER NOT NULL, 
phone_number 
VARCHAR(55) NOT NULL, 
CONSTRAINT 
PK_phone_number 
PRIMARY KEY 
(phone_number_id)
);

-- ALTER the table
CREATE TABLE phone_number 
(
phone_number_id 
INTEGER NOT NULL,
phone_number_person_id 
INTEGER NOT NULL, 
phone_number 
VARCHAR(55) NOT NULL, 
CONSTRAINT 
PK_phone_number 
PRIMARY KEY 
(phone_number_id)
)

-- DROP the complete table 
DROP TABLE person;

