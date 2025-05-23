/*Database Creation*/
CREATE DATABASE arbaz;

/*Delete Database*/
DROP DATABASE students;

/*Using Database*/
USE arbaz;


/*Create Table*/
CREATE TABLE students(
	id INT,
    name VARCHAR(35),
    city VARCHAR(30)
);


/*Insert Data into Table*/
/*Single Entry*/
INSERT INTO students VALUES 
(1, "Ben 10", "Bihar");


/*Multiple Entry*/
INSERT INTO students VALUES
(2, "Shinchan", "UP"),
(3, "Doraemon", "Noida");


/*Insert As Per Columns*/
INSERT INTO students (id, name) VALUES
(4, "GWEN"),
(5, "Spiderman");


/*Change Table name*/
RENAME TABLE students TO employees;
RENAME TABLE employees TO students;


/*Delete Table*/
DROP TABLE students;


/*Adding new Column in Table*/
ALTER TABLE students
ADD COLUMN email VARCHAR(75);


/*REMOVE new Column in Table*/
ALTER TABLE students
DROP COLUMN email;


/*Rename Column Name*/
ALTER TABLE students
RENAME COLUMN email TO Phone_Number;


/*Modify Column Datatype and Constraints*/
ALTER TABLE students
MODIFY COLUMN phone_number INT;


/*Change Column Position*/
/*After Specific Column*/
ALTER TABLE students
MODIFY phone_number INT
AFTER name;


/*at First*/
ALTER TABLE students
MODIFY phone_number INT
FIRST;


/*ALTER DATABASE db_name READ ONLY = 0*/
ALTER DATABASE arbaz READ ONLY = 0;
SET SQL_SAFE_UPDATES = 0;


/*Updating Table Data*/
/*Single update*/
UPDATE students
SET city = "Haryana"
WHERE id = 5;


/*Multiple Update*/
UPDATE students
SET city = "Haryana",
	name = "Hagimaru"
WHERE id = 5;


/*Delete Row in Table*/
DELETE FROM students
WHERE city = 'Haryana';


/*Delete specific column Data*/
UPDATE students
SET city = NULL
WHERE id = 2;


/*Commit*/
SET AUTOCOMMIT = OFF;
/*After AutoCommit = off our data doesn't save automatically, we have to save mannually*/

COMMIT;
/*Commit Every time when you want to set Safe-Point*/

ROLLBACK;
/*After Accidenly applying wrong query, we have to ROLLBACK to the Last-Commit*/


/*DATES*/
/*Create Date Table*/
CREATE TABLE test(
	my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);

/*Inserting Data in Test Table*/
INSERT INTO test VALUES(
	CURRENT_DATE(), CURRENT_TIME(), NOW()
);

/*Insert NULL values*/
INSERT INTO test VALUES(
	CURRENT_DATE() + 1, NULL, NULL
);

/*UNIQUE Constraint*/
ALTER TABLE students
ADD CONSTRAINT 
UNIQUE (city);

/*DROP Constraint of Column*/
ALTER TABLE students
DROP CONSTRAINT city;

/*NOT NULL Constraint*/
ALTER TABLE students
MODIFY name VARCHAR(30) NOT NULL;


SELECT * FROM test;

SELECT * FROM students;


/*PRIMARY KEY and FOREIGN KEY*/
/*Creating First Table*/
CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

/*Inserting Values in customer_table*/
INSERT INTO customers (first_name, last_name) VALUES 
("Ravi", "Kumar"),
("Suraj", "Yadav"),
("Babu", "Rao");

