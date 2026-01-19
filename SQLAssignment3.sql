CREATE TABLE projects (
    project_id int primary key,
    project_name varchar(100),
    description text,
    start_date date,
    end_date date,
    budget int,
    manager_id int,
    status varchar(20),
    client_name varchar(100),
    priority varchar(20)
);

INSERT INTO projects
VALUES
(1, 'home automation','for home automation ', '2023-05-15', '2023-09-20', 250000 , 2001 , 'close', 'ramesh','high'),
(2, ' voting system','voting system for college students', '2023-05-15', '2023-10-20', 350000 , 2002 , 'close', 'kailash','madium'),
(3, 'ecommer platform','making ecommer platform ', '2024-01-15', '2024-06-08', 250000 , 2003 , 'close', 'ramesh','high'),
(4, ' stock dashord','for analysing stock', '2024-05-15', '2024-10-20', 350000 , 2004 , 'close', 'sunil','high'),
(5, 'task managment','for managing task', '2023-05-15', '2024-01-20', 250000 , 2005 , 'close', 'rohit','madium'),
(6, ' AI image','making a ai image for fun', '2025-01-15', '2025-09-20', 350000 , 2006 , 'close', 'kailash','high'),
(7, 'weather dashbord','forcasting and weather analysing', '2023-01-15', '2023-09-08', 250000 , 2007 , 'close', 'ramesh','low'),
(8, 'language translater','for translation', '2023-05-15', '2023-09-20', 350000 , 2008 , 'close', 'kailash','high'),
(9, 'home automation','for home automation ', '2023-05-15', '2023-09-20', 250000 , 2009 , 'close', 'ramesh','high'),
(10, ' voting system','voting system for college students', '2023-05-15', '2023-10-20', 350000 , 2010 , 'close', 'kailash','madium'),
(11, 'ecommer platform','making ecommer platform ', '2024-01-15', '2024-06-08', 250000 , 2011 , 'close', 'ramesh','high'),
(13, ' stock dashord','for analysing stock', '2024-05-15', '2024-10-20', 350000 , 2012 , 'close', 'sunil','high'),
(14, 'task managment','for managing task', '2023-05-15', '2024-01-20', 250000 , 2013 , 'close', 'rohit','madium'),
(15, ' AI image','making a ai image for fun', '2025-01-15', '2025-09-20', 350000 , 2014, 'close', 'kailash','high'),
(16, 'weather dashbord','forcasting and weather analysing', '2023-01-15', '2023-09-08', 250000 , 2015, 'close', 'ramesh','low'),
(17, 'language translater','for translation', '2023-05-15', '2023-09-20', 350000 , 2016, 'close', 'kailash','high'),
(18, 'home automation','for home automation ', '2023-05-15', '2023-09-20', 250000 , 2017, 'close', 'ramesh','high'),
(19, ' voting system','voting system for college students', '2023-05-15', '2023-10-20', 350000 , 2018, 'close', 'kailash','madium'),
(20, 'ecommer platform','making ecommer platform ', '2024-01-15', '2024-06-08', 250000 , 2019, 'close', 'ramesh','high');

--change table name 
exec sp_rename 'projects', 'Projects';

--change column name 
exec sp_rename 'Projects.status', 'Pro_status', 'column';

--add column 
ALTER TABLE Projects
ADD AVG_budget int not null default(25000) ;

--delete columns
ALTER TABLE Projects
DROP COLUMN AVG_budget;

--add constraint
ALTER TABLE Projects
ADD CONSTRAINT bg_cons check(budget > 20000);

--delet constraint
ALTER TABLE Projects
DROP CONSTRAINT DF__Projects__AVG_bu__47FBA9D6;

--chage datatype
ALTER TABLE Projects
ALTER COLUMN priority varchar(20);

SELECT * from Projects where manager_id between 2009 AND 2019
SELECT * FROM Projects WHERE priority='high'


select * from Projects

EXEC sp_rename 'Projects.project_name' , 'pro_name' , 'column'


ALTER TABLE Projects
ADD avrage int not null ;

ALTER TABLE Projects 
ADD CONSTRAINT unq_cons unique(manager_id)

ALTER TABLE Projects
ALTER COLUMN client_name varchar(15)


select * from Projects

SELECT ABS(-225) as absValues;
SELECT AVG(budget) as avg_budget FROM Projects;
SELECT MAX(budget) as MAX_budget FROM Projects
SELECT MIN(budget) as MIN_budget FROM Projects
SELECT CEILING(55.25) as con_ceiling
SELECT FLOOR(55.25) as con_floor
SELECT COUNT(project_id) as Total_projects FROM Projects
SELECT RAND() as random
SELECT ROUND(2.5499, 1) as Round
SELECT SQRT(64)
SELECT SQUARE(106)

SELECT CURRENT_TIMESTAMP
SELECT getdate()
SELECT getutcdate()
SELECT ISDATE('2202-05-31') 

SELECT DATEADD(MONTH, 1, '2002-05-15')
SELECT DATEADD(YEAR, 2, '2002-05-15')
SELECT DATEADD(QUARTER, 1, '2002-05-15')
SELECT DATEADD(HOUR, 2, '2002-05-15')
SELECT DATEADD(MINUTE, 2, '2002-05-15')
SELECT DATEADD(SECOND, 2, '2002-05-15')
SELECT DATEADD(DAYOFYEAR, 2, '2002/05/15')
SELECT DATEADD(WEEKDAY ,5, getdate())

SELECT DATEDIFF(month,'2024/05/20' ,getdate())
SELECT DATEDIFF(year,'2024/05/20' ,getdate())
SELECT DATEDIFF(quarter,'2024/05/20' ,getdate())
SELECT DATEFROMPARTS(2018,06,15)
SELECT DATENAME(month ,'2002-09-15')
SELECT DATENAME(YEAR,'2002-09-15')
SELECT DATENAME(QUARTER,'2002-08-15')

SELECT * FROM Projects WHERE budget BETWEEN 250000 AND 300000

SELECT MAX(description) FROM Projects -- this is only works on numbers

-- HAVING CALUSE
SELECT budget, COUNT(project_id) FROM Projects
GROUP BY budget
HAVING budget >= 250000 



