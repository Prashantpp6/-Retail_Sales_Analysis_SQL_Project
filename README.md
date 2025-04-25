🛍️ Retail Sales Analysis SQL Project


A data-driven analysis project aimed at uncovering key insights and business trends from a retail sales dataset using SQL. This project demonstrates skills in data cleaning, transformation, and analysis to answer key business questions related to sales performance, customer behavior, and category trends.

📊 Project Overview
This project includes:
Creating a retail sales database and table in PostgreSQL using pgAdmin
Cleaning and transforming raw data
Answering 10+ business questions using SQL queries
Applying aggregation, filtering, time-based analysis, and customer segmentation
Categorizing sales by time shifts (Morning, Afternoon, Evening)

🧰 Tech Stack
PostgreSQL
pgAdmin
SQL

📁 Database Structure
Table Name: retail_sales

Column Name	Data Type	Description
transactions_id	INT	Unique transaction identifier
sale_date	DATE	Date of transaction
sale_time	TIME	Time of transaction
customer_id	INT	Unique customer identifier
gender	VARCHAR(15)	Gender of the customer
age	INT	Age of the customer
category	VARCHAR(15)	Product category
quantity	INT	Number of items sold
price_per_unit	FLOAT	Price per unit
cogs	FLOAT	Cost of goods sold
total_sale	FLOAT	Total transaction sale


✅ Project Highlights
🧽 Cleaned null/missing values from the dataset
📅 Analyzed monthly sales and top-selling months
👕 Performed category-wise analysis (e.g., Clothing, Beauty, etc.)
👨‍👩‍👧‍👦 Segmented customers by age, gender, and spending
📈 Identified top customers based on sales
⏰ Grouped sales by time shifts (Morning, Afternoon, Evening)


🔍 Key Business Questions Answered
Total number of sales?
Number of unique customers?
List of all categories sold?
Transactions on a specific date (2022-11-05)?
Clothing sales with quantity > 4 in Nov-2022?
Total sales by category?
Average age of Beauty category buyers?
Transactions where total_sale > 1000?
Total transactions by gender and category?
Best-selling month per year?
Top 5 customers by total sale?
Unique customers per category?
Shift-wise orders (Morning, Afternoon, Evening)?


📌 Getting Started
Install PostgreSQL and pgAdmin
Create a new database: sql_project_p2
Run the provided SQL script to create and analyze the retail_sales table


📂 Output Example
You’ll get insights like:
Top 5 Customers:

python-repl
Copy
Edit
| customer_id | total_sales |
|-------------|-------------|
|     104     |   2350.75   |
|     112     |   2231.00   |
...
Best-Selling Months:

sql
Copy
Edit
| year | month | avg_sale |
|------|-------|----------|
| 2022 |  11   |  125.33  |
...



👨‍💻 Author
Prashant Singh Parmar
📍 MCA Graduate from IPS Academy,Indore
📫 GitHub: @Prashantpp6
