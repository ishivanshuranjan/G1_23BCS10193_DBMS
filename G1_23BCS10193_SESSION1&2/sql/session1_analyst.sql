-------------------- Shivanshu Ranjan (23BCS10193) --------------------
-- Create table
CREATE TABLE Employee (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary NUMERIC(10,2)
);

-- Insert data
INSERT INTO Employee (FirstName, LastName, Department, Salary)
VALUES
('Shivanshu', 'Ranjan', 'Finance', 60000),
('Tanya', 'Verma', 'HR', 55000),
('Devanshu', 'Ranjan', 'IT', 70000);

-- Create view
CREATE VIEW Employee_View AS
SELECT EmployeeID, FirstName, LastName, Department
FROM Employee;

-- Create role
CREATE ROLE Analyst;
-- Grant SELECT
GRANT SELECT ON Employee_View TO Analyst;

SELECT * FROM Employee_View;