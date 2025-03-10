# Write your MySQL query statement below
-- select customer_id, delivery_id, datediff(customer_pref_delivery_date, order_date) as dif, 
-- from Delivery
-- where  datediff(customer_pref_delivery_date, order_date)=0 
#having dif =0
#datediff(customer_pref_delivery_date,order_date ) as dif

#the question is some what tricky 
#first thing we need to find the first orders of each customer and also this order must be in earlier date 
#
with ranked as(
select customer_id, order_date, customer_pref_delivery_date as pref, 
dense_rank() over( partition by customer_id order by order_date) as dr,
datediff(customer_pref_delivery_date,order_date) as dd
from Delivery) 
select round((count(customer_id)/(select count(distinct customer_id) from Delivery))*100,2)
as immediate_percentage
from ranked 
where dr =1 and dd=0;