-- Select the E-Commerce project database
USE ecommerce_DB;

-- Check the tables in the database
SHOW TABLES;

-- Check total records
SELECT COUNT(*) AS total_records
FROM cleaned_ecommerce_sales;

-- Display the first 5 records
SELECT *
FROM cleaned_ecommerce_sales
LIMIT 5;

-- Display column names and data types
DESCRIBE cleaned_ecommerce_sales;

-- Calculate total sales
SELECT SUM(Sales) AS TOTAL_SALES
FROM cleaned_ecommerce_sales;

-- Calculate total profit
SELECT SUM(Profit) AS TOTAL_PROFITS
FROM cleaned_ecommerce_sales;

-- Calculate total quantity sold
SELECT SUM(Quantity) AS TOTAL_QUANTITY
FROM cleaned_ecommerce_sales;

-- Count total records/orders
SELECT COUNT(*) AS Total_Orders
FROM cleaned_ecommerce_sales;

-- Calculate overall profit margin
SELECT (SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin
FROM cleaned_ecommerce_sales;

-- Sales by category
SELECT Category, SUM(Sales) AS TOTAL_SALES
FROM cleaned_ecommerce_sales
GROUP BY Category;

-- Profit by category
SELECT Category, SUM(Profit) AS Total_Profit
FROM cleaned_ecommerce_sales
GROUP BY Category;

-- Quantity by category
SELECT Category, SUM(Quantity) AS TOTAL_QUANTITY
FROM cleaned_ecommerce_sales
GROUP BY Category;

-- Sales by region
SELECT Region, SUM(Sales) AS Total_Sales
FROM cleaned_ecommerce_sales
GROUP BY Region;

-- Profit by region
SELECT Region, SUM(Profit) AS Total_Profit
FROM cleaned_ecommerce_sales
GROUP BY Region;

-- Quantity by region
SELECT Region, SUM(Quantity) AS Total_Quantity
FROM cleaned_ecommerce_sales
GROUP BY Region;

-- Total sales by product
SELECT `Product Name`, SUM(Sales) AS TOTAL_SALES
FROM cleaned_ecommerce_sales
GROUP BY `Product Name`
ORDER BY TOTAL_SALES DESC;

-- Total profit by product
SELECT `Product Name`, SUM(Profit) AS TOTAL_PROFIT
FROM cleaned_ecommerce_sales
GROUP BY `Product Name`
ORDER BY TOTAL_PROFIT DESC;

-- Total quantity by product
SELECT `Product Name`, SUM(Quantity) AS Total_Quantity
FROM cleaned_ecommerce_sales
GROUP BY `Product Name`
ORDER BY Total_Quantity DESC;

-- Top 5 products by sales
SELECT `Product Name`, SUM(Sales) AS Total_Sales
FROM cleaned_ecommerce_sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 5;

-- Top 5 products by profit
SELECT `Product Name`, SUM(Profit) AS Total_Profit
FROM cleaned_ecommerce_sales
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 5;

-- Bottom 5 products by profit
SELECT `Product Name`, SUM(Profit) AS Total_Profit
FROM cleaned_ecommerce_sales
GROUP BY `Product Name`
ORDER BY Total_Profit ASC
LIMIT 5;

-- Total sales by year
SELECT Year, SUM(Sales) AS Total_Sales
FROM cleaned_ecommerce_sales
GROUP BY Year
ORDER BY Year;

-- Total profit by year
SELECT Year, SUM(Profit) AS Total_Profit
FROM cleaned_ecommerce_sales
GROUP BY Year
ORDER BY Year;

-- Total sales by month
SELECT Month, Month_Name, SUM(Sales) AS Total_Sales
FROM cleaned_ecommerce_sales
GROUP BY Month, Month_Name
ORDER BY Month;

-- Average sales
SELECT AVG(Sales) AS AVERAGE_SALES
FROM cleaned_ecommerce_sales;

-- Average profit
SELECT AVG(Profit) AS AVERAGE_PROFIT
FROM cleaned_ecommerce_sales;

-- Average profit margin
SELECT AVG(Profit_Margin) AS AVERAGE_PROFIT_MARGIN
FROM cleaned_ecommerce_sales;

-- Profit margin by category
SELECT Category,
       (SUM(Profit) / SUM(Sales)) * 100 AS PROFIT_MARGIN
FROM cleaned_ecommerce_sales
GROUP BY Category;

-- Profit margin by region
SELECT Region,
       (SUM(Profit) / SUM(Sales)) * 100 AS PROFIT_MARGIN
FROM cleaned_ecommerce_sales
GROUP BY Region;

-- Display loss-making records
SELECT *
FROM cleaned_ecommerce_sales
WHERE Profit < 0;

-- Count loss-making records
SELECT COUNT(*) AS Loss_Making_Orders
FROM cleaned_ecommerce_sales
WHERE Profit < 0;

-- Sales vs profit by category
SELECT Category,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM cleaned_ecommerce_sales
GROUP BY Category;

-- Sales vs profit by region
SELECT Region,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM cleaned_ecommerce_sales
GROUP BY Region;

-- Products with high sales and profit
SELECT `Product Name`,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM cleaned_ecommerce_sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC;
SELECT COUNT(DISTINCT `Product Name`) AS Total_Products
FROM cleaned_ecommerce_sales;
SELECT `Product Name`,
       SUM(Sales) AS Total_Sales
FROM cleaned_ecommerce_sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 1;
SELECT `Product Name`,
       SUM(Profit) AS Total_Profit
FROM cleaned_ecommerce_sales
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 1;
SELECT `Product Name`,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM cleaned_ecommerce_sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC, Total_Profit ASC;
SELECT
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Missing_Category,
    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS Missing_Region,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Missing_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Missing_Profit,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity
FROM cleaned_ecommerce_sales;