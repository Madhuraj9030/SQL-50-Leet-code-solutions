select "Low Salary" as Category, count(account_id) accounts_count
from Accounts
where Accounts.income < 20000
union 
select "High Salary" as Category, count(account_id) accounts_count
from Accounts
where Accounts.income > 50000
union
select "Average Salary" as Category, count(account_id) accounts_count
from Accounts
where Accounts.income between 20000 and 50000



# Write your MySQL query statement below
-- with result as (
-- select case 
-- when Accounts.income <20000 then "Low Salary"
-- when Accounts.income>= 20000 and Accounts.income<=50000 then "Average Salary"
-- else "High Salary"
-- end as category
-- from Accounts)

-- select *,case when count(category) is NULL then 0
-- else count(category) 
-- end as accounts_count
-- from result
-- group by category
-- using  the case statement itself we cannot get the record with Average salary as there is no salary to compare so we need to depend on union or building our own table with the and using right join we can comnpare salary 

-- select case 
-- when Accounts.income <20000 then "Low Salary" 
-- end as Category
-- from Accounts
-- union
-- select case 
-- when Accounts.income>= 20000 and Accounts.income<=50000 then "Average Salary"
-- end as Category
-- from Accounts
-- union
-- select if(Accounts.income >50000 ,Accounts.income,0 )as "High Salary"
-- from Accounts 
