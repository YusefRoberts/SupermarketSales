--Calculate the total sales for each branch, sorted by total sales in descending order:

SELECT Branch, SUM(Total) AS total_sales
FROM sales
GROUP BY Branch
ORDER BY total_sales DESC;

--Calculate the average unit price for each product line, grouped by gender:

SELECT Gender, Product_line, AVG(Unit_price) AS avg_unit_price
FROM sales
GROUP BY Gender, Product_line;

--Calculate the total quantity sold for each product line, filtered by payment type:

SELECT Product_line, SUM(Quantity) AS total_quantity
FROM sales
WHERE Payment IN ('Cash', 'Credit Card')
GROUP BY Product_line;

--Calculate the total tax collected for each branch, grouped by city and customer type:

SELECT City, Customer_type, SUM(Tax_5%) AS total_tax
FROM sales
GROUP BY City, Customer_type;

--Calculate the total cogs (cost of goods sold) for each branch, filtered by invoice date:

SELECT Branch, SUM(cogs) AS total_cogs
FROM sales
WHERE Date BETWEEN '2022-01-01' AND '2022-03-31'
GROUP BY Branch;

--Calculate the gross margin percentage for each branch, sorted by gross margin percentage in ascending order:

SELECT Branch, (SUM(gross_income) - SUM(cogs)) / SUM(gross_income) AS gross_margin_percentage
FROM sales
GROUP BY Branch
ORDER BY gross_margin_percentage ASC;

--Calculate the total gross income for each branch, filtered by rating greater than or equal to 4:

SELECT Branch, SUM(gross_income) AS total_gross_income
FROM sales
WHERE Rating >= 4
GROUP BY Branch;

--Calculate the average rating for each branch, grouped by gender and customer type:

SELECT Gender, Customer_type, AVG(Rating) AS avg_rating
FROM sales
GROUP BY Gender, Customer_type;

--Create a pivot table to compare the total sales for each branch by customer type and payment type:

SELECT *
FROM (
  SELECT Branch, Customer_type, Payment, SUM(Total) AS total_sales
  FROM sales
  GROUP BY Branch, Customer_type, Payment
) AS sales_by_branch_and_customer_type
PIVOT (
  SUM(total_sales)
  FOR Payment IN (Cash, Credit Card)
) AS pivot_table;