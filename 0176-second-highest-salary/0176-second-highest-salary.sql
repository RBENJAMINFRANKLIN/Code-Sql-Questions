/* Write your PL/SQL query statement below */
WITH cte AS (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rank
    FROM Employee
)
SELECT MAX(salary) AS SecondHighestSalary
FROM cte
WHERE rank = 2;

