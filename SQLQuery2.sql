CREATE DATABASE SQLsecond;


CREATE TABLE users(
id int not null primary key,
name varchar(15) not null,
email varchar(50) UNIQUE,
dob date not null,
salary float not null,
age int check( age>18)
);

INSERT INTO users (id, name, email, dob, salary, age) 
VALUES (1, 'samir', 'smaie02@gmail.com', '2002-05-15', 20000.15, 19);

INSERT INTO users VAlUES(2, 'khan', 'khan433@gmail.com', '1999-09-17', 19000.09, 22),
(3, 'rafik', 'rafik483@gmail.com', '1979-07-09', 15000.75, 20);

--ALTER TABLE name 
exec sp_rename 'emp','users'

--For ALTER COLUMN name 
exec sp_rename 'users.dob','DateOfBirth','COLUMN'

--ALTER datatype
ALTER TABLE users ALTER COLUMN salary int;



SELECT * FROM users

CREATE TABLE address2(
address_id int primary key,
address varchar(200),
houseNo int,
city varchar(200)

constraint FK_address FOREIGN KEY(address_id)
REFERENCES users (id)

)

insert into address2 values(1, 'cort mohalla jamner', 501, 'jamner'),
(2, 'azam campus pune', 502, 'pune')

SELECT * from address2

--having cluses
SELECT * FROM employee

select  count(*),lastName from employee
GROUP BY lastName
HAVING count(*) > 3 




ALTER TABLE employee
DROP COLUMN bugud

SELECT * FROM orders

SELECT * FROM orders where order_date BETWEEN '2024-01-01' AND '2024-01-30'

--give the employees where domain name grater then 3
SELECT name, lastName, domain from employee
WHERE domain in (
	SELECT domain from employee
	group by domain
	HAVING COUNT(*) > 3
)


--find department with their max salary 

SELECT MAX(salary), domain from employee
GROUP By domain

select  email, CHARINDEX('@', email) from employee

SELECT email,
	SUBSTRING(email, CHARINDEX('@',email) +1, 10)
from employee

select name , lastName , CONCAT(name , ' ',lastName) from employee

select FORMAT(2025, 'C', 'en-IN')

SELECT FORMAT(convert(date,'1977-05-07') ,'dd/MM/yyyy' )