/*Creating Second Table*/
CREATE TABLE transctions (
	transction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(3, 2),
	customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

/*Inserting Values in transctions_table*/
INSERT INTO transctions (amount, customer_id) VALUES 
(5.24, 2),
(7.25, 1),
(3.79, 3),
(2.99, 2);


DELETE FROM customer
WHERE customer_id = 2;

/*SHOW tables*/
SELECT * FROM customers;
SELECT * FROM transctions;



/*JOINS*/
/*INNER JOIN*/
SELECT *
FROM customers
INNER JOIN transctions
ON customers.customer_id = transctions.customer_id;

/*INNER JOIN with custom columns*/
SELECT customers.customer_id, customers.first_name, customers.last_name, transctions.transction_id
FROM customers
INNER JOIN transctions
ON customers.customer_id = transctions.customer_id;


/*LEFT Join*/
SELECT * FROM customers
LEFT JOIN transctions
ON customers.customer_id = transctions.customer_id;

/*LEFT JOIN with custom columns*/
SELECT customers.customer_id, customers.first_name, customers.last_name, transctions.transction_id
FROM customers
LEFT JOIN transctions
ON customers.customer_id = transctions.customer_id;


/*RIGHT JOIN*/
SELECT * FROM customers
RIGHT JOIN transctions
ON customers.customer_id = transctions.customer_id;

/*RIGHT JOIN with custom columns*/
SELECT customers.customer_id, customers.first_name, customers.last_name, transctions.transction_id
FROM customers
RIGHT JOIN transctions
ON customers.customer_id = transctions.customer_id;


/*FULL JOIN*/
SELECT *
FROM customers
LEFT JOIN transctions 
ON customers.customer_id = transctions.customer_id

UNION

SELECT *
FROM customers
RIGHT JOIN transctions 
ON customers.customer_id = transctions.customer_id;


/*FORMULAS*/
/*COUNT()*/
SELECT COUNT(customer_id)
FROM customers;

/*COUNT() with Alias (AS)*/
SELECT COUNT(customer_id) AS "Today's count"
FROM customers;


/*MAX*/
SELECT MAX(amount) AS MAXIMUM 
FROM transctions;


/*MIN*/
SELECT MIN(amount) AS "MINIMUM AMOUNT"
FROM transctions;


/*AVG*/
SELECT AVG(amount) AS "AVERAGE AMOUNT"
FROM transctions;


/*CONCAT*/
SELECT CONCAT(first_name, " ", last_name) AS "Full Name"
FROM customers;


/*WILD CARD OPERATOR*/
/* % */
SELECT * FROM customers
WHERE first_name LIKE "s%";

/* _ */
SELECT * FROM transctions
WHERE amount LIKE "_._9";	

/* _ */
SELECT * FROM customers
WHERE first_name LIKE "_h_bh__";	
/* _ */
SELECT * FROM customers
WHERE first_name LIKE "s__b%";	


/* LIMIT CLAUSE*/
SELECT * FROM customers
LIMIT 2, 1;


/*SELF JOIN*/
SELECT * FROM customers AS A
JOIN customers AS B
ON A.customer_id = B.customer_id;


/*Views*/
CREATE VIEW employees_view AS
SELECT first_name, last_name
FROM customers;

SELECT * FROM employees_view;


/*INDEX*/
SHOW INDEXES FROM customers;

/*CREATE INDEX*/
CREATE INDEX last_name_idx
ON customers(last_name);


/*Create Multi-column index*/
CREATE INDEX multi_col_index
ON customers(last_name, first_name);

/*Drop Index*/
ALTER TABLE customers
DROP INDEX last_name_idx;


/*Sub-Queries*/
/*CREATING TABL AND INSERTING DATA*/
CREATE TABLE employees (
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	hourly_pay DECIMAL(5,2),
	job VARCHAR(20),
	hire_date DATE,
	supervisor_id INT	
);

INSERT INTO employees (first_name, last_name, hourly_pay, job, hire_date, supervisor_id) VALUES 
("Eugene", "Krabs", 25.50, "manager", '2023-01-02', NULL),
("Squidward", "Tentacles", 15.00, "cashier", '2023-01-03', 5),
("Spongebob", "Squarepants", 12.50, "cook", '2023-01-04', 5),
("Patrik", "Star", 12.50, "cook", '2023-01-05', 5),
("Sandy", "Cheeks", 17.25, "asst. manager", '2023-01-06', 1),
("Sheldon", "Plankton", 10.00, "manager", '2023-01-07', 5);

/*Sub-Queries*/
SELECT first_name, last_name, hourly_pay, (SELECT AVG(hourly_pay) FROM employees)
FROM employees;



SELECT * FROM transctions;
SELECT * FROM customers;