# Write your MySQL query statement below
with shot as(
select requester_id r
from RequestAccepted
union all
select accepter_id r
from RequestAccepted
)
select r  id, count(r) num
from shot 
group by 1
order by 2 desc
limit 1

