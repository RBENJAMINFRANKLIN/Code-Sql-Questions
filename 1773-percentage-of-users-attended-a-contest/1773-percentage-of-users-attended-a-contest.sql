/* Write your PL/SQL query statement below */
select c.contest_id, round(((count(c.contest_id )/(select count(*) from users))*100),2) percentage from register c join users u on 
c.user_id = u.user_id
group by c.contest_id
order by percentage desc,c.contest_id;

