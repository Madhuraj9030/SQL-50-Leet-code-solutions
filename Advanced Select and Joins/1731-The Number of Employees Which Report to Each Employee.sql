-- select b.employee_id, b.name, count(a.reports_to) as reports_count, round(avg(a.age)) as average_age
-- from 
-- Employees as a 
-- left join 
-- Employees as b 
-- on 
-- a.reports_to = b.employee_id 
-- group by b.name
-- having reports_count>0
-- order by b.employee_id

SELECT 
  mgr.employee_id, 
  mgr.name, 
  COUNT(emp.employee_id) AS reports_count, 
  ROUND(AVG(emp.age)) AS average_age 
FROM 
  employees emp 
  INNER JOIN employees mgr 
  ON 
  emp.reports_to = mgr.employee_id 
GROUP BY 
  employee_id 
ORDER BY 
  employee_id