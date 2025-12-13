-------------------- G1_23BCS10193_ShivanshuRanjan_SESSION2 -------------------- 
CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT
);
INSERT INTO employee (emp_name, salary) VALUES
('Alice', 90000),
('Bob', 80000),
('Charlie', 70000),
('David', 80000),
('Eva', 60000),
('Frank', 50000),
('Grace', 70000);
CREATE OR REPLACE FUNCTION nth_highest_salary(n INT)
RETURNS INT AS $$
BEGIN
    RETURN (
        SELECT DISTINCT salary
        FROM employee
        ORDER BY salary DESC
        OFFSET n-1 LIMIT 1
    );
END;
$$ LANGUAGE plpgsql;
SELECT nth_highest_salary(3);
