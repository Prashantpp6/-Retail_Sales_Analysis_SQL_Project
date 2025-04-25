-- 📊 SQL Retail Sales Analysis Project - P1
-- 💡 Description: This project demonstrates analysis and business insights on retail sales data
-- using SQL queries. I cover data cleaning, exploration, and solving real-world business problems
-- like identifying top-performing categories, sales trends, and customer behavior.

-- STEP 1: Create a new database
CREATE DATABASE sql_project_p2;

-- STEP 2: Create the main table
DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantiy INT,  
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

-- STEP 3: Fix column spelling and rename identifiers
ALTER TABLE retail_sales
RENAME COLUMN quantiy TO quantity;

ALTER TABLE retail_sales
RENAME COLUMN transaction_id TO transactions_id;

-- STEP 4: Quick data checks
SELECT * FROM retail_sales LIMIT 10;
SELECT COUNT(*) FROM retail_sales;

-- STEP 5: Data Cleaning - Check for missing/null values
SELECT * FROM retail_sales
WHERE 
    transactions_id IS NULL OR
    sale_date IS NULL OR
    sale_time IS NULL OR
    gender IS NULL OR
    category IS NULL OR
    quantity IS NULL OR
	price_per_unit IS NULL OR
    cogs IS NULL OR
    total_sale IS NULL;

-- STEP 6: Data Exploration

-- Total number of sales
SELECT COUNT(*) AS total_sales FROM retail_sales;

-- Total number of unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM retail_sales;

-- Different product categories
SELECT DISTINCT category FROM retail_sales;

-- STEP 7: Business Questions & Answers 

-- Q1. Sales made on '2022-11-05'
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q2. Clothing category with quantity > 4 in Nov-2022
SELECT * FROM retail_sales
WHERE category = 'Clothing'
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
  AND quantity > 4;

-- Q3. Total sales and number of orders per category
SELECT 
    category, 
    SUM(total_sale) AS net_sales,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- Q4. Average age of customers who purchased Beauty items
SELECT ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q5. Transactions with sales > 1000
SELECT * FROM retail_sales
WHERE total_sale > 1000;

-- Q6. Number of transactions by gender in each category
SELECT 
    category,
    gender,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- Q7. Best-selling month in each year based on average sale
SELECT 
    year,
    month,
    avg_sale
FROM (
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date) 
                     ORDER BY AVG(total_sale) DESC) AS rank
    FROM retail_sales
    GROUP BY 1, 2
) AS ranked_sales
WHERE rank = 1;

-- Q8. Top 5 customers based on total sales
SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q9. Number of unique customers per category
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Q10. Time-of-day shift classification and order count
WITH hourly_sales AS (
    SELECT *,
        CASE
            WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) AS total_orders
FROM hourly_sales
GROUP BY shift;

--  End of SQL Project
-- Made with TEA and lots of love for data analysis 
