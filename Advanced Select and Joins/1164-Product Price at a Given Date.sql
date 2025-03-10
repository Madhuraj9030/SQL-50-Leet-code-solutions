
with cte as(
select product_id, new_price as price, change_date,
dense_rank() over (partition by product_id order by change_date desc) as r
from products 
where change_date<= "2019-08-16" ),
cte1 as (
select product_id, 10 as price
from products
)
select product_id, price
from cte
where r = 1
union 
select product_id, price
from cte1
where product_id  not in (select product_id from cte)