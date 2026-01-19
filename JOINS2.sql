CREATE TABLE College (
id int ,
subject_id int,
name varchar (30),
)

INSERT into College
 VALUES (1, 101, 'anjuma' ),
		(2, 102, 'iti college' ),
		(3, 103, 'deokar college' ),
		(4, 105, 'raisoni college' );


CREATE TABLE Subject(
subject_id int,
Sub_name varchar (30),
)

INSERT INTO Subject 
	VALUES ( 101, 'Math' ),
		( 102, 'Science' ),
		( 103, 'chamistry' ),
		( 102, 'physics' );


SELECT * FROM College c
INNER JOIN Subject s ON c.subject_id =  s.subject_id

SELECT * FROM College c
LEFT JOIN Subject s ON c.subject_id =  s.subject_id

SELECT * FROM College c
RIGHT JOIN Subject s ON c.subject_id =  s.subject_id

SELECT * FROM College c
LEFT JOIN Subject s ON c.subject_id =  s.subject_id
WHERE s.subject_id IS NULL




SELECT * FROM College
SELECT *,
	(SELECT SUM(subject_id) 
	FROM Subject 
	WHERE subject_id > 101 )
from Subject

SELECT * FROM College

SELECT s.Sub_name, c.subject_id  FROM College c
INNER JOIN Subject s ON c.subject_id = s.subject_id

SELECT *  FROM College c
RIGHT JOIN Subject s ON c.subject_id = s.subject_id

SELECT *  FROM College c
LEFT JOIN Subject s ON c.subject_id = s.subject_id

SELECT *  FROM College c
FULL OUTER JOIN Subject s ON c.subject_id = s.subject_id

SELECT category, SUM(products_price) as avgProduct FROM Products
GROUP BY category 
HAVING SUM(products_price) > 8000
order by SUM(products_price) DESC

SELECT * FROM Products





