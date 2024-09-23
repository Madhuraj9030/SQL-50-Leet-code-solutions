select a.product_name,sum(b.unit) as unit
from 
Products as a
inner join 
Orders as b
on a.product_id = b.product_id
where month(b.order_date)=2 and year(b.order_date)=2020
group by a.product_name
having unit>=100