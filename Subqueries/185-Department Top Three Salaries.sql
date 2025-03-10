# Write your MySQL query statement below
#i have written the query based on only the departments i.e; sales, IT and i didnt think much about it so after submitted i got 
-- with cte1 as (
-- select a.name Employee, a.salary Salary, b.name Department, b.id dept_id
-- from employee a
-- join department b
-- on a.departmentid = b.id
-- order by 3 asc, 2 desc),
-- cte2 as (
--     select Employee, Salary, Department,dense_rank()
-- over ( order by salary desc) as d
--     from cte1
--     where dept_id = 1
-- ), cte3 as 
-- (
--     select  Employee, Salary, Department, dense_rank()
-- over ( order by salary desc) as d
--     from cte1
--     where dept_id =2
-- )
-- select  Department, Employee, Salary
-- from cte2 
-- where d<4
-- union 
-- select  Department,Employee, Salary
-- from cte3
-- where d<4
with cte as (
select b.name  Department, a.name Employee, a. Salary
from Employee a
join Department b
on a.departmentid = b.id
),
cte1 as(
select *, dense_rank() over(partition by Department order by Salary desc)  as r
from cte )
select Department, Employee, Salary
from cte1
where r<4
