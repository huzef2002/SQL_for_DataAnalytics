CREATE TABLE orders(
order_id int primary key,
customer_id int unique, 
order_date date, 
total_amount int, 
status varchar(50), 
payment_method varchar(50), 
shipping_address varchar(250), 
billing_address varchar(250), 
delivery_date date, 
order_notes text
); 

INSERT INTO orders
(order_id,customer_id,order_date,total_amount,status,payment_method, shipping_address, billing_address, delivery_date, order_notes )
VALUES
(1, 501, '2024-01-15', 55000, 'Delivered', 'Credit Card', 'Business Bay, Mumbai', 'Business Bay, Mumbai', '2024-01-18', 'Handle with care'),
(2, 502, '2024-01-16', 75000, 'Processing', 'Debit Card', 'Connaught Place, Delhi', 'Connaught Place, Delhi', '2024-01-20', 'Gift wrapping required'),
(3, 503, '2024-01-17', 120000, 'Shipped', 'UPI', 'Electronic City, Bangalore', 'Electronic City, Bangalore', '2024-01-19', 'Fragile items'),
(4, 504, '2024-01-18', 45000, 'Delivered', 'Net Banking', 'Hitech City, Hyderabad', 'Hitech City, Hyderabad', '2024-01-21', 'Office delivery'),
(5, 505, '2024-01-19', 68000, 'Processing', 'Credit Card', 'Magarpatta, Pune', 'Magarpatta, Pune', '2024-01-23', 'Weekend delivery'),
(6, 506, '2024-01-20', 92000, 'Shipped', 'Debit Card', 'Bandra, Mumbai', 'Bandra, Mumbai', '2024-01-22', 'Signature required'),
(7, 507, '2024-01-21', 35000, 'Delivered', 'UPI', 'Jayanagar, Bangalore', 'Jayanagar, Bangalore', '2024-01-24', 'Leave at reception'),
(8, 508, '2024-01-22', 78000, 'Processing', 'Net Banking', 'Gachibowli, Hyderabad', 'Gachibowli, Hyderabad', '2024-01-25', 'Call before delivery'),
(9, 509, '2024-01-23', 56000, 'Shipped', 'Credit Card', 'Koregaon Park, Pune', 'Koregaon Park, Pune', '2024-01-26', 'Installation required'),
(10, 510, '2024-01-24', 45000, 'Delivered', 'Debit Card', 'Andheri, Mumbai', 'Andheri, Mumbai', '2024-01-27', 'Ground floor only'),
(11, 511, '2024-01-25', 67000, 'Processing', 'UPI', 'HSR Layout, Bangalore', 'HSR Layout, Bangalore', '2024-01-28', 'Security check needed'),
(12, 512, '2024-01-26', 89000, 'Shipped', 'Net Banking', 'Banjara Hills, Hyderabad', 'Banjara Hills, Hyderabad', '2024-01-29', 'Parking available'),
(13, 513, '2024-01-27', 34000, 'Delivered', 'Credit Card', 'Kalyani Nagar, Pune', 'Kalyani Nagar, Pune', '2024-01-30', 'Evening delivery'),
(14, 514, '2024-01-28', 76000, 'Processing', 'Debit Card', 'Powai, Mumbai', 'Powai, Mumbai', '2024-01-31', 'ID proof required'),
(15, 515, '2024-01-29', 58000, 'Shipped', 'UPI', 'Whitefield, Bangalore', 'Whitefield, Bangalore', '2024-02-01', 'No plastic packaging'),
(16, 516, '2024-01-30', 92000, 'Delivered', 'Net Banking', 'Jubilee Hills, Hyderabad', 'Jubilee Hills, Hyderabad', '2024-02-02', 'Lift available'),
(17, 517, '2024-01-31', 45000, 'Processing', 'Credit Card', 'Kothrud, Pune', 'Kothrud, Pune', '2024-02-03', 'Morning delivery'),
(18, 518, '2024-02-01', 67000, 'Shipped', 'Debit Card', 'Thane, Mumbai', 'Thane, Mumbai', '2024-02-04', 'Contact manager'),
(19, 519, '2024-02-02', 78000, 'Delivered', 'UPI', 'Marathahalli, Bangalore', 'Marathahalli, Bangalore', '2024-02-05', 'Parking at back'),
(20, 520, '2024-02-03', 56000, 'Processing', 'Net Banking', 'Madhapur, Hyderabad', 'Madhapur, Hyderabad', '2024-02-06', 'Gate pass required');

