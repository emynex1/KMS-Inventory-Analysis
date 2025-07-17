SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'KMS_Clean';

SELECT 
    Product_Category,
    Customer_Segment,
    SUM(Order_Quantity) AS Total_Quantity,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.KMS_Clean
GROUP BY Product_Category, Customer_Segment
ORDER BY Total_Sales DESC;

SELECT TOP 5 
    Product_name, 
    SUM(Profit) AS Total_Profit
FROM 
    dbo.KMS_Clean
GROUP BY 
    Product_name
ORDER BY 
    Total_Profit DESC;


	SELECT 
    Product_Category,
    AVG(Discount) AS Average_Discount_Percentage
FROM 
    dbo.KMS_Clean
GROUP BY 
    Product_Category
ORDER BY 
    Average_Discount_Percentage DESC;

	SELECT 
    Product_Category,
    COUNT(DISTINCT Product_Name) AS Number_of_Products
FROM 
    dbo.KMS_Clean
GROUP BY 
    Product_Category;

	SELECT 
    Product_Category,
    SUM(Sales) AS Total_Sales
FROM 
    dbo.KMS_Clean
GROUP BY 
    Product_Category
ORDER BY 
    Total_Sales DESC;

	SELECT [Region], 
       SUM([Sales]) AS TotalSales
FROM dbo.KMS_Clean
GROUP BY [Region]
ORDER BY TotalSales DESC;

SELECT DISTINCT Product_Category FROM dbo.KMS_Clean;

SELECT DISTINCT Product_Sub_Category FROM dbo.KMS_Clean;

SELECT 
    SUM(Sales) AS Total_Appliance_Sales_Ontario
FROM 
    dbo.KMS_Clean
WHERE 
    Product_Sub_Category = 'Appliances'
    AND Province = 'Ontario';

	SELECT TOP 10 Customer_Name, SUM(Sales) AS Total_Sales
FROM dbo.KMS_Clean
GROUP BY Customer_Name
ORDER BY Total_Sales ASC

SELECT 
    Ship_Mode,
    SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM 
    dbo.KMS_Clean
GROUP BY 
    Ship_Mode
ORDER BY 
    Total_Shipping_Cost DESC;

	-- Step 1: Get top 10 most valuable customers by total sales
SELECT TOP 10 
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM dbo.KMS_Clean
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;

SELECT 
    Customer_Name,
    Product_Category,
    Product_Sub_Category,
    SUM(Sales) AS Total_Sales
FROM dbo.KMS_Clean
WHERE Customer_Name IN (
    'Emily Phan', 'Deborah Brumfield', 'Roy Skaria', 'Sylvia Foulston',
    'Grant Carroll', 'Alejandro Grove', 'Darren Budd', 'Julia Barnett',
    'John Lucas', 'Liz MacKendrick'
)
GROUP BY Customer_Name, Product_Category, Product_Sub_Category
ORDER BY Customer_Name, Total_Sales DESC;

SELECT TOP 1 
    Customer_Name, 
    SUM(Sales) AS Total_Sales
FROM 
    dbo.KMS_Clean
WHERE 
    Customer_Segment = 'Small Business'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Sales DESC;

	SELECT TOP 1 Customer_Name, COUNT(DISTINCT Order_ID) AS Total_Orders
FROM dbo.KMS_Clean
WHERE Customer_Segment = 'Corporate'
  AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY Customer_Name
ORDER BY Total_Orders DESC;


SELECT TOP 1 
    Customer_Name, 
    SUM(Profit) AS Total_Profit
FROM 
    dbo.KMS_Clean
WHERE 
    Customer_Segment = 'Consumer'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Profit DESC;

