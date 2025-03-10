# Write your MySQL query statement below
-- select datediff("2016-03-01", "2016-03-02");
-- select  datediff(even_date, event_date)
-- from Activity;
-- a.event_date, b.event_date,
-- a.player_id,  datediff(a.event_date, b.event_date)
-- a.player_id, round((count( a.player_id)/(select count(distinct player_id)from activity)),2) as fraction

-- where datediff(a.event_date, b.event_date)=1, countx= (select distinct count(player_id) from Activity);
-- -------------------------------------------------------------------------------------
-- select round((count(a.player_id)/(select count(distinct player_id)from activity)),2) as fraction
-- from Activity as a
-- inner join Activity as b
-- on a.player_id = b.player_id
-- where datediff(a.event_date, b.event_date) =1 
-- ;
-- --------------------------------------------------------------------------------------
-- a.player_id, b.player_id,
-- select round(sum(datediff( a.event_date, b.event_date)=1)/count(distinct b.player_id),2) as fraction
-- from Activity as a 
-- inner join Activity as b
-- on a.player_id = b.player_id;
with ranked as(
   select  player_id,event_date,rank() over (partition by player_id order by event_date) as rankd,datediff(lead(event_date) over (partition by player_id order by event_date),event_date) as df
   from Activity
)
-- rank() over (partition by player_id order by event_date) as 
-- datediff(lead(event_date) over (partition by player_id order by event_date),event_date) as 
--  as lead_date,
-- event_date, rankd,df
-- round((count(player_id)/(select count(distinct player_id)from activity)) as fraction
select round((count(player_id)/ (select count(distinct player_id)   from activity) ),2) as fraction
from ranked
where rankd =1 and df=1;

