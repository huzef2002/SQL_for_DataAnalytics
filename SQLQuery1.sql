create database first_sql ; 

use first_sql;

CREATE TABLE employee(
id int primary key,
name varchar(50) not null,
email varchar(50) unique,
salary int NOT NULL,
);

INSERT INTO employee
values( 2,'samir','samiur7002@gmail.com',20000),
( 3,'jabir','janir5002@gmail.com',10000),
( 4,'zahir','zahir001@gmail.com',15000),
( 5,'umair','umair004@gmail.com',18000),
( 6,'qalim','kalim125@gmail.com',17000);


select * from employee;

