
/* Write your PL/SQL query statement below */
DELETE FROM PERSON WHERE ID NOT IN (SELECT MIN(ID) FROM PERSON  GROUP BY EMAIL);

--delete from Person where id not in(select min(p.id) from Person p group by p.email);
