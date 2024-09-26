select customer_id
from Customer
group by customer_id 
having count(distinct product_key) = (select count(product_key) from Product)

-- the below are the queries i have tried and came to conclusion to the above query
-- Write your MySQL query statement below
-- select distinct customer_id, group_concat(product_key)
-- from Customer 
-- group by customer_id
-- 
--  the below code runs for 5 test cases 
-- from Customer a
-- select a.customer_id
-- join Product b
-- on a.product_key = b.product_key
-- group by customer_id
-- having (sum(a.product_key),count(a.product_key)) = (select sum(product_key), count(product_key) from Product)
-- order by customer_id