SELECT * FROM orders;

--change table name 
exec sp_rename 'orders', 'Orders';

--CHAGE Column name 
exec sp_rename 'orders.billing_address','billing_ADD', 'column';

--add column 
alter table orders
ADD customer_name varchar(50) default('sami');

--DELETE column 
ALTER TABLE orders 
DROP COLUMN customer_name ;

--DELET constraint 
ALTER TABLE orders
DROP CONSTRAINT DF__orders__customer__4CC05EF3;

--ADD CONSTRAINT
ALTER TABLE orders
ADD CONSTRAINT Def_cons default 'UPI' FOR payment_method;

--chage data type
ALTER TABLE orders
ALTER COLUMN total_amount float;


SELECT * FROM orders;

--exec sp_rename 'orders', 'customer_orders'
exec sp_rename 'orders.customer_id', 'id' , 'column'

alter table orders
add sallary int not null default(5000)



alter table orders
drop column sallary;

ALTER TABLE orders 
DROP CONSTRAINT DF__orders__sallary__031C6FA4

ALTER TABLE orders 
ADD CONSTRAINT check_const check (status in ('Delivered','Processing','Shipped'))

ALTER TABLE orders
ALTER COLUMN payment_method varchar(30)
SELECT * FROM orders where payment_method = 'UPI' ;

SELECT * FROM orders where id LIKE '5%';
SELECT * FROM orders WHERE total_amount LIKE '550_0';
SELECT * FROM orders WHERE total_amount LIKE '[75]5000';
SELECT * FROM orders WHERE total_amount LIKE '[^75]5000';


-- SUBQUERY
SELECT IIF(
	(SELECT total_amount FROM orders WHERE id=501 )< (SELECT total_amount FROM orders WHERE id=502), 'YES', 'NO'
) AS comperision

SELECT * FROM orders
WHERE total_amount < (SELECT AVG(total_amount) FROM orders)

SELECT * FROM orders
WHERE total_amount = (SELECT max(total_amount) FROM orders )  

SELECT * FROM orders
WHERE status != 'Delivered'

SELECT o1.order_id, o1.total_amount, o1.shipping_address,
(SELECT AVG(o2.total_amount) as amount_avg from orders o2 ) 
FROM orders o1
WHERE total_amount > (SELECT AVG(o2.total_amount) from orders o2 ) 

SELECT * FROM orders
WHERE payment_method = 'UPI'
AND total_amount > (SELECT AVG(total_amount) FROM orders);

--multipul column subquery
SELECT * FROM orders
SELECT * FROM Projects

SELECT * FROM orders WHERE order_id in (SELECT p.project_id from projects p where p.client_name='sunil')


--SECOND highest Total Amount

SELECT MAX(total_amount) FROM orders WHERE total_amount <(SELECT MAX(total_amount) FROM orders)

--THIRD Highest Total_amount
SELECT MAX(total_amount) FROM orders WHERE total_amount <(
SELECT MAX(total_amount) FROM orders WHERE total_amount <(SELECT MAX(total_amount) FROM orders))

--correlated SubQuery
SELECT * FROM orders o1
WHERE 3 = (SELECT COUNT(total_amount) FROM orders o2
	WHERE o2.total_amount > o1.total_amount )

