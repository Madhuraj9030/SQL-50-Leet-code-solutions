# Write your MySQL query statement below
update Seat as a
join Seat as b
on a.id= b.id+1
set a.student = b.student,
b .student = a.student;
-- select * from a; 