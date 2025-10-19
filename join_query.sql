SELECT 
    s.*, 
    d.year, 
    d.month_name, 
    d.quarter, 
    d.is_weekend
FROM sales s
LEFT JOIN date_dim d
  ON s.sale_date_iso = d.full_date
LIMIT 10;