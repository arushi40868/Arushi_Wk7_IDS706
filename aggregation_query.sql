SELECT
  p.Product_Name,
  SUM(s.quantity)                           AS units_sold,
  SUM(s.quantity * COALESCE(p.Price, 0))    AS revenue
FROM sales_new s
JOIN date_dim d   ON d.full_date = s.sale_date_iso
LEFT JOIN products p ON p.Product_ID = s.product_id
WHERE d.year = '2023'
GROUP BY p.Product_Name
ORDER BY revenue DESC
LIMIT 10;
