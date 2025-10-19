--SELECT 
   -- MIN(date(sale_date_iso)) AS min_date,
   -- MAX(date(sale_date_iso)) AS max_date
--FROM sales;

CREATE TABLE date_dim AS
WITH RECURSIVE dates(date) AS (
  SELECT DATE('2022-01-01')            -- start date
  UNION ALL
  SELECT DATE(date, '+1 day')
  FROM dates
  WHERE date < DATE('2024-11-12')      -- end date
)
SELECT
  date AS full_date,
  strftime('%Y', date) AS year,
  strftime('%m', date) AS month,
  strftime('%d', date) AS day,
  strftime('%Y-%m', date) AS year_month,
  strftime('%W', date) AS week_number,
  CASE strftime('%m', date)
      WHEN '01' THEN 'January'
      WHEN '02' THEN 'February'
      WHEN '03' THEN 'March'
      WHEN '04' THEN 'April'
      WHEN '05' THEN 'May'
      WHEN '06' THEN 'June'
      WHEN '07' THEN 'July'
      WHEN '08' THEN 'August'
      WHEN '09' THEN 'September'
      WHEN '10' THEN 'October'
      WHEN '11' THEN 'November'
      WHEN '12' THEN 'December'
  END AS month_name,
  CASE strftime('%w', date)
      WHEN '0' THEN 'Sunday'
      WHEN '1' THEN 'Monday'
      WHEN '2' THEN 'Tuesday'
      WHEN '3' THEN 'Wednesday'
      WHEN '4' THEN 'Thursday'
      WHEN '5' THEN 'Friday'
      WHEN '6' THEN 'Saturday'
  END AS weekday_name,
  CASE
      WHEN strftime('%m', date) IN ('01','02','03') THEN 'Q1'
      WHEN strftime('%m', date) IN ('04','05','06') THEN 'Q2'
      WHEN strftime('%m', date) IN ('07','08','09') THEN 'Q3'
      ELSE 'Q4'
  END AS quarter,
  CASE
      WHEN strftime('%w', date) IN ('0','6') THEN 1 ELSE 0
  END AS is_weekend
FROM dates;
