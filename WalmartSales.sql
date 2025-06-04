-- CREATE a database 
CREATE DATABASE Walmart;

-- Pulling all the records
SELECT * FROM Walmart.sales_data;

-- Count of all the records
SELECT COUNT(*) FROM Walmart.sales_data;

-- Altering the column name gross income to gross_income

ALTER TABLE Walmart.sales_data
CHANGE `gross income` gross_income DECIMAL(10,2);

-- Find the total revenue, cogs and Profit
SELECT 
    ROUND(SUM(total),2) AS total_revenue,
	ROUND(SUM(cogs),2) AS total_cogs,
    ROUND(SUM(gross_income),2) AS total_profit
    FROM Walmart.sales_data;

-- Total transactions and Avg order values

SELECT COUNT(total) AS Total_transactions,
ROUND(AVG(Total),2) AS avg_order_values
FROM Walmart.sales_data;
 
-- Find the sales by branch 

SELECT Branch, COUNT(Total) AS Total_Transactions,
Round(SUM(Total),2) AS Revenue
From Walmart.sales_data 
group by Branch
Order By revenue DESC;

-- Find the sales by city

SELECT City, COUNT(Total) AS Total_Transactions,
ROUND(SUM(Total),2) AS Revenue
FROM Walmart.sales_data 
group by City
order by revenue DESC;

-- Find the total count on customers based on gender

SELECT COUNT(Gender) AS Total_Count
FROM Walmart.sales_data 
group by Gender;

-- Find the total male and gemale customers in each of the product line and sort it in descending order

SELECT gender, Product_line, COUNT(*) AS Count
FROM Walmart.sales_data
Group By gender, Product_line
Order By gender, Count DESC;

-- Find total revenue generated based on customer type
SELECT Customer_type, COUNT(*) AS Total_Count, ROUND(SUM(Total),2) AS Total_Revenue
FROM Walmart.sales_data
Group By Customer_type;

-- Find the sales per month
SELECT MONTH(Date) AS Month, ROUND(SUM(Total),2) AS Sales_per_month
FROM Walmart.sales_data
Group By Month
ORDER BY Month;

-- Sales by time
SELECT EXTRACT(HOUR FROM Time) AS Hour, ROUND(SUM(Total),2) AS Sales_by_time
FROM Walmart.sales_data
GROUP BY Hour;

-- Find the revenue generated during time of day(Morning, Afternoon & Evening)
SELECT 
  CASE
    WHEN HOUR(time) BETWEEN 0 AND 11 THEN 'Morning'
    WHEN HOUR(time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day,
  COUNT(*) AS transactions,
  ROUND(SUM(total), 2) AS revenue
FROM Walmart.Sales_data
GROUP BY time_of_day;

-- Product line revenue

SELECT Product_line, ROUND(SUM(Total),2) AS Revenue
FROM Walmart.sales_data
Group By Product_line
Order By Revenue DESC;

-- Profit by product line

SELECT Product_line, 
ROUND(SUM(gross_income),2) AS Profit, 
ROUND(AVG(gross_margin_percentage),2) AS AVG_margin_percentage
FROM Walmart.sales_data
GROUP BY Product_line
ORDER BY Profit DESC;

-- Payment method breakdown

SELECT Payment
FROM Walmart.sales_data
Group By Payment
ORDER BY Transactions DESC;

-- AVG rating by product line

SELECT  product_line,  ROUND(AVG(rating),2) AS AVG_rating
FROM Walmart.sales_data
Group By Product_line
Order By Avg_rating DESC;



