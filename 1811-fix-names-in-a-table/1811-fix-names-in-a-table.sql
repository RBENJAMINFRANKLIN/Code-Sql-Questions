/* Write your PL/SQL query statement below */
select user_id, concat(UPPER(SUBSTR(name,1,1)),LOWER(SUBSTR(name,2,(length(name))))) as name from users order by user_id;
