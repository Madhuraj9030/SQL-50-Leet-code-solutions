


select a.name
from Employee as a
inner join 
Employee as b
on 
a.id = b.managerId 
group by b.managerId
having count(b.managerId)>=5