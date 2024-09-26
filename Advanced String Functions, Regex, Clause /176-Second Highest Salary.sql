select max(salary) as SecondHighestSalary
from Employee
where salary !=( select max(salary) from Employee)

-- second highest salary 
-- the subquery first executes and return 300 and the salary has two values 100, 200
-- the main query executes and select max(100,200) -> 200
