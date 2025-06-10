SELECT * FROM online_sales limit 5;

SELECT OrderID, Amount, Profit, Quantity, Category,  
       EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS 
order_month 
FROM online_sales;

SELECT  
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year, 
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month, 
    SUM(Amount) AS total_amount, 
    SUM(Profit) AS total_profit, 
    COUNT(OrderID) AS total_orders 
FROM online_sales
GROUP BY order_year, order_month 
ORDER BY order_year, order_month;

SELECT  
    SUM(Amount) AS total_revenue, 
    SUM(Profit) AS total_profit, 
    COUNT(OrderID) AS total_orders 
FROM online_sales;

SELECT  
    COUNT(DISTINCT OrderID) AS total_order_volume 
FROM online_sales; 

SELECT  
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year, 
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month, 
    SUM(Amount) AS total_revenue, 
    SUM(Profit) AS total_profit, 
    COUNT(DISTINCT OrderID) AS total_order_volume 
FROM online_sales 
WHERE YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) BETWEEN 2015 AND 2017 
GROUP BY order_year, order_month 
ORDER BY order_year, order_month; 

SELECT  
    OrderID, Amount, Profit, Quantity, Category, PaymentMode,  
    STR_TO_DATE(order_date, '%d-%m-%Y') AS formatted_order_date 
FROM online_sales 
WHERE YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) BETWEEN 2015 AND 2020 
ORDER BY formatted_order_date;

SELECT OrderID, Amount, Profit, Quantity, Category, PaymentMode,  
       STR_TO_DATE(order_date, '%d-%m-%Y') AS formatted_order_date 
FROM online_sales 
WHERE YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) BETWEEN 2015 AND 2017 
ORDER BY formatted_order_date 
LIMIT 10;
