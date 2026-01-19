select CURRENT_TIMESTAMP
SELECT CURRENT_DATE
SELECT GETDATE()
SELECT GETUTCDATE()
SELECT ISDATE(GETDATE())
SELECT DATEADD(MONTH ,2, CURRENT_DATE)
SELECT DATEDIFF(MONTH , CURRENT_DATE, '2026-02-15')
SELECT DATENAME(MONTH, CURRENT_DATE)

SELECT STUFF('samir khan ' , 2,4, 'aim' )
SELECT REPLACE('samir khan', 'khan','shah')
SELECT ASCII('s')
SELECT CHAR(115)
SELECT CONCAT('samir', 'shaikh')
SELECT LEFT('SAMIRKHAN' , 3)
SELECT RIGHT('SAMIRKHAN' , 6)
SELECT FORMAT(12345696, '####-##-##')
SELECT DATALENGTH('samir')
SELECT UPPER('zaid khan')
SELECT LOWER('ZAIKH')
SELECT LTRIM('    samir')
SELECT RTRIM('samir    ')
SELECT QUOTENAME('samir', '{}')
SELECT STUFF('samir kjan', 4, 2, 'rin') 
SELECT TRANSLATE('today', 'day', 'sun')

--ADVANCE FUNCTION
SELECT * FROM orders

CREATE TABLE PRACTICE
(id int ,
name varchar(30),
age int)

insert INTO PRACTICE (id, name, age)
VALUES (1,'samir', 25),
( null,'umair', 21),
(3,'mudassir', 18)



SELECT * FROM PRACTICE

SELECT ISNULL(id, 2) FROM PRACTICE 
select*, COALESCE(id, 5) FROM PRACTICE

SELECT (id*age) from PRACTICE
SELECT (id + age) from PRACTICE
SELECT (id % age) from PRACTICE

--LOGICAL OPERATOR
SELECT * FROM orders
SELECT * FROM orders
WHERE payment_method  = SOME (SELECT payment_method   FROM orders WHERE payment_method = 'UPI' ) 

SELECT total_amount FROM orders
WHERE total_amount  = SOME  (SELECT total_amount FROM orders WHERE total_amount > 55000 ) 

SELECT * FROM orders o
WHERE EXISTS (SELECT id FROM Projects p WHERE p.project_id=o.order_id)

--HAVING CLAUSE

SELECT payment_method, count(*) as COUNTofnumber from orders
GROUP BY payment_method 
HAVING COUNT(*) > 3

--STRING FUNCTIONS
SELECT CHARINDEX('r' , 'samir' ) --its work with srtring
SELECT CONCAT('SAIR','KHAN') --its work with int & srtring
SELECT DATALENGTH('samirkhan') --its work with int & srtring
SELECT LEN('asjbabsc')
SELECT FORMAT(20250525, '####-##-##')
SELECT LEFT('sa kniife', 5)
SELECT RIGHT('ksjcbjhb', 6)
SELECT UPPER('namiR')
SELECT LOWER('ndsmM')
SELECT LTRIM('                    samir')
SELECT REPLACE('samir khan', 'khan', 'shaikh')
SELECT REVERSE('sair')
SELECT QUOTENAME('', '{}')
SELECT STUFF('samir khan', 2, 4, 'aima')
SELECT TRANSLATE('{akjnd+ kn}', '{+}', '[-]')

--ADVANCE builtin Functions

SELECT SYSTEM_USER 
SELECT ISNULL(NULL, 'samir')
SELECT COALESCE(null,null,'samir')
SELECT NULLIF(25,25)
SELECT CONVERT( int, 25.25)
SELECT cast(25.25 as char)
SELECT IIF(500>10 , 'yes', 'no')
SELECT ISNUMERIC(1156)

-- CASE EXPRETION

SELECT total_amount , payment_method,
CASE	
	WHEN total_amount > 55000 THEN 'over value'
	WHEN total_amount < 55000 THEN 'under value'
	ELSE 'midel'
END as medels
FROM orders


