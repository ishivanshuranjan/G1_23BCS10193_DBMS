-------------------- G1_23BCS10193_ShivanshuRanjan_SESSION3 -------------------- 
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);



CREATE TABLE Enrollments (
    student_id INT,
    course VARCHAR(50)
);


INSERT INTO Student (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO Enrollments (student_id, course) VALUES
(1, 'DBMS'),
(3, 'Java'),
(5, 'Python');


select s.student_id,s.student_name
from Student as s
left outer join Enrollments as e
on s.student_id=e.student_id
where e.student_id is null;