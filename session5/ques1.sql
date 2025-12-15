-------------------- G1_23BCS10193_ShivanshuRanjan_SESSION5 -------------------- 
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(10, 'HR', 'Delhi'),
(20, 'IT', 'Mumbai'),
(30, 'Finance', 'Pune'),
(50, 'Marketing', 'Chennai');

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary) VALUES
(1, 'Akash', 10, 50000),
(2, 'Nisha', 20, 60000),
(4, 'Simran', 30, 70000),
(5, 'Meena', 30, 55000);


SELECT 
    d.DeptName,
    COUNT(e.EmpID) AS EmployeeCount,
    AVG(e.Salary)::numeric(10,0) AS AvgSalary,
    CASE
        WHEN COUNT(e.EmpID) = 0 THEN 'No Employees'
        WHEN AVG(e.Salary) >= 60000 THEN 'High Avg'
        WHEN AVG(e.Salary) >= 50000 THEN 'Medium Avg'
        ELSE 'Low Avg'
    END AS SalaryCategory
FROM Departments d
LEFT JOIN Employees e
ON d.DeptID = e.DeptID
GROUP BY d.DeptName
ORDER BY d.DeptName;
