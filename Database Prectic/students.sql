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
