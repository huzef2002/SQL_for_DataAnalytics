CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    country VARCHAR(50),
    registration_date DATE,
    last_login_date DATETIME,
    status VARCHAR(20) CHECK(status IN ('Active', 'Inactive', 'Suspended'))
);

INSERT INTO Customers VALUES
(101, 'Raj', 'Sharma', 'raj.sharma@email.com', '9876543210', 'Mumbai', 'India', '2023-01-15', '2024-01-20', 'Active'),
(102, 'Priya', 'Patel', 'priya.patel@email.com', '9876543211', 'Delhi', 'India', '2023-02-20', '2024-01-18', 'Active'),
(103, 'Amit', 'Verma', 'amit.verma@email.com', '9876543212', 'Bangalore', 'India', '2023-03-10', '2023-12-30', 'Inactive'),
(104, 'Neha', 'Singh', 'neha.singh@email.com', '9876543213', 'Mumbai', 'India', '2023-04-05', '2024-01-10', 'Active'),
(105, 'Sandeep', 'Jain', 'sandeep.jain@email.com', '9876543214', 'Pune', 'India', '2023-05-12', NULL, 'Suspended'),
(106, 'Pooja', 'Reddy', 'pooja.reddy@email.com', '9876543215', 'Hyderabad', 'India', '2023-06-18', '2024-01-15', 'Active'),
(107, 'Rahul', 'Kumar', 'rahul.kumar@email.com', '9876543216', 'Delhi', 'India', '2023-07-22', '2023-11-30', 'Inactive'),
(108, 'Anjali', 'Desai', 'anjali.desai@email.com', '9876543217', 'Mumbai', 'India', '2023-08-30', '2024-01-05', 'Active');

CREATE TABLE E_Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    order_status VARCHAR(20) CHECK(order_status IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')),
    total_amount DECIMAL(10,2),
    shipping_address VARCHAR(200),
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    estimated_delivery_date DATE,
    actual_delivery_date DATE
);

INSERT INTO E_Orders VALUES
(1001, 101, '2024-01-05', 'Delivered', 5500.00, '101, MG Road, Mumbai', 'Credit Card', 'Paid', '2024-01-10', '2024-01-09'),
(1002, 102, '2024-01-06', 'Delivered', 12000.00, '45, Connaught Place, Delhi', 'UPI', 'Paid', '2024-01-12', '2024-01-11'),
(1003, 101, '2024-01-10', 'Shipped', 8500.00, '101, MG Road, Mumbai', 'Debit Card', 'Paid', '2024-01-15', NULL),
(1004, 104, '2024-01-12', 'Processing', 3200.00, '78, Bandra, Mumbai', 'COD', 'Pending', '2024-01-17', NULL),
(1005, 106, '2024-01-15', 'Pending', 4500.00, '23, Hitech City, Hyderabad', 'Credit Card', 'Failed', '2024-01-20', NULL),
(1006, 102, '2024-01-18', 'Delivered', 9800.00, '45, Connaught Place, Delhi', 'Net Banking', 'Paid', '2024-01-23', '2024-01-22'),
(1007, 108, '2024-01-20', 'Shipped', 15000.00, '12, Andheri, Mumbai', 'Credit Card', 'Paid', '2024-01-25', NULL),
(1008, 105, '2023-12-10', 'Cancelled', 6500.00, '34, Kothrud, Pune', 'UPI', 'Refunded', '2023-12-15', NULL),
(1009, 101, '2024-01-25', 'Pending', 2200.00, '101, MG Road, Mumbai', 'COD', 'Pending', '2024-01-30', NULL),
(1010, NULL, '2024-01-28', 'Processing', 18000.00, 'Guest Order - No Customer', 'Credit Card', 'Paid', '2024-02-02', NULL);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT FOREIGN KEY REFERENCES Orders(order_id),
    product_id INT,
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(10,2),
    line_total AS (quantity * unit_price - discount),
    category VARCHAR(50),
    brand VARCHAR(50)
);


INSERT INTO Order_Items VALUES
(1, 1001, 201, 'iPhone 14 Pro', 1, 5000.00, 500.00, 'Electronics', 'Apple'),
(2, 1001, 202, 'Wireless Earbuds', 1, 1000.00, 0.00, 'Electronics', 'Sony'),
(3, 1002, 203, 'Samsung TV 55"', 1, 12000.00, 0.00, 'Electronics', 'Samsung'),
(4, 1003, 204, 'Nike Running Shoes', 2, 4000.00, 500.00, 'Fashion', 'Nike'),
(5, 1003, 205, 'Adidas T-Shirt', 1, 1500.00, 0.00, 'Fashion', 'Adidas'),
(6, 1004, 206, 'Kitchen Mixer', 1, 3200.00, 0.00, 'Home Appliances', 'Philips'),
(7, 1005, 207, 'Dell Laptop', 1, 4500.00, 0.00, 'Electronics', 'Dell'),
(8, 1006, 208, 'Winter Jacket', 1, 8000.00, 200.00, 'Fashion', 'Puma'),
(9, 1006, 209, 'Woolen Sweater', 2, 1000.00, 0.00, 'Fashion', 'H&M'),
(10, 1007, 210, 'PlayStation 5', 1, 15000.00, 0.00, 'Gaming', 'Sony'),
(11, 1008, 211, 'Air Purifier', 1, 6500.00, 0.00, 'Home Appliances', 'Mi'),
(12, 1009, 212, 'Books Set', 1, 2200.00, 0.00, 'Books', 'Penguin'),
(13, 1010, 213, 'Gaming Chair', 2, 9000.00, 0.00, 'Furniture', 'Green Soul');




