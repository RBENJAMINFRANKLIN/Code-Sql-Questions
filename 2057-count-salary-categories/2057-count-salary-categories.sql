# Write your MySQL query statement below
with cte as(
select account_id,income, case when income<20000 then 'Low Salary' when 
income >=20000 and income<=50000 then 'Average Salary' when
income> 50000 then 'High Salary' end as category from accounts)
select l.category, count(c.category) accounts_count  from (
    select 'Low Salary' as category  from dual 
    union all
    select 'Average Salary' from dual
    union all
        select 'High Salary' from dual
) l left join cte c on l.category = c.category
 group by l.category;