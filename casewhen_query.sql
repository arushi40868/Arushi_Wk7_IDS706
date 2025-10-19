SELECT
  st.Store_Name,
  st.Country,
  SUM(s.quantity * COALESCE(p.Price, 0)) AS total_revenue,
  CASE
    WHEN SUM(s.quantity * COALESCE(p.Price, 0)) >= 500000 THEN 'High Performing'
    WHEN SUM(s.quantity * COALESCE(p.Price, 0)) BETWEEN 200000 AND 499999 THEN 'Medium Performing'
    WHEN SUM(s.quantity * COALESCE(p.Price, 0)) BETWEEN 1 AND 199999 THEN 'Low Performing'
    ELSE 'No Sales'
  END AS performance_tier
FROM sales_new s
JOIN stores st   ON st.Store_ID = s.store_id
LEFT JOIN products p ON p.Product_ID = s.product_id
GROUP BY st.Store_Name, st.Country
ORDER BY total_revenue DESC;
