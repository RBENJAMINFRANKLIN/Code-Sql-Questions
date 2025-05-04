# Write your MySQL query statement below
WITH daily_amount AS (
  SELECT 
    visited_on,
    SUM(amount) AS amount
  FROM customer
  GROUP BY visited_on
),
rolling_avg AS (
  SELECT 
    visited_on,
    amount,
    ROUND(
      SUM(amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
      ), 2
    ) AS rolling_sum,
    ROUND(
      AVG(amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
      ), 2
    ) AS average_amount
  FROM daily_amount
)
SELECT visited_on, rolling_sum AS amount, average_amount
FROM rolling_avg
WHERE visited_on >= DATE_ADD((SELECT MIN(visited_on) FROM customer), INTERVAL 6 DAY)
ORDER BY visited_on;
