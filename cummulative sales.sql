WITH total_daily_revenue_CTE AS (
  SELECT 
    sale_date,
    SUM(revenue) as daily_revenue
  FROM daily_sales
  GROUP BY sale_date
  ) 
SELECT
    sale_date,
    daily_revenue,
    SUM(daily_revenue) OVER (ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_revenue
FROM total_daily_revenue_CTE

/*
To improve query performance for a table that has billions of rows, I would use rolling/moving sum over a time window specified by the business users. For instance, we can use a 7-day moving total, 14-day moving total or 
30-day moving total. This way we reduce the number of rows the query scans over. A WHERE filter can be used to bring the number of rows down from billions to a couple of days/months.
*/
