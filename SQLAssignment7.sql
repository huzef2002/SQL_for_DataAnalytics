CREATE TABLE  departments(
department_id int primary key, 
department_name varchar(50),
manager varchar(50), 
location varchar(30), 
budget decimal(10,2) , 
established_date date, 
email varchar(30), 
phone varchar(10), 
employee_count int, 
department_head varchar(30));

INSERT INTO departments 
VALUES 
(1, 'Information Technology', 'Raj Sharma', 'Floor 5, Building A', 5000000, '2010-01-15', 'it@company.com', '9876543250', 50, 'CTO'),
(2, 'Human Resources', 'Priya Patil', 'Floor 3, Building A', 2000000, '2010-02-20', 'hr@company.com', '9876543251', 15, 'HR Head'),
(3, 'Sales', 'Amit Verma', 'Floor 2, Building B', 3000000, '2010-03-10', 'sales@company.com', '9876543252', 25, 'Sales Head'),
(4, 'Marketing', 'Neha Singh', 'Floor 4, Building A', 2500000, '2011-04-05', 'marketing@company.com', '9876543253', 20, 'CMO'),
(5, 'Finance', 'Sandeep Jain', 'Floor 1, Building A', 4000000, '2010-05-12', 'finance@company.com', '9876543254', 18, 'CFO'),
(6, 'Research & Development', 'Pooja Reddy', 'Floor 6, Building C', 6000000, '2012-06-18', 'rnd@company.com', '9876543255', 35, 'R&D Head'),
(7, 'Customer Support', 'Rahul Kumar', 'Floor 1, Building B', 1500000, '2011-07-22', 'support@company.com', '9876543256', 30, 'Support Head'),
(8, 'Operations', 'Anjali Desai', 'Floor 2, Building A', 2800000, '2010-08-30', 'operations@company.com', '9876543257', 22, 'COO'),
(9, 'Quality Assurance', 'Vikram Malhotra', 'Floor 3, Building B', 2200000, '2013-09-14', 'qa@company.com', '9876543258', 28, 'QA Head'),
(10, 'Product Management', 'Sneha Gupta', 'Floor 4, Building B', 3200000, '2012-10-25', 'product@company.com', '9876543259', 16, 'Product Head'),
(11, 'Business Development', 'Rohan Joshi', 'Floor 5, Building B', 3500000, '2011-11-08', 'business@company.com', '9876543260', 12, 'BD Head'),
(12, 'Legal', 'Meera Iyer', 'Floor 1, Building C', 1800000, '2014-12-12', 'legal@company.com', '9876543261', 8, 'Legal Head'),
(13, 'Administration', 'Arun Nair', 'Floor 2, Building C', 1200000, '2010-01-20', 'admin@company.com', '9876543262', 10, 'Admin Head'),
(14, 'Training & Development', 'Kavita Menon', 'Floor 6, Building A', 900000, '2015-02-28', 'training@company.com', '9876543263', 6, 'Training Head'),
(15, 'Infrastructure', 'Deepak Shah', 'Floor 7, Building A', 4500000, '2013-03-15', 'infra@company.com', '9876543264', 25, 'Infra Head'),
(16, 'Security', 'Nisha Rao', 'Floor 8, Building A', 800000, '2016-04-10', 'security@company.com', '9876543265', 15, 'Security Head'),
(17, 'Procurement', 'Sanjay Mehta', 'Floor 3, Building C', 1900000, '2012-05-05', 'procurement@company.com', '9876543266', 14, 'Procurement Head'),
(18, 'Logistics', 'Anita Pillai', 'Floor 4, Building C', 2100000, '2014-06-20', 'logistics@company.com', '9876543267', 18, 'Logistics Head'),
(19, 'Public Relations', 'Mohan Chopra', 'Floor 5, Building C', 1600000, '2017-07-08', 'pr@company.com', '9876543268', 9, 'PR Head'),
(20, 'Internal Audit', 'Sunita Bose', 'Floor 6, Building C', 1400000, '2015-08-12', 'audit@company.com', '9876543269', 7, 'Audit Head');

exec sp_rename 'departments', 'com_departments';

exec sp_rename 'com_departments.manager', 'dep_manager' , 'column';

ALTER TABLE com_departments
ADD age varchar(20) not null default ('male') ;

ALTER TABLE com_departments
DROP COLUMN age;

ALTER TABLE com_departments
ADD CONSTRAINT count_con check(employee_count > 5) ;

ALTER TABLE com_departments
DROP constraint DF__com_departm__age__5FD33367;

ALTER TABLE com_departments
ALTER COLUMN budget int ;

--update data 
UPDATE com_departments SET budget =560000 WHERE department_id = 1 ;



SELECT * FROM com_departments;

