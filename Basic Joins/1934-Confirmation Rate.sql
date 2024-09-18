select  a.user_id, round(avg(case when b.action='confirmed' then 1 else 0 end),2) as confirmation_rate
from 
Signups as a 
left join
Confirmations as b
on a.user_id = b.user_id
group by a.user_id
-- it runs in my sql and didnt run in MS SQL server
-- in the above query we can use iif statement also 