
--  Write your MySQL query statement below
select product_id, year as first_year, quantity, price
from Sales
where (product_id, year) in(select product_id, min(year) from Sales group by product_id)
-- small tricky thing here 
-- where product_id, year in(select product_id, min(year) from Sales group by product_id)
-- if you give the above where condition in place of that you might be eneded up with error because, where condition think that i have to check for only 
-- year in the sub query not the product_id, so to make them combined use brackets.