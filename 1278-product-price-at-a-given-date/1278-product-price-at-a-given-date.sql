/* Write your PL/SQL query statement below */
with cte as(
SELECT PRODUCT_ID, new_price,change_date, row_number() over (partition by product_id order by change_date desc) as rn from products;
where change_date<='2019-08-16';
)
select p.product_id, nvl(c.new_price,10) AS price from (SELECT DISTINCT product_id FROM Products) p left join
cte c on p.product_id = c.product_id  and c.rn = 1 ;


