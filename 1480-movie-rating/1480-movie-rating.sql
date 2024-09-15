# Write your MySQL query statement below
/* Write your PL/SQL query statement below */
(select u.name as results from users u
join MovieRating  m on 
u.user_id = m.user_id
group by m.user_id
order by count(*) desc,name
limit 1)
union all(
 select m.title as results from movies m
 join movierating mm on 
 m.movie_id = mm.movie_id
 where YEAR(CREATED_AT)=2020 AND MONTH(CREATED_AT)=2
 group by mm.movie_id
 ORDER BY AVG(RATING) DESC, M.TITLE
 LIMIT 1)
