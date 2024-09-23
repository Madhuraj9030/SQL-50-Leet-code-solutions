select user_id, (count(case when follower_id =0 then 1 else follower_id end) )as followers_count
from 
Followers
group by user_id
order by user_id
