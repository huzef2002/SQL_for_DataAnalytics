CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT,
    enrollment_date DATE,
    city VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Rahul Sharma', 101, '2024-01-15', 'Mumbai'),
(2, 'Priya Patel', 102, '2024-01-20', 'Delhi'),
(3, 'Amit Kumar', 101, '2024-02-01', 'Mumbai'),
(4, 'Neha Singh', 103, '2024-02-10', 'Bangalore'),
(5, 'Raj Mehta', NULL, '2024-02-15', 'Delhi'),
(6, 'Sonia Verma', 104, '2024-03-01', 'Mumbai'),
(7, 'Vikram Joshi', 105, '2024-03-05', 'Pune'),
(8, 'Anjali Reddy', NULL, '2024-03-10', 'Chennai');


CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(50),
    fee DECIMAL(10,2),
    duration_days INT
);

INSERT INTO Courses VALUES
(101, 'Data Science', 'Dr. Smith', 50000.00, 180),
(102, 'Web Development', 'Prof. Johnson', 35000.00, 120),
(103, 'Mobile App Development', 'Ms. Williams', 40000.00, 150),
(104, 'Cyber Security', 'Mr. Brown', 45000.00, 160),
(105, 'AI & Machine Learning', 'Dr. Davis', 55000.00, 200),
(106, 'Cloud Computing', 'Prof. Miller', 48000.00, 140),
(107, 'Digital Marketing', 'Ms. Wilson', 30000.00, 90);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    payment_status VARCHAR(20),
    amount_paid DECIMAL(10,2)
);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2024-01-16', 'Paid', 50000.00),
(2, 2, 102, '2024-01-21', 'Paid', 35000.00),
(3, 3, 101, '2024-02-02', 'Pending', 25000.00),
(4, 1, 102, '2024-02-05', 'Paid', 35000.00),
(5, 4, 103, '2024-02-12', 'Paid', 40000.00),
(6, 6, 104, '2024-03-02', 'Partial', 20000.00),
(7, 7, 105, '2024-03-06', 'Paid', 55000.00),
(8, 2, 103, '2024-03-08', 'Pending', 0.00),
(9, 9, 101, '2024-03-12', 'Paid', 50000.00);


CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(50),
    specialization VARCHAR(100),
    experience_years INT,
    email VARCHAR(100)
);

INSERT INTO Instructors VALUES
(1, 'Dr. Smith', 'Data Analytics', 10, 'smith@edu.com'),
(2, 'Prof. Johnson', 'Full Stack', 8, 'johnson@edu.com'),
(3, 'Ms. Williams', 'Mobile Tech', 6, 'williams@edu.com'),
(4, 'Mr. Brown', 'Network Security', 12, 'brown@edu.com'),
(5, 'Dr. Davis', 'AI Research', 15, 'davis@edu.com'),
(6, 'Prof. Miller', 'Cloud Architecture', 9, 'miller@edu.com'),
(7, 'Ms. Wilson', 'Marketing Strategy', 7, 'wilson@edu.com'),
(8, 'Mr. Taylor', 'Blockchain', 5, 'taylor@edu.com'); 



 --Q.1]
SELECT s.student_name, c.course_name
FROM Students s
LEFT JOIN Courses c ON  s.course_id = c.course_id

--Q.2]
SELECT s.student_name, c.course_name
FROM Students s
RIGHT JOIN Courses c ON  s.course_id = c.course_id

--Q.3]
SELECT s.student_name, c.course_name, s.course_id,e.course_id, c.course_id
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Data Science'

--Q.4] Display all enrollments with student names and course names
SELECT e.enrollment_id ,s.student_name, c.course_name
FROM Enrollments e
 JOIN Students s ON  e.student_id = s.student_id
 JOIN Courses c ON e.course_id = c.course_id 

--Q.5] Show student name, course name, and instructor name for all enrollments
SELECT e.enrollment_id ,s.student_name, c.course_name, c.instructor
FROM Enrollments e
    JOIN Students s ON  e.student_id = s.student_id
    JOIN Courses c ON e.course_id = c.course_id 
 

--Q.6] List all instructors and the courses they teach (include instructors without courses)
SELECT i.instructor_name , c.course_name FROM Instructors i
    LEFT JOIN Courses c ON i.instructor_name = c.instructor


--Q.7] Find students from Mumbai who have enrolled in courses with fee > 40000
SELECT s.student_name, c.course_name, s.course_id
FROM Students s
    INNER JOIN Enrollments e ON s.student_id = e.student_id
    INNER JOIN Courses c ON e.course_id = c.course_id
WHERE c.fee > 40000 AND s.city = 'Mumbai'

    

--Q.8] Count how many students are enrolled in each course (show 0 for courses with no students)
SELECT 
    c.course_id,
    c.course_name,
    isnull(count(e.student_id), 0) as counted
    
from Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id,c.course_name
ORDER BY counted DESC


--Q.9] Calculate total amount received for each course

SELECT 
    e.course_id,
    c.course_name,
    COUNT(e.enrollment_id) as totaleCount,
    SUM(e.amount_paid) as total_received
     
    
FROM Enrollments e
RIGHT JOIN Courses c ON e.course_id = c.course_id
WHERE 
    e.payment_status = 'Paid'
GROUP BY e.course_id,c.course_name



--Q.10]Find courses where the number of enrollments is more than the average enrollments per course

SELECT 
    course_id, 
    count(student_id) as Enrolment_count
    FROM Enrollments
    group by course_id

    HAVING COUNT(student_id) >( 
        SELECT AVG(Enrolment_count) as avg_enrolment
        FROM (
            SELECT count(student_id) as Enrolment_count
            FROM Enrollments
            group by course_id
        ) as courseCount
    )

SELECT * FROM Enrollments
SELECT * FROM Instructors
SELECT * FROM Courses
SELECT * FROM Students

SELECT * FROM Courses c
INNER JOIN Students s On c.course_id = s.course_id

SELECT * FROM Courses c
LEFT JOIN Students s On c.course_id = s.course_id

SELECT * FROM Courses c
RIGHT JOIN Students s On c.course_id = s.course_id

SELECT * FROM Courses c
FULL OUTER JOIN Students s On c.course_id = s.course_id

SELECT * FROM Courses c
LEFT JOIN Students s On c.course_id = s.course_id
WHERE s.course_id  IS NULL

SELECT * FROM Courses c
RIGHT JOIN Students s On c.course_id = s.course_id
WHERE c.course_id  IS NULL

SELECT * FROM Courses c
FULL OUTER JOIN Students s On c.course_id = s.course_id
WHERE s.course_id  IS NULL OR c.course_id IS NULL

SELECT * FROM Courses c
CROSS JOIN Students s