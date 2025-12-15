-------------------- G1_23BCS10193_ShivanshuRanjan_SESSION6 -------------------- 
CREATE TABLE Persons (
	id INT PRIMARY KEY,
	name VARCHAR(50),
	age INT,
	email VARCHAR(100)
);

INSERT INTO Persons (id, name, age, email) VALUES
(1, 'Rajesh', 28, 'rajesh@gmail.com'),
(2, 'Priya', 25, 'priya@gmail.com'),
(3, 'Suresh', 30, 'rajesh@gmail.com'),
(4, 'Anjali', 24, 'priya@gmail.com');


SELECT 
    id,
    name,
    age,
    CASE
        WHEN id NOT IN (
            SELECT MIN(id)
            FROM Persons
            GROUP BY email
        )
        THEN 'duplicate email'
        ELSE email
    END AS email
FROM Persons
ORDER BY id;
