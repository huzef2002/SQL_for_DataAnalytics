CREATE TABLE employee(
id int primary key,
employeeId int unique,
firstName varchar(15) NOT NULL,
lastName varchar(15) NOT NULL,
email varchar(50) unique ,
phoen varchar(10) unique,
domain varchar(30),
city varchar(15) default('pune'),
salary int ,
dateOfJoining date,
); 

INSERT INTO employee 
VALUES
( 1,	1001,	'kaif',	'khan',	'kaif254@gmail.com',	'7754264300',	'front developer',	'mumbai',	25000, '2022-05-15'),
( 2 ,1002, 'umair', 'shaikh', 'shaikh233@gmail.com', '7746827390', 'backend developer', 'nasik',28000, '2022-02-25'),
( 3 ,1003, 'umar', 'patel', 'pataile12@gmail.com', '9853264300', 'data analytics', 'jalgaon',22000, '2022-11-05'),
( 4 ,1004, 'juned', 'shaikh', 'juned366@gmail.com', '7754269936', 'fullstack developer', 'mumbai',28000, '2022-06-09'),
( 5 ,1005, 'saim', 'khan', 'khan344@gmail.com', '7757926300', 'ui/ux developer', 'aurangabad',24000, '2023-10-14'),
( 6 ,1006, 'kaif', 'shah', 'kaif54@gmail.com', '7754294300', 'front developer', 'mumbai',25000, '2022-05-15'),
( 7 ,1007, 'umair', 'shaikh', 'shaikh833@gmail.com', '7746824390', 'backend developer', 'pune' ,28000, '2022-02-25'),
( 8 ,1008, 'kaif', 'khan', 'kaif273@gmail.com', '7754264646', 'front developer', 'mumbai',25000, '2022-05-15'),
( 9 ,1009, 'umair', 'shaikh', 'shaikh773@gmail.com', '4624827390', 'backend developer', 'nasik',28000, '2022-02-25'),
( 10 ,1010, 'umar', 'patel', 'pataile102@gmail.com', '7931264300', 'data analytics', 'jalgaon',22000, '2022-11-05'),
( 11 ,1011, 'juned', 'shaikh', 'juned4366@gmail.com', '4675269936', 'fullstack developer', 'mumbai',28000, '2022-06-09'),
( 12 ,1012, 'saim', 'khan', 'khan3163@gmail.com', '4692926300', 'ui/ux developer', 'aurangabad',24000, '2023-10-14'),
( 13 ,1013, 'kaif', 'shah', 'kaif5426@gmail.com', '6319294300', 'front developer', 'mumbai',25000, '2022-05-15'),
( 14 ,1014, 'umair', 'shaikh', 'shaikh41263@gmail.com', '7934824390', 'backend developer','dilhi',28000, '2022-02-25'),
( 15 ,1015, 'kaif', 'khan', 'kaif4623@gmail.com', '7754796387', 'front developer', 'mumbai',25000, '2022-05-15'),
( 16 ,1016, 'umair', 'shaikh', 'shaikh1633@gmail.com', '4624145690', 'backend developer', 'nasik',28000, '2022-02-25'),
( 17 ,1017, 'umar', 'patel', 'pataile146@gmail.com', '7931463200', 'data analytics', 'jalgaon',22000, '2022-11-05'),
( 18 ,1018, 'juned', 'shaikh', 'juned3463@gmail.com', '4675796543', 'fullstack developer', 'mumbai',28000, '2022-06-09'),
( 19 ,1019, 'saim', 'khan', 'khan3463@gmail.com', '4692463500', 'ui/ux developer', 'aurangabad',24000, '2023-10-14'),
( 20 ,1020, 'kaif', 'shah', 'kaif463@gmail.com', '6319937100', 'front developer', 'mumbai',25000, '2022-05-15');

--change table 
exec sp_rename 'employee', 'EMP';

--change column name 
exec sp_rename 'employee.email','EmpEmail','COLUMN';

--add column
ALTER TABLE employee
ADD age varchar(15) check(age >= 18);

--Delete column
ALTER TABLE employee
DROP COLUMN age;

--ADD constraint 
ALTER TABLE employee
ADD constraint uniq_email unique (email);

--delete constarint 
ALTER TABLE employee
DROP constraint uniq_email; 

--change data type 
ALTER TABLE employee
ALTER column salary float;

SELECT * FROM employee;


--WHERE caluses
SELECT * from employee where city='jalgaon';
SELECT * from employee where salary >25000;

--AND OR NOT
SELECT * from employee WHERE firstName = 'kaif' AND  lastName = 'khan' ;
SELECT * FROM employee WHERE lastName ='khan' OR  lastName='shaikh'; 
SELECT * from employee WHERE NOT lastName= 'shaikh';

--BETWEEN 
SELECT * FROM employee WHERE id BETWEEN 5 AND 15;
SELECT * FROM employee WHERE employeeId in (1003,1006,1009);

--EDIT VALUE FROM TABLE
UPDATE employee SET city='pune' where firstName='umair';
UPDATE employee SET phoen = 4465136986 where id = 5

--WILD CARD characters 
SELECT * FROM employee WHERE firstName LIKE 'sa%';
SELECT * FROM employee WHERE lastName LIKE 'kh_n';
SELECT * FROM employee WHERE city LIKE 'mumb[ua]i';
SELECT * from employee where firstName LIKE 'uma[^we]r'

EXEC sp_rename 'employee', 'sam';
EXEC sp_rename 'employee.firstName', 'name'

ALTER TABLE employee 
ADD janam int ;

ALTER TABLE employee
DROP COLUMN janam

ALTER TABLE employee 
ALTER column name varchar(30)

-- HAVING CALUSE

SELECT domain, salary, count(name) as countAS FROM employee
GROUP BY salary, domain
HAVING AVG(salary) >  20000
ORDER BY countAS asc






