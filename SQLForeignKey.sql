CREATE TABLE primaryKey(
id int primary key,
name varchar(50),
age int,
)

INSERT into primaryKey 
VALUES (5, 'sanam', 28 ),
(2, 'khan', 18 ),
(3, 'juber', 23 )



CREATE TABLE foreignKey(
CO_id int PRIMARY KEY ,
name VARCHAR(30),
age int,
CONSTRAINT FK FOREIGN KEY (CO_id)
references primaryKey (id)
)

INSERT into foreignKey 
VALUES (4, 'javed', 30 ),
(2, 'khan', 18 ),
(3, 'juber', 23 )


SELECT * FROM primaryKey
SELECT * FROM foreignKey

SELECT primaryKey.name, primaryKey.age, foreignKey.name
FROM primaryKey 
INNER JOIN foreignKey ON primaryKey.id = foreignKey.CO_id

SELECT p.name, p.age, f.name
FROM primaryKey p
full outer JOIN foreignKey f ON p.id = f.CO_id

ALTER TABLE primaryKey 
ADD department varchar(30)

update primaryKey SET department ='telecom' where  id= 5 

SELECT p.name, p.age, p.department, f.age, f.name
from primaryKey p
JOIN foreignKey f ON p.id = f.CO_id