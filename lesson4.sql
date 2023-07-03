INSERT INTO emps(name,age,dep_id)
VALUES('山田',22,1);

SELECT * FROM deps;

UPDATE emps SET age = age +1  
WHERE
id = 5;

DELETE FROM sales
WHERE
id = 16;

SELECT * FROM sales
ORDER BY sale DESC

SELECT name, age FROM emps
ORDER BY age DESC

SELECT * FROM emps
WHERE 
age >= 30
AND
dep_id <> 4;

SELECT * FROM emps
WHERE
name NOT LIKE '%中%';

SELECT * FROM sales
WHERE
s_date
BETWEEN 
2017-09-01 AND 2017-09-03;
