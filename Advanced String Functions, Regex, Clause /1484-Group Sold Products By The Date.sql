select sell_date, count(distinct product) as num_sold, group_concat( Distinct product order by product) as products
from Activities
group by sell_date

-- group_concat() it is the only function in sql to concat the values in a multiple rows to single row