# Write your MySQL query statement below

/*
Input: 
Activity table:
+------------+------------+---------------+-----------+
| machine_id | process_id | activity_type | timestamp |
+------------+------------+---------------+-----------+
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.520     |
| 0          | 1          | start         | 3.140     |
| 0          | 1          | end           | 4.120     |
| 1          | 0          | start         | 0.550     |
| 1          | 0          | end           | 1.550     |
| 1          | 1          | start         | 0.430     |
| 1          | 1          | end           | 1.420     |
| 2          | 0          | start         | 4.100     |
| 2          | 0          | end           | 4.512     |
| 2          | 1          | start         | 2.500     |
| 2          | 1          | end           | 5.000     |
+------------+------------+---------------+-----------+
Output: 
+------------+-----------------+
| machine_id | processing_time |
+------------+-----------------+
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |
+------------+-----------------+
Explanation: 
There are 3 machines running 2 processes each.
Machine 0's average time is ((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894
Machine 1's average time is ((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995
Machine 2's average time is ((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456

*/
select t1. machine_id,t1.process_id, t1.activity_type, t2.activity_type, t2.timestamp, t1.timestamp 
from Activity as t1
join 
Activity as t2
on t1.machine_id = t2.machine_id and t1.process_id = t2.process_id
and t1.activity_type = 'start' and t2. activity_type = 'end'
/*
| machine_id | process_id | activity_type | activity_type | timestamp | timestamp |
| ---------- | ---------- | ------------- | ------------- | --------- | --------- |
| 0          | 0          | start         | end           | 1.52      | 0.712     |
| 0          | 1          | start         | end           | 4.12      | 3.14      |
| 1          | 0          | start         | end           | 1.55      | 0.55      |
| 1          | 1          | start         | end           | 1.42      | 0.43      |
| 2          | 0          | start         | end           | 4.512     | 4.1       |
| 2          | 1          | start         | end           | 5         | 2.5       |
*/

-- this query converts the table having mentioned columns as it has two different time stamps with start and end having process_id, machine_id
-- so, further chnages to the query based on the desired output, it changes to the below mentioned query 
select t1. machine_id, round(avg(t2.timestamp- t1.timestamp),3) as processing_time
from Activity as t1
join 
Activity as t2
on t1.machine_id = t2.machine_id and t1.process_id = t2.process_id
and t1.activity_type = 'start' and t2. activity_type = 'end'
group by machine_id
-- the output looks like this 
/*
_______________________________
| machine_id | processing_time |
| ---------- | --------------- |
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |
|______________________________|
*/
