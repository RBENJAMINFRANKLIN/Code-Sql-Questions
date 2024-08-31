/* Write your PL/SQL query statement below */
select 
e1.EMPLOYEE_ID,
e1.NAME,
count(e2.reports_to) as reports_count,
ROUND(avg(e2.age)) as average_age 

from
employees e1 join employees e2 on
e1.employee_id=e2.reports_to
group by e1.employee_id,e1.name
ORDER BY EMPLOYEE_ID;