-- SELECT INTO 
SELECT * INTO newreplicate FROM orders
WHERE payment_method in(SELECT payment_method FROM orders WHERE payment_method = 'UPI' )

SELECT CHARINDEX('e', 'msjes')
SELECT CONCAT('samir', 'khan')
SELECT DATALENGTH('')






-- CHARINDEX   

SELECT CHARINDEX('@', 'mohshuzef@gmail.com')

select email,
	SUBSTRING(email, CHARINDEX('@', email) + 1 , len(email) ) as domain
from employee

SELECT SUBSTRING('huzefshaikh',5+1,6 )

-- CONCAT
SELECT name , lastName, concat(name,' ',lastName)  as fullName 
FROM employee

SELECT * FROM employee

-- DATALENGTH() AND LEN()
SELECT len('samir    ') --it count charachter
SELECT datalength('samir    ')  -- its count biyts

--FORMAT()
SELECT total_amount , 
	FORMAT(total_amount, 'C', 'en-IN')
FROM orders

SELECT start_date, 
	FORMAT(start_date, 'yyyy/MM/dd') 
FROM Projects

SELECT FORMAT(CURRENT_DATE, 'dd,MMMM yy')


--LEFT & RIGHT
SELECT pro_name, left(pro_name, 4)  from Projects 
SELECT id, right(id, 2) from orders 

select * from Projects

SELECT right(left((select pro_name from Projects where project_id = 1), 5 ), 6)
SELECT right(left(pro_name , 9 ), 4) from Projects where project_id =1

--LTRIM RTRIM
SELECT ltrim('     HIGH    ')as trim
SELECT rtrim('     HIGH     ')as trim
SELECT LTRIM(RTRIM('   samir   ')) as new


--REPLACE
SELECT REPLACE('samie khain', 'khain', 'khan')
SELECT pro_name, REPLACE(pro_name, 'AI', 'Artificial Intelegence') FROM  Projects

--REVERSE() CONVERT() CONCAT()
REVERSE
SELECT order_id, 
       CONCAT('ORD', REVERSE(CONVERT(VARCHAR, order_id))) as order_code
FROM orders;

---TRANSLATE()
SELECT TRANSLATE('(16632)4313', '()','{}')

SELECT * from employee

--ISNULL COALESCE
ALTER TABLE employee
ADD bugud int 

SELECT name, coalesce(bugud, id,0) as salary from employee
SELECT name, ISNULL(bugud ,0) as salary from employee

-- CONVERT CAST
SELECT salary, convert(varchar,salary ) from employee
SELECT dateOfJoining, cast(dateOfJoining AS varchar ) from employee

--MULTIPLE IIF 
SELECT total_amount,
	IIF(total_amount > 50000, 'PRIMEUM',
		IIF(total_amount > 30000 ,'MEDIUM',
			IIF(total_amount > 10000 ,'LOWER','EXTRA LOWER' ) ))
from orders

CREATE TABLE empl(
id int primary key,
name varchar(20)
)

create table empDepar(
id int primary key, 

constraint fk_cons FOREIGN KEY (id)
REFERENCES empl (id)
)


--JOINS

SELECT * FROM orders
SELECT * FROM employee

SELECT e.name , e.lastName , e.domain, o.total_amount, order_date,
		o.payment_method from employee e
INNER JOIN orders o ON e.id = o.order_id

SELECT * from Products
SELECT * FROM Products_sales

SELECT p.product_id, p.product_name, p.products_price, ps.quantity, ps.salesperson, ps.payment_status from Products p
LEFT JOIN Products_sales ps ON p.product_id = ps.quantity

SELECT * from employee
SELECT * from address2

SELECT e.id ,e.name, e.email, a.address, a.city from employee e
LEFT JOIN address2 a ON e.id = a.address_id

SELECT e1.id, e1.name, e2.phoen  from employee e1
join employee e2 ON e1.name = e2.name

SELECT p.product_id, p.product_name, p.products_price, ps.quantity, ps.salesperson, ps.payment_status from Products p
FULL OUTER JOIN Products_sales ps ON p.product_id = ps.quantity

