# Walmart Sales Data Analysis

### About
This project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of of different products, customer behaviour. 
The aims is to study how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

### Purposes Of The Project
The major aim of thie project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.

### Analysis List
#### Product Analysis
> Conduct analysis on the data to understand the different product lines, the products lines performing best and the product lines that need to be improved.

#### Sales Analysis
> This analysis aims to answer the question of the sales trends of product. The result of this can help use measure the effectiveness of each sales strategy the business applies and what modificatoins are needed to gain more sales.

#### Customer Analysis
> This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment.

### Approach Used
1. **Data Wrangling:** This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace, missing or NULL values.
  >1.Build a database
  >2.Create table and insert the data.
  >3.Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.
2. **Feature Engineering:** This will help use generate some new columns from existing ones.
  >1.Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
  
  >2.Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
  
  >3.Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
3. **Exploratory Data Analysis (EDA):** Exploratory data analysis is done to answer the listed questions and aims of this project.

### Conclusion:

**Business Questions To Answer**
**Generic Question**
- How many unique cities does the data have?
- In which city is each branch?
  
**Product**
- How many unique product lines does the data have?
- What is the most common payment method?
- What is the most selling product line?
- What is the total revenue by month?
- What month had the largest COGS?
- What product line had the largest revenue?
- What is the city with the largest revenue?
- What product line had the largest VAT?
- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
- Which branch sold more products than average product sold?
- What is the most common product line by gender?
- What is the average rating of each product line?

**Sales**

- Number of sales made in each time of the day per weekday
- Which of the customer types brings the most revenue?
- Which city has the largest tax percent/ VAT (Value Added Tax)?
- Which customer type pays the most in VAT?

**Customer**

- How many unique customer types does the data have?
- How many unique payment methods does the data have?
- What is the most common customer type?
- Which customer type buys the most?
- What is the gender of most of the customers?
- What is the gender distribution per branch?
- Which time of the day do customers give most ratings?
- Which time of the day do customers give most ratings per branch?
- Which day fo the week has the best avg ratings?
- Which day of the week has the best average ratings per branch?
