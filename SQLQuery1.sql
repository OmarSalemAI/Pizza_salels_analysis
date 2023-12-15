SELECT SUM(total_price) AS 'Total Revenue'
FROM pizza_sales;

SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS 'AVG Order Value'
FROM pizza_sales;


SELECT SUM(quantity) AS 'Total Pizza Sold'
FROM pizza_sales;

SELECT Count(DISTINCT order_id) AS 'Total Orders'
FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(Count(DISTINCT order_id) AS DECIMAL(10,2))
AS DECIMAL(10,2))
AS 'AVG Pizzas Per Order'
FROM pizza_sales; 

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

SELECT DATENAME(MM, order_date) AS order_month, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MM, order_date);

SELECT pizza_category,SUM(total_price) AS Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(quarter, order_date) = 1) AS Percentage_per_category
FROM pizza_sales
WHERE DATEPART(quarter, order_date) = 1
GROUP BY pizza_category;

SELECT pizza_size,SUM(total_price) AS Sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_per_Pizza_size
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_per_Pizza_size DESC;

SELECT pizza_category, SUM(quantity) AS Total_pizza
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_pizza DESC;

SELECT TOP(5) pizza_name 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC;

SELECT TOP(5) pizza_name 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC;




