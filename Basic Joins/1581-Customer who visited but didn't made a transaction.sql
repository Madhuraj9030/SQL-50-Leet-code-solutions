select a.customer_id, sum(case when b.visit_id is null then 1 else 0 end) as count_no_trans
from 
Visits as a 
left join 
Transactions as b
on a.visit_id = b.visit_id
group by a.customer_id
having count_no_trans >0