USE ecommerce;

CREATE TABLE sales_data (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code FLOAT,
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name TEXT,
    Sales FLOAT
);
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/train.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Customer_Name, Segment, Country, City, State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name, Sales);

DROP TABLE sales_data;

CREATE TABLE sales_data (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),   -- ✅ changed
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name TEXT,
    Sales FLOAT
);

SELECT COUNT(*) FROM sales_data;

SELECT SUM(Sales) FROM sales_data;

SELECT Region, SUM(Sales) 
FROM sales_data
GROUP BY Region
ORDER BY SUM(Sales) DESC;

SELECT Category, SUM(Sales)
FROM sales_data
GROUP BY Category
ORDER BY SUM(Sales) DESC;

SELECT Customer_Name, SUM(Sales)
FROM sales_data
GROUP BY Customer_Name
ORDER BY SUM(Sales) DESC
LIMIT 10;

SELECT YEAR(Order_Date) AS Year, MONTH(Order_Date) AS Month, SUM(Sales)
FROM sales_data
GROUP BY Year, Month
ORDER BY Year, Month;

SELECT * FROM sales_data;