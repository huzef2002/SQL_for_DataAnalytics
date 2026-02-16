
---------------------------CASE WITH INSERT-----------------
SELECT * FROM Courses

INSERT INTO Courses (course_id, course_name, instructor, fee, duration_days)
VALUES( 108 ,'Data Science', 'Dr Smith', 
	CASE 
		WHEN    1000 >2000  THEN  '50000'
		ELSE '5000'
	END,
		180
)

---------------------CASE WITH UPDATE---------------

SELECT * FROM Customers

UPDATE Customers SET country =
CASE 
	WHEN status = 'Active' THEN  'USA'
	ELSE 'india'
END


----------------------CASE WITH DELLETE-------------
SELECT * FROM Courses
DELETE Courses WHERE 
CASE 
	WHEN course_id > 107 THEN 1
	ELSE 0
END = 1 ; 


SELECT * FROM Courses

INSERT INTO Courses 
VALUES(108,'web dev', 'Prof.Johnson', 350000, 
CASE	
	WHEN 100>50 THEN 120
	ELSE 0
END
)

UPDATE Courses SET course_name = 
CASE	
	WHEN instructor = 'Prof.Johnson' THEN 'Web Development'
	WHEN instructor = 'Prof. Johnson' THEN 'Web Development'
	WHEN instructor = 'Dr. Smith' THEN 'Markiting'
	WHEN instructor = 'Dr. Davis' THEN 'Data Analytics'
	ELSE 'Full Stack'
END

-------------------------------------------------------VEIW----------------------------------------------
CREATE VIEW VW_Courses
AS
SELECT * FROM Courses

-----------------DROP VIEW---------------
DROP VIEW VW_Courses

---------------See Inside View--------
EXEC sp_helptext VW_Courses

--------------Fetch Multipale tables---------
CREATE VIEW VW_Course_Customers
AS
SELECT * FROM Courses
jOIN Customers ON  course_id = customer_id

-----------refreshview----------------
EXEC sp_refreshview VW_Courses

--------------WITH SCHEMABINDING----------
CREATE VIEW VW_Courses
WITH SCHEMABINDING
AS
SELECT * FROM Courses

SELECT * FROM VW_Course_Customers
SELECT * FROM VW_Courses
UPDATE VW_Course_Customers SET first_name='Syber' WHERE customer_id = 103


------------------------------------------------------VARIABLE-----------------------------------
DECLARE
@var1 int 

SET @var1 = 2

SELECT @var1 as firstVar


-----------------------------------------------STORED PROCEDURE---------------------------------------------------


CREATE PROCEDURE SP_Courses
AS
Begin
SELECT * FROM Courses 
END

EXEC SP_Courses


DROP PROC SP_Courses

ALTER PROC SP_Courses
AS 
BEGIN
SELECT * FROM Courses WHERE duration_days > 90
SELECT * FROM Courses WHERE duration_days > 150
END

---------------With default Value-----------------
CREATE  PROC SP_Courses
@Duration int = 150
AS
BEGIN
SELECT * FROM Courses WHERE duration_days > @Duration 
END

EXEC SP_Courses 90

--------------encryption Procedure----------------
CREATE PROCEDURE SP_Courses_Encryption
WITH encryption
AS
Begin
SELECT * FROM Courses 
END


exec sp_helptext SP_Courses