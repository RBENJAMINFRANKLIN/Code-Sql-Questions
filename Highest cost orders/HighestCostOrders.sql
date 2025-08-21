**Highest Cost Orders**

Find the customers with the highest daily total order cost between 2019-02-01 and 2019-05-01. If a customer had more than one order on a certain day, sum the order costs on a daily basis. Output each customer's first name, total cost of their items, and the date.
For simplicity, you can assume that every first name in the dataset is unique.

**Solution**

WITH cte
     AS (SELECT c.first_name,
                o.order_date,
                SUM(o.total_order_cost)                    AS sum_cost,
                Dense_rank()
                  over(
                    PARTITION BY o.order_date
                    ORDER BY SUM(o.total_order_cost) DESC) AS RN
         FROM   customers c
                join orders o
                  ON c.id = o.cust_id
         WHERE  o.order_date BETWEEN To_date('2019-02-01', 'YYYY-MM-DD') AND
                                     To_date(
                                     '2019-05-01', 'YYYY-MM-DD')
         GROUP  BY c.first_name,
                   o.order_date)
SELECT first_name,
       order_date,
       sum_cost AS max_cost
FROM   cte
WHERE  rn = 1
ORDER  BY order_date; 
