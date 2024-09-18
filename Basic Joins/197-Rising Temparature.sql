-- Rising Temparature 
-- Just compare the temparatures of previous date and the the next data if the next date temparature is high then we need to print it in the output 
select t1. id
from Weather t1 , Weather t2
where datediff(t1.recordDate, t2.recordDate) = 1 and t1.temperature > t2.temperature