USE arbaz;  /*USE DATABASE*/

TRUNCATE TABLE students;  /*DELETE DATA*/

ALTER TABLE students
DROP COLUMN email;

INSERT INTO students (id, name)
VALUES 	(4, "Ben 10"),
		(5, "Doraemon"),
		(6, "Shinchan");

ALTER TABLE students 
ADD COLUMN email VARCHAR(75);
        
        
UPDATE students
SET city = "UP", email="ben10@gmail.com"
WHERE id = 4;        


SELECT * FROM students;  /*VIEWING ALL DATA*/

SELECT city
FROM students;


CREATE TABLE employee(
	id INT,
    name VARCHAR(45),
    email VARCHAR(75),
    phone_number INT
);