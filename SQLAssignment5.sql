CREATE TABLE products (
product_id int primary key, 
product_name varchar(50), 
category varchar(50), 
brand varchar (30), 
price int, 
supplier varchar(30), 
stock_quantity int , 
description text, 
weight varchar(20), 
manufacturer varchar(30)
);

INSERT INTO products
VALUES 
(1, 'Laptop', 'Electronics', 'Dell', 55000, 'Dell Suppliers', 50, 'High-performance laptop', '2.5 kg', 'Dell India'),
(2, 'Smartphone', 'Electronics', 'Samsung', 25000, 'Samsung Distributors', 100, 'Latest smartphone', '0.2 kg', 'Samsung India'),
(3, 'Tablet', 'Electronics', 'Apple', 45000, 'Apple Authorized', 30, 'iPad with retina display', '0.5 kg', 'Apple Inc'),
(4, 'Headphones', 'Accessories', 'Sony', 5000, 'Sony Suppliers', 200, 'Noise cancelling headphones', '0.3 kg', 'Sony India'),
(5, 'Smart Watch', 'Wearables', 'Fitbit', 12000, 'Fitbit Distributors', 80, 'Fitness tracking watch', '0.1 kg', 'Fitbit Inc'),
(6, 'Printer', 'Office Equipment', 'HP', 18000, 'HP Partners', 40, 'Wireless color printer', '8.5 kg', 'HP India'),
(7, 'Monitor', 'Electronics', 'LG', 15000, 'LG Suppliers', 60, '27-inch LED monitor', '4.2 kg', 'LG Electronics'),
(8, 'Keyboard', 'Accessories', 'Logitech', 2500, 'Logitech Distributors', 150, 'Mechanical keyboard', '1.1 kg', 'Logitech'),
(9, 'Mouse', 'Accessories', 'Dell', 1200, 'Dell Suppliers', 180, 'Wireless optical mouse', '0.2 kg', 'Dell India'),
(10, 'Router', 'Networking', 'TP-Link', 3500, 'TP-Link Distributors', 90, 'WiFi 6 router', '0.4 kg', 'TP-Link'),
(11, 'External HDD', 'Storage', 'Seagate', 6000, 'Seagate Partners', 70, '2TB portable hard drive', '0.3 kg', 'Seagate'),
(12, 'Webcam', 'Accessories', 'Logitech', 4500, 'Logitech Distributors', 120, 'HD webcam with mic', '0.2 kg', 'Logitech'),
(13, 'Speaker', 'Audio', 'JBL', 8000, 'JBL Suppliers', 50, 'Bluetooth portable speaker', '1.0 kg', 'JBL'),
(14, 'Power Bank', 'Accessories', 'Mi', 2000, 'Mi Distributors', 200, '10000mAh power bank', '0.3 kg', 'Xiaomi'),
(15, 'SSD Drive', 'Storage', 'Samsung', 7000, 'Samsung Distributors', 85, '500GB SSD drive', '0.1 kg', 'Samsung India'),
(16, 'Gaming Mouse', 'Gaming', 'Razer', 6000, 'Razer Distributors', 45, 'RGB gaming mouse', '0.3 kg', 'Razer'),
(17, 'Laptop Stand', 'Accessories', 'Amazon Basics', 1500, 'Amazon Suppliers', 110, 'Adjustable laptop stand', '1.2 kg', 'Amazon'),
(18, 'USB Cable', 'Accessories', 'Belkin', 800, 'Belkin Distributors', 300, 'Fast charging cable', '0.1 kg', 'Belkin'),
(19, 'Monitor Stand', 'Office Equipment', 'Ikea', 3000, 'Ikea Suppliers', 65, 'Ergonomic monitor stand', '3.5 kg', 'Ikea'),
(20, 'Docking Station', 'Accessories', 'Dell', 8500, 'Dell Suppliers', 35, 'USB-C docking station', '0.5 kg', 'Dell India');

--change table name 
exec sp_rename 'products' , 'Products' ;

--chage column name 
exec sp_rename 'Products.price', 'products_price','COLUMN';

-- add column
ALTER TABLE Products
ADD place varchar(30);

--DELETE column
ALTER TABLE Products
DROP COLUMN place;

--delete constraint
ALTER TABLE Products
DROP CONSTRAINT DF__Products__place__5090EFD7

--ADD constraint
ALTER TABLE Products
ADD CONSTRAINT uq_cons default 'Dell' FOR brand;

--chage dataType
ALTER TABLE Products
ALTER COLUMN category varchar(20);

select * from products WHERE category='Electronics';
select * from products WHERE products_price > 40000; 
SELECT * FROM products WHERE stock_quantity BETWEEN 50 AND 150;

select * FROM Products;

