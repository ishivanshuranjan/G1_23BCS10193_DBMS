-------------------- Shivanshu Ranjan (23BCS10193) --------------------
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    select max(salary)  
    from  ( select salary, dense_rank()
     over(order by salary desc) as rnk
     from employee
     ) t
     where rnk=N
  );
END
