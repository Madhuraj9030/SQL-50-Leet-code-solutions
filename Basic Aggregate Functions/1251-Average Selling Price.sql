select a.product_id, IF(round(sum(b.units*a.price) /sum(b.units),2)>0,round(sum(b.units*a.price) /sum(b.units),2) ,0) as average_price
from  
Prices as a
left join
UnitsSold as b
on 
a.product_id = b.product_id and b.purchase_date between a.start_date and a.end_date
group by a.product_id