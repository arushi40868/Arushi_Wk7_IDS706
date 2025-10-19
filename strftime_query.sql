SELECT 
    strftime('%Y-%m', s.sale_date_iso) AS sale_month,
    SUM(s.quantity) AS total_units
FROM sales_new s
GROUP BY sale_month
ORDER BY sale_month;
