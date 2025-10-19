WITH product_revenue AS (
  SELECT
    p.Product_Name,
    SUM(s.quantity * COALESCE(p.Price, 0)) AS total_revenue
  FROM sales_new s
  JOIN products p ON p.Product_ID = s.product_id
  GROUP BY p.Product_Name
)
SELECT
  Product_Name,
  total_revenue
FROM product_revenue
ORDER BY total_revenue DESC
LIMIT 5;
