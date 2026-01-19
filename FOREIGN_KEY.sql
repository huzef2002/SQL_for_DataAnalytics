CREATE TABLE prrrr(
prr_id int primary key,
name varchar(30),
age int 
)

insert INTO prrrr(prr_id, age, name)
VALUES(1,25,'jaman'),
(2,50,'saara'),
(3,15,'saima')

CREATE TABLE frrrr(
frr_id int primary key ,
city varchar(30),
salary int
CONSTRAINT FK_const FOREIGN KEY (frr_id)
REFERENCES prrrr (prr_id)
);

insert into frrrr
values(1,'jamner', 25000),
(2,'jalgaon', 15000),
(3,'pahur', 21000)

SELECT * FROM printS;
SELECT * FROM frrrr

EXEC sp_rename 'print' , 'printS'
EXEC sp_rename 'printS.name' , 'Pname'

ALTER TABLE printS
ADD Bgroup varchar(30);

ALTER TABLE printS
DROP COLUMN Bgroup

ALTER TABLE printS
ADD CONSTRAINT DN_const default('samir') FOR Pname

ALTER TABLE printS
DROP CONSTRAINT DN_const

ALTER TABLE printS
ALTER COLUMN Pname varchar(20)

SELECT system_user
SELECT user_name() 

SELECT ISNULL(null, 'samir')