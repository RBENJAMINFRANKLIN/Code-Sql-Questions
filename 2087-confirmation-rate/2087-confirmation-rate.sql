/* Write your PL/SQL query statement below */
select Signups.user_id, ROUND(AVG(CASE WHEN (Confirmations.action='confirmed') THEN 1 ELSE 0 END),2) as confirmation_rate 
from Confirmations  right outer join Signups on
Confirmations.user_id = Signups.user_id
GROUP BY Signups.user_id;