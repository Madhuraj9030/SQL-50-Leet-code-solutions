
# Write your MySQL query statement below
with shot as(
select person_name,turn, weight,
sum(weight) over (order by turn) as sum1
from Queue)
select person_name
from shot
where sum1= 1000 or sum1<1000
order by turn desc 
limit 1;


-- select a.turn, a.person_id, 
-- sum(a.weight) over (order by turn ) as aad
-- from Queue as a
-- order by a.turn
-- join Queue as b
-- on a.turn = b.turn
-- join Queue as c
-- on b.turn= c.turn
-- -- where a.turn+(b.turn+1)+(c.turn+2) = 1000
-- -- order by a.turn