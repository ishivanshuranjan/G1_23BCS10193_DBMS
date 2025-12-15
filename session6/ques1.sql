-------------------- G1_23BCS10193_ShivanshuRanjan_SESSION6 -------------------- 
CREATE TABLE Employees (
    emp_id     INT PRIMARY KEY,
    name       VARCHAR(50),
    dept_id    INT,
    salary     INT
);

CREATE TABLE Departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50)
);

INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(1, 'Asha', 10, 50000),
(2, 'Rohan', 10, 70000),
(3, 'Meera', 20, 40000),
(4, 'Kabir', 20, 55000),
(5, 'Isha', 30, 90000);

INSERT INTO Departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT');

SELECT 
    d.dept_name,
    e.name AS emp_name,
    e.salary,
    da.dept_avg_salary::numeric(20,0)
FROM Employees e
JOIN Departments d
    ON e.dept_id = d.dept_id
JOIN (
    SELECT 
        dept_id,
        AVG(salary) AS dept_avg_salary,
        MAX(salary) AS max_salary
    FROM Employees
    GROUP BY dept_id
) da
ON e.dept_id = da.dept_id
AND e.salary = da.max_salary;
