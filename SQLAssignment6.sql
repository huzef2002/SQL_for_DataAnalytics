CREATE TABLE supliers(
supplier_id int primary key, 
supplier_name varchar(30), 
contact_person varchar(30), 
email varchar(50)  UNIQUE, 
phone varchar(10), 
address varchar(250), 
city varchar(30), 
country varchar(30), 
products_supplied varchar(30), 
rating float
);

INSERT INTO supliers 
VALUES
(1, 'Dell Suppliers', 'Rajiv Mehta', 'rajiv.mehta@dell.com', '9876543270', 'IT Park, Bangalore', 'Bangalore', 'India', 'Laptops, Desktops', 4.5),
(2, 'Samsung Distributors', 'Priya Nair', 'priya.nair@samsung.com', '9876543271', 'Electronic City, Bangalore', 'Bangalore', 'India', 'Phones, Tablets', 4.7),
(3, 'Apple Authorized', 'Arun Joshi', 'arun.joshi@apple.com', '9876543272', 'MG Road, Mumbai', 'Mumbai', 'India', 'iPhones, MacBooks', 4.8),
(4, 'Sony Suppliers', 'Neha Reddy', 'neha.reddy@sony.com', '9876543273', 'Bandra, Mumbai', 'Mumbai', 'India', 'Audio Equipment', 4.3),
(5, 'Fitbit Distributors', 'Rohan Kumar', 'rohan.kumar@fitbit.com', '9876543274', 'Hitech City, Hyderabad', 'Hyderabad', 'India', 'Wearables', 4.2),
(6, 'HP Partners', 'Sneha Iyer', 'sneha.iyer@hp.com', '9876543275', 'Pune Station, Pune', 'Pune', 'India', 'Printers, Computers', 4.6),
(7, 'LG Suppliers', 'Amit Sharma', 'amit.sharma@lg.com', '9876543276', 'Connaught Place, Delhi', 'Delhi', 'India', 'Monitors, TVs', 4.4),
(8, 'Logitech Distributors', 'Pooja Verma', 'pooja.verma@logitech.com', '9876543277', 'Koregaon Park, Pune', 'Pune', 'India', 'Peripherals', 4.5),
(9, 'TP-Link Distributors', 'Vikram Nair', 'vikram.nair@tplink.com', '9876543278', 'Jayanagar, Bangalore', 'Bangalore', 'India', 'Networking', 4.3),
(10, 'Seagate Partners', 'Meera Joshi', 'meera.joshi@seagate.com', '9876543279', 'Gachibowli, Hyderabad', 'Hyderabad', 'India', 'Storage Devices', 4.7),
(11, 'JBL Suppliers', 'Deepak Reddy', 'deepak.reddy@jbl.com', '9876543280', 'Andheri, Mumbai', 'Mumbai', 'India', 'Audio Systems', 4.4),
(12, 'Mi Distributors', 'Nisha Kumar', 'nisha.kumar@mi.com', '9876543281', 'HSR Layout, Bangalore', 'Bangalore', 'India', 'Mobile Accessories', 4.2),
(13, 'Razer Distributors', 'Sanjay Iyer', 'sanjay.iyer@razer.com', '9876543282', 'Banjara Hills, Hyderabad', 'Hyderabad', 'India', 'Gaming Gear', 4.6),
(14, 'Amazon Suppliers', 'Anita Sharma', 'anita.sharma@amazon.com', '9876543283', 'Powai, Mumbai', 'Mumbai', 'India', 'Various Products', 4.8),
(15, 'Belkin Distributors', 'Mohan Verma', 'mohan.verma@belkin.com', '9876543284', 'Whitefield, Bangalore', 'Bangalore', 'India', 'Cables, Adapters', 4.3),
(16, 'Ikea Suppliers', 'Sunita Nair', 'sunita.nair@ikea.com', '9876543285', 'Jubilee Hills, Hyderabad', 'Hyderabad', 'India', 'Furniture', 4.5),
(17, 'Microsoft Partners', 'Rajesh Joshi', 'rajesh.joshi@microsoft.com', '9876543286', 'Kothrud, Pune', 'Pune', 'India', 'Software, Hardware', 4.7),
(18, 'Intel Distributors', 'Kavita Reddy', 'kavita.reddy@intel.com', '9876543287', 'Thane, Mumbai', 'Mumbai', 'India', 'Processors', 4.9),
(19, 'NVIDIA Partners', 'Anjali Kumar', 'anjali.kumar@nvidia.com', '9876543288', 'Marathahalli, Bangalore', 'Bangalore', 'India', 'Graphics Cards', 4.8),
(20, 'Canon Suppliers', 'Rahul Iyer', 'rahul.iyer@canon.com', '9876543289', 'Madhapur, Hyderabad', 'Hyderabad', 'India', 'Cameras, Printers', 4.4);

exec sp_rename 'supliers', 'supliers_table';
exec sp_rename 'supliers_table', 'supliers';

exec sp_rename 'supliers.supplier_name', 'name', 'column';

ALTER TABLE supliers
ADD AVG_retinh float NOT NULL default(4) ;

ALTER TABLE supliers
DROP COLUMN country ;

ALTER TABLE supliers
ADD CONSTRAINT ind_cons default 'India' for city;

ALTER TABLE supliers 
DROP CONSTRAINT ind_cons ;

ALTER TABLE supliers
ALTER COLUMN city varchar(15);

SELECT * FROM supliers;


SELECT rating, name FROM supliers where name  = 'HP Partners';
UPDATE supliers SET rating = 5 where city = 'Pune'; 