
select a.employee_id
from Employees as a left join
Employees as b
on b.employee_id = a.manager_id
where a.salary<30000 and b.name is null and b.employee_id is null and a.manager_id is not null
order by a.employee_id
