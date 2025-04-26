# Write your MySQL query statement below
select person_name from (
select person_id,person_name,weight,turn, sum(weight) over ( order by turn) as sumlimit from queue ) AS t where 
sumlimit <=1000 ORDER BY turn desc limit 1;