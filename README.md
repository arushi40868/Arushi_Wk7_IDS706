#  IDS-706 Week 7 SQL Project — *Apple Sales Analysis*

This project explores SQL concepts using a simulated **Apple Sales** dataset.  
The goal was to demonstrate proficiency with table creation, data cleaning, joins, aggregation, window functions, and transformations using **SQLite** and **DBeaver**.

---

##  Repository Structure

```
Arushi_Wk7_IDS706/
│
├── Apple_Sales.db (hosted on OneDrive, link below)
├── category.csv
├── products.csv
├── sales.csv
├── stores.csv
├── warranty.csv
│
├── create_datetable_query.sql
├── select_query.sql
├── aggregation_query.sql
├── casewhen_query.sql
├── window_function.sql
├── join_query.sql
├── strftime_query.sql
├── cte_query.sql
└── delete_query.sql
```

---

##  Database Access

Due to GitHub’s 25 MB file limit, the full SQLite database is hosted on OneDrive.  
Please download and open it in **DBeaver** before running the queries below.
The Sales CSV file was also too large so it has been zipped. (35 MB)

 **Download here:**  
🔗 [Apple_Sales.db (OneDrive link)](https://prodduke-my.sharepoint.com/:u:/r/personal/as1685_duke_edu/Documents/IDS-706/Apple_Sales.db?csf=1&web=1&e=m15dEM)


---

##  Schema Overview

The database contains the following key tables:

| Table | Description |
|--------|--------------|
| **sales_new** | Transaction-level data for all product sales |
| **products** | Product information including category and price |
| **stores** | Store details including location |
| **date_dim** | Date dimension for temporal analysis |
| **category** | Lookup for product categories |
| **warranty** | Repair and warranty claim data |

---

##  Basic Analysis Queries

### 1. **Select Query**
**File:** `select_query.sql`  
**Purpose:** Retrieve the first 10 records from the `sales_new` table to verify successful data loading.  
**Key Concepts:** `SELECT`, `LIMIT`

---

### 2. **Aggregation Query**
**File:** `aggregation_query.sql`  
**Purpose:** Calculate total units sold and total revenue for each product in 2023.  
**Key Concepts:** `SUM`, `GROUP BY`, `COALESCE`  
**Insight:** Helps identify top-performing Apple products by sales volume and revenue.

---

### 3. **Case When Query**
**File:** `casewhen_query.sql`  
**Purpose:** Categorize sales performance as *High*, *Medium*, or *Low* based on revenue thresholds.  
**Key Concepts:** `CASE WHEN`, conditional logic  
**Insight:** Useful for quick business classification and reporting.

---

##  Advanced SQL Features

### 4. **Window Function Query**
**File:** `window_function.sql`  
**Purpose:** Rank products by total revenue using `ROW_NUMBER() OVER (PARTITION BY ...)`.  
**Key Concepts:** `WINDOW`, `OVER`, `PARTITION BY`, `RANK`  
**Insight:** Highlights product performance ranking within each year.

---

### 5. **CTE Query**
**File:** `cte_query.sql`  
**Purpose:** Use a Common Table Expression to summarize monthly sales trends.  
**Key Concepts:** `WITH`, `CTE`, `JOIN`, `GROUP BY`  
**Insight:** Allows modular, readable SQL analysis of monthly patterns.

---

### 6. **Date Function Query**
**File:** `strftime_query.sql`  
**Purpose:** Extract year and month components from sales dates for time-based analysis.  
**Key Concepts:** `strftime()`  
**Insight:** Enables trend analysis by month or quarter.

---

### 7. **Join Query**
**File:** `join_query.sql`  
**Purpose:** Combine product and sales data to compute total revenue per category.  
**Key Concepts:** `INNER JOIN`, `LEFT JOIN`  
**Insight:** Demonstrates relational integration across multiple tables.

---

### 8. **Delete / Data Cleaning Query**
**File:** `delete_query.sql`  
**Purpose:** Remove outdated records (pre-2020) to maintain database efficiency.  
**Key Concepts:** `DELETE`, `WHERE`  
**Insight:** Demonstrates safe record deletion and cleaning for analysis performance.

---

##  Additional SQL Features Explored Independently

### 9. **COALESCE Function**
**Purpose:** Handle missing or NULL values in price calculations.  
**Example:** `COALESCE(p.Price, 0)` ensures accurate revenue aggregation.

### 10. **Date Function (strftime)**
**Purpose:** Extract and group data by `Year-Month` for time-series analysis.  
**Example:** `strftime('%Y-%m', sale_date_iso)`  
**Insight:** Enables trend identification across months.

---

##  Example Output (Expected Visual Insights)

| Product_Name | Units_Sold | Revenue |
|---------------|-------------|----------|
| MacBook Air (M2) | 1250 | $1.8M |
| MacBook Pro 14-inch | 930 | $1.3M |
| iPad Pro | 850 | $1.1M |

*(sample output - values for illustration)*

---

##  Summary

This project demonstrates:
- Complete SQL workflow from creation to transformation
- Joins and aggregations across multiple tables  
- Use of analytical SQL (CTEs, window functions, conditional logic)  
- Clean project structure with explanatory documentation  
- Large dataset handling using external hosting (OneDrive)

---

**Author:** Arushi Singh  
**Course:** IDS-706 - Data Science Foundations  
**Institution:** Duke University