--Find all customers who have never placed an order
SELECT  c.customer_id, c.first_name, e.order_date, e.order_status FROM Customers c
LEFT JOIN E_Orders e ON c.customer_id = e.customer_id 
WHERE e.order_id IS NULL


--List all orders with customer names, sorted by order date (newest first)
SELECT e.order_date, e.payment_method, c.customer_id, c.first_name  from E_Orders e
LEFT JOIN Customers c ON  e.customer_id= c.customer_id
ORDER BY e.order_date DESC

--Find the total revenue generated from each city
SELECT ISNULL(SUM(o.line_total), 0) as revanue, city  from Order_Items o
LEFT JOIN E_Orders e ON o.order_id = e.order_id
RIGHT JOIN Customers c ON e.customer_id = c.customer_id
GROUP BY city  
order by revanue desc

--Count how many orders each customer has placed (include customers with 0 orders)

SELECT c.customer_id ,count(e.customer_id) as Order_placed FROM Customers c
LEFT JOIN E_Orders e ON c.customer_id = e.customer_id
GROUP BY  c.customer_id

--Find the average order value for each payment method
SELECT e.payment_method, avg(o.line_total) AVG_total  from E_Orders e
LEFT JOIN Order_Items o ON e.order_id = o.order_id
GROUP BY payment_method


--List products that have never been ordered
SELECT  o.product_id,o.product_name ,e.order_id, e.order_status  from Order_Items o
LEFT JOIN E_Orders e ON o.order_id = e.order_id
WHERE e.order_id IS NULL

--Find customers who have orders in 'Pending' status

SELECT c.first_name, e.order_status FROM Customers c
INNER JOIN E_Orders e ON c.customer_id = e.customer_id
WHERE e.order_status = 'Pending'

--Calculate total discount given per product category
SELECT category, SUM(discount) as Total_discount FROM Order_Items 
GROUP BY category

--Find the most popular product category by number of units sold

SELECT TOP 1 category, COUNT(order_id) NumOfOrder
from Order_Items
GROUP BY category
ORDER BY NumOfOrder desc


     SELECT * FROM Order_Items
     SELECT * FROM E_Orders
     SELECT * FROM Customers



------------------------------------------SUBQUERY--------------------------------------------

--SUBQUERY WHITH FROM
--Find the product that have a price higher then the avrage price of all products
SELECT
* 
FROM
    (SELECT product_id,
    line_total,
    product_name,
    avg(line_total) over() AVG_Price 
    from Order_Items) as newTable 
WHERE line_total > AVG_Price 

--RANK category basend on their total amout of line_total
SELECT 
* ,
RANK() OVER(ORDER BY Total DESC) as ranking
FROM
    (SELECT 
    category,
    sum(line_total) as Total
    FROM Order_Items
    GROUP BY category) AS t 

 --SUBQUERY WHITH SELECT
 --SHOW product id, produc name , price, and the total number of orders
 SELECT 
 product_id,
 product_name,
 unit_price,
 (SELECT COUNT(order_id) FROM E_Orders )
 FROM Order_Items

 --SUBQUERY WHITH JOINS
 --SHOW all customer details and find the total orders for eatch customer
 SELECT 
 c.*,
 e.NumberOfOrder 
 FROM Customers c
     LEFT JOIN
     (SELECT
     customer_id,
     COUNT(order_id) as NumberOfOrder
     FROM E_Orders
     GROUP BY customer_id) e
ON e.customer_id = c.customer_id

--SUBQUERY WHITH WHERE CALUSES
--Find the product that have a price higher then the avrage price of all products
SELECT
order_id,
product_name,
category,
line_total,
(SELECT avg(line_total) as AVG_Price FROM Order_Items) as avg
FROM Order_Items
WHERE line_total > (SELECT avg(line_total) as AVG_Price FROM Order_Items)


-----------------------------------------CORELATED SUBQUERY-------------------------------------------

--SHOW ALL customer detailed find total oders for each customer 
SELECT 
*,
(SELECT count(order_id) from E_Orders e WHERE c.customer_id = e.customer_id)
FROM Customers c

 SELECT line_total FROM Order_Items as a1
 WHERE  1 = (SELECT count(*)
           FROM Order_Items a2
           WHERE a1.line_total  > a2.line_total )


------------------------------------------EXISTS AND NOT EXISTS-------------------------------------
SELECT 
* 
FROM Customers c
WHERE EXISTS 
            (SELECT 
            customer_id 
            FROM E_Orders e 
            WHERE order_status = 'Delivered'
            AND c.customer_id = e.customer_id);


SELECT 
* 
FROM Customers c
WHERE NOT EXISTS 
            (SELECT 
            customer_id 
            FROM E_Orders e 
            WHERE order_status = 'Delivered'
            AND c.customer_id = e.customer_id);


SELECT * FROM Order_Items
SELECT * FROM E_Orders
SELECT * FROM Customers




 SELECT MAX(line_total) FROM Order_Items WHERE line_total < (SELECT MAX(line_total) FROM Order_Items)

 ---------------------------------------CASE EXPRETION--------------------------------------

 SELECT order_id, unit_price, discount,
 CASE
    WHEN unit_price > 1000 THEN 'Over Value'
    ELSE 'Under Value'
    END AS caseHandel
 FROM Order_Items


CREATE TABLE ZYX(
ID INT identity(1,1)
)

SELECT * FROM Order_Items






