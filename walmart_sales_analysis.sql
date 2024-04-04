CREATE DATABASE sales_walmart;

USE sales_walmart;


CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL (10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12,4),
    rating FLOAT(2,1)
    );
    
    
    
    
    
-- --------------------------------------------------FEATURE ENGINEERING----------------------------------------------------------

# Adding new column " time_to_day" based on time.
ALTER TABLE sales
ADD COLUMN time_of_day VARCHAR(30); 

SET SQL_SAFE_UPDATES = 0;

UPDATE sales
SET time_of_day = (
	CASE
		WHEN sales.time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN sales.time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
	END
);


# Adding day column " day_name " based on date.
ALTER TABLE sales
ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = (DAYNAME(date));

# Adding month name column " month_name " based on date.
ALTER TABLE sales
ADD COLUMN month_name VARCHAR(20);

UPDATE sales
SET month_name = MONTHNAME(date);


-- ------------------------------------------- GENERIC QUESTIONS -----------------------------------------------------------
# 1. How many unique cities does the data have?

SELECT DISTINCT city 
FROM sales;


# 2. In which city is each branch?
SELECT DISTINCT branch, city 
FROM sales
ORDER BY branch;

-- ---------------------------------------------- PRODUCT ------------------------------------------------------------------------

# 1.How many unique product lines does the data have?

SELECT DISTINCT product_line
FROM sales;

# 2.What is the most common payment method?

SELECT MAX(payment)
FROM sales;


# 3.What is the most selling product line?
SELECT product_line, SUM(quantity) AS qun
FROM sales
GROUP BY product_line
ORDER BY 2 DESC
LIMIT 1;

# 4.What is the total revenue by month?
SELECT month_name, SUM(total) AS tot_revenue
FROM sales
GROUP BY month_name
ORDER BY 2 DESC;

# 5.What month had the largest COGS?
SELECT month_name, SUM(cogs) AS large_cogs
FROM sales
GROUP BY month_name
ORDER BY large_cogs;

# 6.What product line had the largest revenue?
SELECT product_line, SUM(total) AS revenue
FROM sales
GROUP BY product_line
ORDER BY 2 DESC
LIMIT 1;


# 7.What is the city with the largest revenue?
SELECT branch,city, SUM(total) AS revenue
FROM sales
GROUP BY 1, city
ORDER BY 2 DESC
LIMIT 1;


# 8.What product line had the largest VAT?
SELECT product_line, AVG(tax_pct) AS vat
FROM sales
GROUP BY 1
ORDER BY vat DESC;

# 9.Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT product_line, AVG(quantity),
(
	CASE 
		WHEN AVG(quantity) > (SELECT AVG(quantity) FROM sales) THEN "Good"
        ELSE "Bad"
	END
) AS remark
FROM sales
GROUP BY product_line;


# 10.Which branch sold more products than average product sold?
SELECT branch, city, SUM(quantity) AS no_of_prod
FROM sales
GROUP BY 1,2
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

# 11.What is the most common product line by gender?
SELECT gender,product_line,count(gender) AS tot_cnt
FROM sales
GROUP BY 1,2
ORDER BY 1,3 DESC ;


# 12.What is the average rating of each product line?
SELECT product_line,AVG(rating) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY 2 DESC;


-- ------------------------------------ SALES -------------------------------------------------------------

# 1.Number of sales made in each time of the day per weekday
SELECT day_name, time_of_day, COUNT(invoice_id)
FROM sales
GROUP BY 1,2
ORDER BY 3 DESC;


# 2. Which of the customer types brings the most revenue?
SELECT customer_type AS type, SUM(total) AS ren
FROM sales
GROUP BY 1
ORDER BY 2 DESC;


# 3.Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city, AVG(tax_pct) tax_per
FROM sales
GROUP BY city
ORDER BY 2 DESC;

# 4.Which customer type pays the most in VAT?
SELECT customer_type, AVG(tax_pct) tax_per
FROM sales
GROUP BY 1
ORDER BY 2 DESC;



-- ---------------------------- CUSTOMER -------------------------------------------------------

# 1.How many unique customer types does the data have?
SELECT DISTINCT customer_type
FROM SALES;

# 2.How many unique payment methods does the data have?
SELECT DISTINCT payment
FROM SALES;

# 3.What is the most common customer type?
SELECT  MAX(customer_type)
FROM SALES;

# 4.Which customer type buys the most?
SELECT customer_type,SUM(total)
FROM SALES
GROUP BY 1;


# 5.What is the gender of most of the customers?
SELECT MAX(gender)
FROM SALES;

# 6.What is the gender distribution per branch?
SELECT branch, gender, COUNT(gender) as dist
FROM SALES
GROUP BY 1,2
ORDER BY 1;


# 7.Which time of the day do customers give most ratings?
SELECT time_of_day, count(rating)
FROM sales
GROUP BY 1
ORDER BY 1;

# 8.Which time of the day do customers give most ratings per branch?
SELECT branch, time_of_day, count(rating)
FROM sales
GROUP BY 1,2
ORDER BY 1,2;

# 9.Which day fo the week has the best avg ratings?
SELECT day_name, AVG(rating)
FROM sales
GROUP BY 1
ORDER BY 2 DESC ;

# 10.Which day of the week has the best average ratings per branch?
SELECT branch, day_name, AVG(rating)
FROM sales
GROUP BY 1,2
ORDER BY 1,3 DESC ;