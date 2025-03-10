# Write your MySQL query statement below
-- select pid, lat, lon
-- from insurance 
-- where pid = select pid from insurance where 
#As iam trying to do the problem from bottom where it can eliminate the records with similar pairs of lat and lon using group by then i need to create same for the 2nd step to
select round(sum(tiv_2016),2) as tiv_2016
from insurance
where (lat, lon) in (
    select lat, lon
    from insurance 
    group by lat, lon
    having count(*) =1) 
    and tiv_2015 in
(select tiv_2015
from insurance
group by tiv_2015
having count(*) >1)

-- select round(sum(tiv_2016),2) as tiv_2016
-- from shot2