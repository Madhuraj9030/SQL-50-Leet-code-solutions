# Write your MySQL query statement below
-- select a.movie_id,c.title,a.rating,a.user_id, b.name
-- from MovieRating as a
-- join users as b
-- on a.user_id = b.user_id
-- join Movies as c
-- on a.movie_id= c.movie_id
-- order by user_id
-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- ///////////////////////////////////
-- (select a.name as results
-- from users as a 
-- join movierating as b
-- on a.user_id = b.user_id
-- group by 1
-- order by  count(rating) desc,1 asc
-- limit 1)

-- union all

-- (select title results
-- from movierating as a 
-- join movies as b
-- on b.movie_id = a.movie_id
-- where month(created_at) =2
-- group by 1
-- order by avg(rating) desc , 1 asc
-- limit 1)

-- ////////////////////////////////////
(SELECT u.name AS results 
  FROM MovieRating AS mr 
  LEFT JOIN  Users AS u 
  USING (user_id) 
  GROUP BY user_id 
  ORDER BY COUNT(movie_id) DESC, u.name ASC LIMIT 1) 
 
 UNION ALL 
 
 (SELECT m.title  
  FROM MovieRating AS mr 
  LEFT JOIN Movies AS m 
  USING (movie_id) 
  WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29' 
  GROUP BY movie_id 
  ORDER BY AVG(rating) DESC, m.title ASC LIMIT 1)