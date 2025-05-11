/*YouTube Channel: Apna College*/
/*Video Link: https://youtu.be/hlGoQC332VM*/

/*GENERAL ORDER FOR QUERIES :-
	SELECT column_name
	FROM table_name
    WHERE conditions
    GROUP BY column_name
    HAVING conditionn
    ORDER BY column_name ASC/DESC;

*/

/*DELETE Students Table*/
DROP TABLE students;


/*CREATING DATABSE*/
CREATE DATABASE college;

/*USING DATABASE*/
USE college;

/*CREATING TABLE*/
CREATE TABLE students (
	RollNo INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(50) NOT NULL
);


/*INSERTING Data into Table*/
INSERT INTO students (rollno, name, marks, grade, city) 
VALUES
(101, "madhav", 304, "C", "DELHI"),
(102, "Suman", 460, "B", "MUMBAI"),
(103, "RAJESH", 334, "C", "BIHAR"),
(104, "Puneet", 545, "A", "DELHI"),
(105, "Ram Pal", 565, "A", "BIHAR"),
(106, "Dharampal", 440, "B", "DELHI");


/*SELECT Whole Table*/
SELECT * FROM students;

/*SElECT table Columns*/
SELECT city, name FROM students;

/*DISTINCT values*/
SELECT DISTINCT CITY FROM students;

/*WHERE Clause*/
SELECT * FROM students WHERE grade = "A";

/*ORDER BY Clause*/
SELECT city FROM students ORDER BY city DESC;
SELECT city FROM students ORDER BY city ASC LIMIT 3;

/*AGGREGATE FUNCTIONS*/
SELECT MAX(marks) FROM students;
SELECT MIN(marks) FROM students;
SELECT COUNT(marks) FROM students;
SELECT AVG(marks) FROM students;
SELECT SUM(marks) FROM students;

/*GROUP BY Clause*/
SELECT city
FROM students
GROUP BY city;

/*******************************************************************************************/
/*PRECTICE QUESTION : Write the Query to Find Average Marks in each city in Ascending ORDER*/
SELECT city, AVG(marks)
FROM students
GROUP BY city
ORDER BY AVG(marks) ASC;

/*********************************************************************************************/
/*PRECTICE QUESTION 2 : Write the Query to Find Average Marks in each city in Ascending ORDER*/
CREATE DATABASE xyz;

USE xyz;

CREATE TABLE customer (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    payment_mode VARCHAR(20) NOT NULL,
	city VARCHAR(20)
);

INSERT INTO customer(customer_id, customer_name, payment_mode, city)
VALUES
(101, "Olivia Barrett", "Netbanking", "Portland"),
(102, "Ethan Sinclair", "Credit Card", "Miami"),
(103, "Maya Hernandez", "Credit Card", "Seattle"),
(104, "Liam Donovan", "Netbanking", "Denver"),
(105, "Sophia Nguyen", "Credit Card", "New Orleans"),
(106, "Caleb Foster", "Debit Card", "Minneapolis"),
(107, "Ava Patel", "Debit Card", "Pheonix"),
(108, "Lucus Carter", "Netbanking", "Boston"),
(109, "Isabella Martinez", "Netbanking", "Nashville"),
(110, "Jackson Brooks", "Credit Card", "Boston");

SELECT payment_mode, COUNT(payment_mode)
FROM customer
GROUP BY payment_mode;

/*********************************************************************************************/
/*PRECTICE QUESTION 2 : Count Number of Students in each city Where MAX marks cross 500*/
USE college;

SELECT * FROM students;

SELECT city, count(name)
FROM students
GROUP BY city
HAVING MAX(marks) > 500;

SELECT city,name,rollno, marks
FROM students
WHERE city = "delhi"
GROUP BY city, name, rollno, marks 
HAVING MAX(marks) >500
ORDER BY marks ASC;


/******************** TABLE RELATED QUERIES *******************/
/***** UPDATE *****/
UPDATE students
SET grade = "E"
WHERE grade = "A";

SELECT * FROM students;

/*FOR OFF SAFE MODE*/
SET SQL_SAFE_UPDATES = 0;
/*FOR ON SAFE MODE*/
SET SQL_SAFE_UPDATES = 1;

UPDATE students 
SET grade = "A"
WHERE grade = "E";


/*********************** UPDATE PRECTICE ********************************/
UPDATE students
SET marks = 0, city = "PUNE"
WHERE rollno = 102;

SELECT * FROM students;
/************************************************************************/
/*********************** DELETE ********************************/
DELETE FROM students;

DELETE FROM students
WHERE marks = 0;

SELECT * FROM students;
/************************************************************************/
/*********************** ALTER ********************************/
/*ADD COLUMN*/
ALTER TABLE students
ADD COLUMN MANAV INT DEFAULT 20000;

/*DELETE COLUMN*/
ALTER TABLE students
DROP COLUMN MANAV;

/*CHANGE TABLE NAME*/
ALTER TABLE student
RENAME students;


/*Rename name column to full_name*/
ALTER TABLE students
CHANGE COLUMN name full_name VARCHAR(50) NOT NULL;

/*Delete all data from table*/
TRUNCATE TABLE students ;

/*Inserting data*/
INSERT INTO students (rollno, full_name, marks, grade, city) 
VALUES
(101, "madhav", 304, "C", "DELHI"),
(102, "Suman", 460, "B", "MUMBAI"),
(103, "RAJESH", 334, "C", "BIHAR"),
(104, "Puneet", 545, "A", "DELHI"),
(105, "Ram Pal", 565, "A", "BIHAR"),
(106, "Dharampal", 440, "B", "DELHI");

/*Delet students where marks is less the 500*/
DELETE from students where marks < 500;

/*delete grade column*/
ALTER TABLE students
DROP COLUMN grade;

SELECT * FROM students;
/**************************************************JOINS IN SQL*****************************************/
/***************INNER JOIN**************/
USE college;

/*Creating First Table*/
CREATE TABLE employee (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

/*Creating second Table*/
CREATE TABLE job (
	id INT PRIMARY KEY,
    job VARCHAR(50)
);

/*Inserting Data*/
INSERT INTO employee (id, name) 
VALUES 
(101, "Manav"),
(102, "Sumit"),
(103, "Casey");

/*Inserting Data*/
INSERT INTO job (id, job) 
VALUES 
(102, "CSS"),
(105, "CPP"),
(103, "Python"),
(107, "JavaScript");

/*Viewing Table*/
SELECT * FROM employee;
SELECT * FROM job;

SELECT * FROM employee 
INNER JOIN job
ON employee.id = job.id;




