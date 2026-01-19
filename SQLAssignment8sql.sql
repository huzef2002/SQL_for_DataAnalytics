 CREATE TABLE sales (
 sale_id int primary key, 
 product_id  int, 
 customer_id int unique, 
 sale_date date, 
 quantity int, 
 unit_price float, 
 total_price float, 
 salesperson varchar(30), 
 region varchar(30), 
 payment_status varchar(30) check(payment_status IN ('Paid', 'Pending'))
 );

 insert into  sales(sale_id, product_id, customer_id, sale_date, quantity, unit_price, total_price, salesperson, region, payment_status)
 values
(1, 101, 1, '2024-01-15', 2, 55000, 110000, 'Raj Sharma', 'West', 'Paid'),
(2, 102, 2, '2024-01-16', 3, 25000, 75000, 'Priya Patil', 'North', 'Pending'),
(3, 103, 3, '2024-01-17', 1, 45000, 45000, 'Amit Verma', 'South', 'Paid'),
(4, 104, 4, '2024-01-18', 5, 5000, 25000, 'Neha Singh', 'East', 'Paid'),
(5, 105, 5, '2024-01-19', 2, 12000, 24000, 'Sandeep Jain', 'West', 'Pending'),
(6, 106, 6, '2024-01-20', 1, 18000, 18000, 'Pooja Reddy', 'North', 'Paid'),
(7, 107, 7, '2024-01-21', 3, 15000, 45000, 'Rahul Kumar', 'South', 'Paid'),
(8, 108, 8, '2024-01-22', 4, 2500, 10000, 'Anjali Desai', 'East', 'Pending'),
(9, 109, 9, '2024-01-23', 6, 1200, 7200, 'Vikram Malhotra', 'West', 'Paid'),
(10, 110, 10, '2024-01-24', 2, 3500, 7000, 'Sneha Gupta', 'North', 'Paid'),
(11, 111, 11, '2024-01-25', 1, 6000, 6000, 'Rohan Joshi', 'South', 'Pending'),
(12, 112, 12, '2024-01-26', 3, 4500, 13500, 'Meera Iyer', 'East', 'Paid'),
(13, 113, 13, '2024-01-27', 2, 8000, 16000, 'Arun Nair', 'West', 'Paid'),
(14, 114, 14, '2024-01-28', 5, 2000, 10000, 'Kavita Menon', 'North', 'Pending'),
(15, 115, 15, '2024-01-29', 1, 7000, 7000, 'Deepak Shah', 'South', 'Paid'),
(16, 116, 16, '2024-01-30', 2, 6000, 12000, 'Nisha Rao', 'East', 'Paid'),
(17, 117, 17, '2024-01-31', 3, 1500, 4500, 'Sanjay Mehta', 'West', 'Pending'),
(18, 118, 18, '2024-02-01', 4, 800, 3200, 'Anita Pillai', 'North', 'Paid'),
(19, 119, 19, '2024-02-02', 1, 3000, 3000, 'Mohan Chopra', 'South', 'Paid'),
(20, 120, 20, '2024-02-03', 2, 8500, 17000, 'Sunita Bose', 'East', 'Pending');


exec sp_rename 'sales', 'Products_sales';

exec sp_rename 'Products_sales.sales_id', 'id', 'column';

ALTER TABLE Products_sales
ADD name varchar(30) ;

ALTER TABLE Products_sales
DROP COLUMN name ;

ALTER TABLE Products_sales
ADD CONSTRAINT price_range_con check(total_price >= 3000);

ALTER TABLE Products_sales
DROP CONSTRAINT price_range_con ;

ALTER TABLE Products_sales
ALTER COLUMN sale_date DATETIME;

select * FROM Products_sales where payment_status = 'Pending'

UPDATE Products_sales set quantity =10 where sale_id = 3

select * from Products_sales order by sale_date desc ;


SELECT * FROM Products_sales;

--where clause

SELECT * FROM Products_sales where quantity=2 
SELECT * FROM Products_sales where quantity> 2
SELECT * FROM Products_sales where quantity between 2 AND 5 
SELECT * FROM Products_sales where quantity != 2


--willd card characters?

SELECT * FROM Products_sales WHERE   salesperson LIKE 'A%'
SELECT * FROM Products_sales WHERE   salesperson LIKE '[sk]A%'
SELECT * FROM Products_sales WHERE   salesperson LIKE '[^bjhcw]A%'

--in 
SELECT * FROM Products_sales 
WHERE quantity in(5,3)

SELECT * FROM Products_sales 
WHERE quantity BETWEEN 1 AND 3;

select abs(-16) as Absolute
SELECT AVG(quantity) from Products_sales
SELECT CEILING(15.36)
SELECT FLOOR(15.644)
SELECT count(quantity) from Products_sales
SELECT rand()
SELECT ROUND(15.644, 2)
SELECT SQRT(25)
SELECT SQUARE(5)

SELECT CURRENT_DATE
SELECT GETDATE()
SELECT GETUTCDATE()
SELECT ISDATE((SELECT sale_date FROM Products_sales where sale_id = 2 ))
SELECT DATEADD(month , 5, current_date)
SELECT DATEADD(year , 5, current_date)
SELECT DATEADD(QUARTER , 5, current_date)
SELECT DATEADD( HOUR , 5, getdate())
SELECT DATENAME( DAYOFYEAR,current_date)
SELECT DATENAME( WEEKDAY,current_date)

select ASCII('asj')
SELECT char(97) --return char using ascii value
SELECT CHARINDEX('e', 'samer')
SELECT CONCAT('shaikh', 'samer')
SELECT DATALENGTH( 'samer')
SELECT LEN( 'samer')

SELECT LEFT('samir shauijg', 3)
SELECT right('samir shauijg', 3)

SELECT LTRIM('    samie')


SELECT REPLACE('i am a boy', 'boy', 'girl')

SELECT QUOTENAME('jamir', '()')

SELECT STUFF('GUID_COCHING', 1,4, 'PUNE')

SELECT translate('gufrain_khan', 'khan', 'jain')

SELECT CURRENT_USER
SELECT USER_NAME()
SELECT SYSTEM_USER

SELECT ISNULL(null,'guid')

SELECT COALESCE(null,'samir', 'jaman',null)

SELECT NULLIF(25,25) -- the value is same than return null other wise 25

SELECT cast(25.25 as int)

SELECT  IIF(25=25, 'YES', 'NO')

SELECT ISNUMERIC(269)

SELECT * FROM Products_sales
select * FROM Products

--inner JOIN 

SELECT Ps.sale_id,Ps.unit_price, Ps.salesperson, Ps.quantity, P.product_name, P.products_price, P.stock_quantity 
FROM Products_sales Ps
join Products p
ON Ps.unit_price= P.products_price


