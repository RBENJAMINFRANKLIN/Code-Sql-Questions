/* Write your PL/SQL query statement below */
select id,movie, description ,rating from cinema 
where description  not in  ('boring')
and MOD( id, 2) = 1
order by rating desc;