select *
from 
Cinema
where mod(id, 2)=1 and description !='boring'
order by rating DESC


-- select *
-- from 
-- Cinema
-- where id%2=1 and description !='boring'
-- order by rating DESC
-- __________________________________________
-- select *
-- from 
-- Cinema
-- where mod(id, 2)=1 and description <>'boring'
-- order by rating DESC

