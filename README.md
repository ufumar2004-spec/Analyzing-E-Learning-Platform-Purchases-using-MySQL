# Analyzing-E-Learning-Platform-Purchases-using-MySQL

## Project Overview

This project analyzes purchase data from an e-learning platform using MySQL. The goal is to extract meaningful business insights related to learner behavior, course performance, and revenue trends.
Instead of just storing data, the project focuses on answering real business questions using SQL.


## Objectives
• Design a relational database with proper relationships

• Analyze learner purchase behavior

• Identify top-performing courses and categories

• Detect inactive or underperforming courses

• Generate insights to support business decisions


## Database Schema
• 1. Learners Table
learner_id (Primary Key,auto_increment)
full_name
country

• 2. Courses Table
course_id (Primary Key,auto_increment)
course_name
category
unit_price

• 3. Purchases Table
purchase_id (Primary Key,auto_increment)
learner_id (Foreign Key)
course_id (Foreign Key)
quantity
purchase_date


##  SQL Concepts Used
• Joins: INNER JOIN, LEFT JOIN, RIGHT JOIN

• Aggregations: SUM(), COUNT()

• Grouping: GROUP BY

• Filtering: HAVING, WHERE

• Aliases for readability

• Sorting and ranking results


## Analytical Queries Performed
1. Learner Spending Analysis
     •Total spending per learner
     •Identifies high-value customers

2. Top Selling Courses
     •Top 3 courses based on total quantity sold
   
3. Category Performance
      •Revenue generated per category
      •Number of unique learners per category
   
5. Multi-Category Learners
      •Learners purchasing across different categories
   
7. Inactive Courses
      •Courses with zero purchases
   

## Key Business Insights
• A small number of courses generate most of the revenue

• Some categories perform significantly better than others

• Certain courses have zero sales → need promotion or improvement

• Highly engaged learners tend to buy across multiple categories


## Business Recommendations
• Promote low-performing or unsold courses

• Focus marketing on high-revenue categories

• Offer discounts to inactive learners

• Bundle popular courses to increase sales


## Conclusion 

This project shows how SQL can be used to convert raw data into actionable insights. By analyzing learner purchases, it identifies top-performing courses, underperforming areas, and customer behavior patterns, enabling better business decisions.
