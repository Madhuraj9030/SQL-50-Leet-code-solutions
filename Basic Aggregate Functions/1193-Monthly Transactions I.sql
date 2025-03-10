# Write your MySQL query statement below
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month
    , country
    , COUNT(*) AS trans_count
    , sum(if(state='approved', 1,0)) as approved_count
    , sum(amount) as trans_total_amount
    , sum(if(state='approved', amount, 0))as approved_total_amount
    
FROM Transactions
GROUP BY month, country
# sum(a.state) as trans_count

#as a
#inner join
#Transactions b
#on 
#a.trans_date = b.trans_date
#group by a.country
