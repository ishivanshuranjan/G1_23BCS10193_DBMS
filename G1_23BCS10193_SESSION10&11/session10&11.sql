-- ------------------ G1_23BCS10193_ShivanshuRanjan_SESSION9&10 -------------------- 
-- q1
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50)
);

INSERT INTO products (product_id, product, category) VALUES
(1, 'LAPTOP', 'ELECTRONICS'),
(2, 'SMARTPHONE', 'ELECTRONICS'),
(3, 'TABLETS', 'ELECTRONICS'),
(9, 'PRINTER', 'ELECTRONICS'),
(4, 'HEADPHONES', 'ACCESSORIES'),
(5, 'SMARTWATCH', 'ACCESSORIES'),
(6, 'KEYBOARD', 'ACCESSORIES'),
(7, 'MOUSE', 'ACCESSORIES'),
(8, 'MONITOR', 'ACCESSORIES');

SELECT * FROM PRODUCTS

SELECT
    ROW_NUMBER() OVER (
        PARTITION BY category
        ORDER BY product_id DESC
    ) AS product_id,
    product,
    category
FROM products
ORDER BY category desc, product_id;




-- q2
CREATE TABLE customers (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);

INSERT INTO customers (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

WITH cte AS (
    SELECT
        id,
        email,
        ROW_NUMBER() OVER (
            PARTITION BY email
            ORDER BY id
        ) AS rn
    FROM customers
)
DELETE FROM customers
WHERE id IN (
    SELECT id
    FROM cte
    WHERE rn > 1
);

select * from customers;




-- q3
CREATE TABLE table_a (
    empid INT,
    ename VARCHAR(50),
    salary INT
);

CREATE TABLE table_b (
    empid INT,
    ename VARCHAR(50),
    salary INT
);

INSERT INTO table_a (empid, ename, salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO table_b (empid, ename, salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);

WITH combined AS (
    SELECT empid, ename, salary
    FROM table_a
    UNION ALL
    SELECT empid, ename, salary
    FROM table_b
),
cte AS (
    SELECT
        empid,
        ename,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY empid
            ORDER BY salary
        ) AS rn
    FROM combined
)
SELECT empid, ename, salary
FROM cte
WHERE rn = 1
ORDER BY empid;
