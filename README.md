# SQL-PROJECT

📘 Project Overview

This project performs comprehensive sales data analysis on the ClassicModels database using SQL.
It explores customer behavior, product performance, and sales efficiency to generate valuable business insights.

The queries cover a full range of analytical use cases — from revenue and profit analysis to sales representative performance evaluation, customer segmentation, and cross-selling opportunities.

🧩 Dataset Used

Database: classicmodels
Tables Involved:

customers

orders

orderdetails

products

employees

This is a well-known sample sales database that includes data on customers, orders, products, payments, and employees of a fictional company.

🧠 Key SQL Concepts Used

JOINs (INNER, LEFT)

Aggregate Functions (SUM(), AVG(), COUNT())

GROUP BY and ORDER BY

Conditional Expressions (CASE WHEN)

Subqueries and Nested SELECT statements

Aliasing and Filtering

📈 Analytical Insights Generated
1️⃣ Average Order Amount by Country

Calculates the mean order value per country to identify regions with the highest purchase potential.

SELECT country, AVG(priceEach * quantityOrdered) AS avg_order_value
FROM classicmodels.customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY country;

2️⃣ Total Sales by Product Line

Determines total revenue generated from each product line to evaluate product category performance.

3️⃣ Top 10 Best-Selling Products

Identifies the most popular products based on total units sold to guide inventory and marketing strategies.

4️⃣ Sales Representative Performance

Evaluates each sales rep’s total contribution to revenue for performance reviews and incentives.

5️⃣ Average Orders per Customer

Finds the average number of orders placed by customers to measure customer engagement and loyalty.

6️⃣ On-Time Shipping Percentage

Calculates the percentage of orders shipped before or on the required date, a key logistics KPI.

7️⃣ Profit Margin per Product

Computes profit margins by subtracting cost (COGS) from sales revenue, enabling pricing optimization.

8️⃣ Customer Segmentation

Segments customers into High, Medium, and Low Value categories based on their total purchase amounts.

9️⃣ Co-Purchased Product Analysis

Identifies pairs of products often bought together to reveal cross-selling and bundling opportunities.

🛠️ Tools & Technologies

SQL (MySQL)

ClassicModels Sample Database

MySQL Workbench 

🚀 Outcomes

✅ Built a set of advanced analytical SQL queries to uncover critical business metrics.
✅ Improved understanding of customer segmentation, product trends, and sales KPIs.
✅ Demonstrated strong command of data joining, aggregation, and subquery logic.
✅ Created a reusable SQL analytics framework for any retail or sales-based organization.
