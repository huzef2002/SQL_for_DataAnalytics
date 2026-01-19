CREATE TABLE customer(
cust_id int primary key,
firstName varchar (50) NOT NULL,
lastName varchar (50) NOT NULL,
email varchar(50) unique,
phone varchar(10) unique,
address varchar(250) NOT NULL,
city varchar(50),
contry varchar(30),
companyName varchar(250),
gender varchar(30) check(gender IN('male','female'))
);

INSERT INTO customer(cust_id,firstName,lastName,email,phone,address,city,contry,companyName,gender)
VALUES
(101,'mujeeb', 'patel', 'patel4554@gmail.com', '8800551739', 'sindhi colony','jalgaon', 'india', 'infotech', 'male'),
(102,'asad', 'khan', 'khan4554@gmail.com', '8055551739', 'shriram colony', 'pune', 'india', 'devtool', 'male'),
(103,'majid', 'shaikh', 'shaikh4554@gmail.com', '8460551739', 'islam pura','mumbai',  'india', 'wipro', 'male'),
(104,'vashnavi', 'patil', 'patil1@gmail.com', '8055554632', 'shiv colony','nasuk',  'india', 'devtool', 'female'),
(105,'mujeeb', 'shah', 'shah450@gmail.com', '8893551739', 'sindhi colony','jamner',  'india', 'infotech', 'male'),
(106,'asad', 'shaikh', 'shaikh504@gmail.com', '8055461739', 'shriram colony','jalgaon',  'india', 'devtool', 'male'),
(107,'samir', 'shaikh', 'shaikh44@gmail.com', '8160055173', 'islam pura','pune',  'india', 'wipro', 'male'),
(108,'khushi', 'shimpi', 'shimpi1@gmail.com', '8055554614', 'shiv colony','mumbai',  'india', 'devtool', 'female'),
(109,'samrin', 'pathan', 'pathan149@gmail.com', '5332554662', 'shiv colony','mumbai',  'india', 'devtool', 'female'),
(110,'asad', 'khan', 'khan5364@gmail.com', '8066661739', 'shriram colony', 'pune', 'india', 'devtool', 'male'),
(111,'khushi', 'shimpi', 'khushi149@gmail.com', '3932554662', 'shiv colony','mumbai',  'india', 'devtool', 'female'),
(112,'majid', 'shaikh', 'shaikh1354@gmail.com', '8461369173', 'islam pura','mumbai',  'india', 'wipro', 'male'),
(113,'vashnavi', 'patil', 'patil106@gmail.com', '8055554136', 'shiv colony','nasuk',  'india', 'devtool', 'female'),
(114,'mujeeb', 'shah', 'shah1450@gmail.com', '8893554697', 'sindhi colony','jamner',  'india', 'infotech', 'male'),
(115,'asad', 'shaikh', 'shaikh10@gmail.com', '8051364739', 'shriram colony','jalgaon',  'india', 'devtool', 'male'),
(116,'samir', 'shaikh', 'shaikh044@gmail.com', '8756155173', 'islam pura','pune',  'india', 'wipro', 'male'),
(117,'khushi', 'shimpi', 'shimpi144@gmail.com', '9732554146', 'shiv colony','mumbai',  'india', 'devtool', 'female'),
(118,'asad', 'shaikh', 'shaikh19@gmail.com', '9051364739', 'shriram colony','jalgaon',  'india', 'devtool', 'male'),
(119,'samir', 'shaikh', 'shaikh049@gmail.com', '9756155173', 'islam pura','pune',  'india', 'wipro', 'male'),
(120,'khushi', 'shimpi', 'shimpi149@gmail.com', '9732554662', 'shiv colony','mumbai',  'india', 'devtool', 'female');

--change table name 
--exec sp_rename 'customer', 'CUSTOMER';

--change column name 
exec sp_rename 'customer.email','cust_email', 'COLUMN';

--add column 
ALTER TABLE customer 
ADD age varchar(50) NOT NULL  default(20);

--delete column
ALTER TABLE customer
DROP column age;

-- add constraint 
ALTER TABLE customer
ADD constraint pk_const primary key (id);

--delete constraint 
ALTER TABLE customer
DROP CONSTRAINT pk_const;

--chage data type
ALTER TABLE customer
ALTER COLUMN email varchar(30);

select * from customer;

SELECT * from customer where city = 'jalgaon' AND lastName='patel' ;
UPDATE customer SET contry = 'UK' where cust_id =110;

--wild character 

SELECT * FROM customer WHERE email LIKE 'shaikh%'
SELECT * FROm customer WHERE lastName LIKE 'kh_n'
SELECT * FROM customer WHERE firstName LIKE '[adf]sad'
SELECT * FROM customer WHERE firstName LIKE 'sam[^jaah]r'

SELECT * FROM customer WHERE cust_id BETWEEN 110 AND 113
SELECT * FROM customer WHERE city IN('pune', 'mumbai')

UPDATE customer SET contry='china' where gender = 'female'


SELECT ABS(-22)
SELECT CEILING(22.002)
SELECT FLOOR(225.36)
SELECT MAX(cust_id) FROM customer
SELECT MIN(cust_id) FROM customer
SELECT COUNT(cust_id) FROM customer
SELECT round(253.635,2)
SELECT RAND()
SELECT SQRT(676)
SELECT SQUARE(6)

SELECT DATEADD(YEAR, 2, getdate())
SELECT DATEADD(QUARTER, 2, getdate())
SELECT DATEADD(MONTH, 2, getdate())

SELECT DATEDIFF(QUARTER, '2002-05-15',getdate() )

SELECT DATENAME(MONTH, '2002-05-15')

SELECT DATEFROMPARTS(2013,09,19)

--String Functions

SELECT * FROM customer

SELECT ASCII(firstName) FROM customer
SELECT CHAR(97)
SELECT NCHAR(97)
SELECT CHARINDEX('r', 'SAMIR')
SELECT CONCAT('smair', ' shaikh')
SELECT DATALENGTH(firstName) FROM customer
SELECT FORMAT(15625213, '##-####-##')
SELECT LEFT('samir shaikh abdul hamid ', 10)
SELECT RIGHT('samir shaikh abdul hamid ', 10)
SELECT LTRIM('   smair  ')
SELECT RTRIM('smair  ')
SELECT REPLACE(firstName, 'samir', ' kaif') from customer
SELECT REVERSE('samir')
SELECT QUOTENAME('SAMIR', '[]')
SELECT STUFF('LEARN', 2,3, 'O')
SELECT TRANSLATE('today', 'day', 'ght')

--Advance Function
SELECT CURRENT_USER
SELECT SESSION_USER
SELECT SESSIONPROPERTY('isNULL')
SELECT USER_NAME()
SELECT SYSTEM_USER

SELECT ISNULL(NULL,'samir shah')
SELECT NULLIF(25,25)
SELECT CONVERT(int, 15.15)
SELECT CAST(253.26 as int)
SELECT IIF(10>15, 'true', 'false')

SELECT * FROM customer

