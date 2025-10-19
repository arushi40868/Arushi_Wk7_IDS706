--SELECT DISTINCT Sale_date FROM sales LIMIT 10
--ALTER TABLE "sales" ADD COLUMN "sale_date_iso" TEXT;
--UPDATE "sales"
--SET "sale_date_iso" =
 --   substr(Sale_date, 7, 4) || '-' ||   -- YYYY
 --   substr(Sale_date, 4, 2) || '-' ||   -- MM
  --  substr(Sale_date, 1, 2);            -- DD
--SELECT Sale_date, sale_date_iso
--FROM "sales"
--LIMIT 10;
--SELECT *
--FROM sales
--WHERE date(sale_date_iso) BETWEEN '2022-01-01' AND '2022-12-31';
SELECT 
  strftime('%Y-%m', sale_date_iso) AS year_month,
  SUM(total_sales) AS total
FROM sales
GROUP BY year_month
ORDER BY year_month;