SELECT o1.id,o1.total_amount from orders o1
INNER JOIN orders o2 
ON o1.id = o2.id 
WHERE o1.total_amount > (SELECT AVG(total_amount) FROM orders)

-- EXISTS AND NOT EXISTS

SELECT * FROM orders o
WHERE NOT EXISTS (SELECT p.project_id FROM Projects p WHERE p.project_id = o.order_id)

-- SELECT INTO 
--is use to copy table data into new table

SELECT * INTO NEWTABLE FROM Projects 

SELECT * FROM NEWTABLE

--murge two table using SELECT INTO
SELECT p.pro_name, p.budget, o.payment_method,o.status INTO MurgePro_ord FROM Projects p
LEFT JOIN orders o
ON p.project_id = o.order_id

SELECT * FROM MurgePro_ord 

-- HOW TO JOIN 2 or MORE TABLE USING SELECT INTO
SELECT * FROM Projects
SELECT * FROM orders
SELECT * FROM Products_sales

SELECT p.project_id,p.pro_name, o.payment_method,ps.payment_status INTO TreeMurgeTable FROM Projects p 
LEFT JOIN orders o
ON p.project_id = o.order_id
LEFT JOIN Products_sales ps
ON o.order_id = ps.sale_id 

SELECT * FROM TreeMurgeTable 

--CASE EXPRETION

SELECT budget,project_id, pro_name,
CASE 
	WHEN budget = 250000 THEN 'under value'
	WHEN budget = 550000 THEN 'over value'
	else 'midle'
	END as valuesOfbudget
FROM Projects 

--AUTO INCREMENT
CREATE TABLE AUTOINCREMENT (
id int IDENTITY(2,1),
name varchar(20)
)
INSERT INTO AUTOINCREMENT VALUES('khan ')
SELECT * FROM AUTOINCREMENT 

SELECT CEILING(253.0525)
SELECT FLOOR(246.13)

--VIEW
CREATE VIEW VWorders
AS
SELECT * FROM orders

SELECT * FROM VWaorders

EXEC sp_refreshview  VWorders
EXEC sp_helptext VWorders

ALTER TABLE orders ADD  samir varchar(30)
ALTER TABLE orders DROP column  samir 

DROP VIEW VWorders

-- schemabinding with VIEW  -- WE CAN READ ONLY 
CREATE VIEW VWaorders
with schemabinding 
AS
SELECT order_id, total_amount, payment_method FROM dbo.orders

SELECT * FROM orders
SELECT * FROM VWaorders


--UPDATE VIEW
UPDATE VWaorders SET total_amount=12000 WHERE  order_id= 3

--INSERT VALUE INTO VIEW
INSERT INTO VWaorders VALUES(21, 50000, 'Net Banking')

--DELETE ROW INTO VIEW
DELETE VWaorders WHERE order_id = 21
EXEC sp_helptext vwaorders

DELETE orders where id = 503

update VWaorders set payment_method='UPI' where order_id = 21


--variables
DECLARE @VR_1 int
SET @VR_1=20

SELECT @VR_1

CREATE VIEW VWTwoTable
AS 
SELECT manager_id,e.name, e.email, e.phoen, p.pro_name, p.budget,  client_name  FROM Projects p
JOIN employee e
ON p.project_id = e.id

SELECT * from orders
SELECT * FROM Projects
SELECT * from employee
SELECT * from VWTwoTable 




-- stored procedure

CREATE PROCEDURE PSfororder
AS 
BEGIN 

DECLARE @name_ varchar(200)
SET @name_='order_notes'
SELECT id,order_date, total_amount, @name_ FROM orders
END

EXEC PSfororder

CREATE PROCEDURE PSorder
AS 
BEGIN 

DECLARE @name_ varchar(200)
SET @name_='order_notes'
SELECT id,order_date, total_amount, @name_ FROM orders
END

PSorder
PSfororder

UPDATE PSfororder SET id=521 where total_amount= 50000

DROP PROC PSorder

EXEC sp_helptext PSfororder

