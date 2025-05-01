/* Write your PL/SQL query statement below */
with cte as(
select p.product_id,p.product_name,o.order_date,o.unit,
o.order_date from products p join orders o on
p.product_id = o.product_id WHERE TO_CHAR(o.order_date, 'YYYY-Mon') = '2020-Feb')

select  product_name, sum(unit)  as unit from cte 
group by product_name
HAVING SUM(unit) >= 100;

;
