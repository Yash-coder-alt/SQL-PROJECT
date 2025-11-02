-- AVERAGE ORDER AMOUNT FOR EACH COUNTRY

SELECT country , AVG(priceEach * quantityOrdered) AS avg_order_value
FROM classicmodels.customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY country;

-- TOTAL SALES AMOUNT FOR EACH PRODUCT LINE

SELECT productline, SUM(priceEach * quantityOrdered) AS sales_value
FROM orderdetails od
INNER JOIN products p ON od.productCode = p.productCode
GROUP BY productLine;

-- TOP 10 BEST-SELLING PRODUCTS BASED ON TOTAL QUANTITY SOLD

SELECT productName , SUM(quantityOrdered) AS unit_sold
FROM orderdetails od
INNER JOIN products p ON od.productCode = p.productCode
GROUP BY productName
ORDER BY unit_sold DESC
LIMIT 10;

-- EVALUATION OF SALES PERFORMANCE OF EACH SALES REPRESENTATIVES

SELECT e.firstName, e.lastName , SUM(quantityOrdered * priceEach) AS order_value
FROM employees e
INNER JOIN customers c 
ON employeeNumber = salesRepEmployeeNumber AND e.jobTitle = 'Sales Rep'
LEFT JOIN orders o 
ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails od 
ON o.orderNumber = od.orderNumber
GROUP BY e.firstName, e.lastName;

-- AVERAGE NUMBER OF ORDERS PLACED BY EACH CUSTOMER

SELECT COUNT(o.orderNumber) / COUNT(DISTINCT c.customerNumber)
FROM customers c
LEFT JOIN orders o
ON c.customerNumber = o.customerNumber;

-- PERCENTAGE OF ORDERS THAT WERE SHIPPED ON TIME

SELECT SUM(CASE WHEN shippedDate <= requiredDate THEN 1 ELSE 0 END) / COUNT(orderNumber)*100 AS PERCENT_ON_TIME
FROM orders ;

-- CALCULATION OF PROFIT MARGIN FOR EACH PRODUCT BY SUBTRACTING THE COST OF GOODS (COGS) FROM THE SALES REVENUE

SELECT productName , SUM((priceEach * quantityOrdered) - (buyPrice * quantityOrdered)) AS net_profit
FROM products p
INNER JOIN orderdetails od
ON p.productCode = od.productCode
GROUP BY productName;

-- SEGMENTING CUSTOMERS BASED ON THEIR TOTAL PURCHASE AMOUNT

SELECT c.* , t2.customer_segment
FROM customers c
LEFT JOIN
(SELECT *,
CASE WHEN  total_purchase_amount >100000 THEN "HIGH VALUE"
     WHEN  total_purchase_amount BETWEEN 50000 AND 100000 THEN "MEDIUM VALUE"
     WHEN  total_purchase_amount <50000 THEN "LOW VALUE"
ELSE "OTHER" END AS customer_segment
FROM
(SELECT customerNumber , SUM(priceEach * quantityOrdered) AS total_purchase_amount
FROM orders o
INNER JOIN orderdetails od
ON o.orderNumber = od.orderNumber
GROUP BY customerNumber)t1
)t2
ON c.customerNumber = t2.customerNumber;

-- IDENTIFYING FREQUENTLY CO-PURCHASED PRODUCTS TO UNDERSTAND CROSS-SELLING OPPORTUNITIES

SELECT od.productCode , p.productName , od2.productCode , p2.productName , COUNT(*) AS purchased_together
FROM orderdetails od
INNER JOIN orderdetails od2
ON od.orderNumber = od2.orderNumber AND od.productCode <> od2.productCode
INNER JOIN products p
ON od.productCode = p.productCode
INNER JOIN products p2
ON od2.productCode = p2.productCode
GROUP BY od.productCode , p.productName , od2.productCode , p2.productName
ORDER BY purchased_together DESC;
