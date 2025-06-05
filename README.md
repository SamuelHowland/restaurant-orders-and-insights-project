# App Delivery Restaurant Orders Project

This project is an exploratory analysis of restaurant sales and customer satisfaction performance using data which have been captured through orders made on a food delivery app. The goal is to draw insights and conclusions to benefit the food delivery management team to discover what could influence higher restaurant sales and better customer ratings by comparing data metrics such as restaurants, zones, cuisines, delivery time and quality, and customer food ratings.

---

## Project Objectives

- Demonstrate data project workflow, supported by clear documentation.
- Use technology to clean, analyse, and visualise data in a clear format.
- Generate strategic business insights.

---

## Datasets

The data used is hypothetical and represents 500 orders placed across 20 restaurants on a food delivery platform over the course of a single day (01/01/2022). It consists of two relational datasets, one detailing orders, and the other containing restaurant information where orders were placed. The datasets are linked via the 'restaurant_id' key.

- Source: Kaggle (https://www.kaggle.com/datasets/mohamedharris/restaurant-order-details) (not originally created by me)

- Datasets were intentionally dirtied for basic data cleaning.  
- Dataset limitation towards the end of this document.

---

## Technologies Used

- Kaggle  
- PostgreSQL  
- DBeaver  
- Microsoft Excel  
- Power BI  
- GitHub

---

## Project Files

All files are available in the GitHub repository under their respective folders:

/dashboard
	- restaurant_orders_dashboard.pbix

/data
	- dirty_orders.csv
	- dirty_restaurants.csv

/images:
	- cleaned_orders_table.png
	- cleaned_restaurants_table.png
	- dashboard_screenshot.png
	- dirty_orders_table.png
	- dirty_restaurants_table.png
	- q1a.png
	- q2a.png
	- q3a.png
	- q4a.png
	- q4b.png
	- q5a.png

/sql:
	- 01_clean_restaurants.sql
	- 02_clean_orders.sql
	- 03_rank_restaurants_by_revenue.sql
	- 04_avg_customer_food_rating.sql
	- 05_revenue_per_zone.sql
	- 06_avg_per_cuisine.sql
	- 07_restaurants_per_cuisine.sql
	- 08_order_delivery_speed.sql

- README.md

---

## Data Cleaning

### Dirtying Changes Made

| Column | Change |

| 'restaurant_name', 'payment_mode'                  | Added extra spaces      |
| 'cuisine', 'payment_mode'                          | Mixed casing            |
| 'order_date'                                       | Slash/dash format mixed |
| 'customer_rating_food', 'customer_rating_delivery' | Removed values          |

### Cleaning Changes Made

In DBeaver text fields like cuisine, payment_mode, and zone were converted as text or varchar, and numerical fields like order_amount and numerical fields like order_amount and the rating columns were stored as integers, since the data only included whole numbers. order_date is now stored as date. Blank rating values were converted to NULL.

---

## Analysis Questions

- Q1a. Which restaurants generated the most revenue, and is there a link between the number of fulfilled orders?  
- Q2a. Is there a relationship between customer food ratings and how well a restaurant's sales perform?  
- Q3a. How does restaurant performance differ across the four delivery zones?  
- Q4a. Which cuisine types tend to generate the highest average order spends, and how do they compare in terms of customer food satisfaction?  
- Q4b. Are there any patterns between cuisines and the total number of representing restaurants?  
- Q5a. Does the speed of delivery have any impact on customer food ratings?

---

## Key Insights

- Q1a: 'Veer Restaurant' generated the highest sales, totalling £19,168 across 29 orders, generating more sales than 'The Cave Hotel' which completed 32 orders – indicating higher average order spend. 'The Taste' ranked 13th in sales despite fulfilling only 18 orders, generating £12,982 – another indication of high average spend per order. While it's expected that more orders lead to higher sales, outliers such as ‘The Taste’ demonstrate that other factors outside of high order count can drive higher average spend.

- Q2a: 'Vrinda Bhavan' had the highest average customer food rating of 3.85 with the lowest total sales of £9,772 across all 20 restaurants. Comparatively, 'Veer Restaurant' had a low average customer food rating of 3, ranking 19 out of 20 restaurants, but with the highest total sales per restaurant of £19,168. Overall, the data indicates there is no strong correlation between average customer food rating and total sales.

- Q3a: Zone D has the highest number of restaurants (9 total) across all 4 zones, with the highest total sales of £128,163 across all orders. Zone A and C have 3 stores with a total order spend of £40,833 and £53,074. This supports that more restaurants per zone lead to higher sales. Zone C has the highest average restaurant spend of £617.14 – indicating that fewer restaurants per zone can still perform strongly individually.

- Q4a: Arabian Cuisine generated the highest average sale per order of £664.88 with the lowest average food rating of 3.14 across all 8 total cuisines. Comparatively, African cuisine had the highest average food rating of 3.5 but ranked 5th in average order amount. The difference in average food rating is minimal, but similar to Q2, this data supports that higher food ratings, for individual restaurants or cuisines, don’t heavily impact higher average order total.

- Q4b: Cuisines with fewer total restaurants – such as Arabian, Belgian, and Continental – generally have higher average order spend than more represented cuisines like North Indian, Chinese, and South Indian.

- Q5a: Slow speed deliveries had the highest average food rating of 3.38, medium speed had 3.36, and quick had 3.22. This suggests that slower deliveries generally had higher food quality, but the average rating between all speeds is minimal, so delivery time may not be a large contributing factor in relation to food quality.

---

## Dashboard

A Power BI dashboard has been created to visualise the insights of the SQL analysis. Each chart included supports a business question. Filters allow for dynamic breakdowns by cuisine and zone.

---

## Conclusion and recommendations

The insights suggest that high sales aren’t solely due to high order volume – some restaurants brought in strong revenue from fewer orders, due to higher average spend. Food ratings didn’t seem to influence sales, so other factors like pricing, zonal restaurant scarcity, or loyalty could be more important when influencing sales.

Zones with more restaurants brought in more sales overall, but some zones with fewer locations still performed well individually. Less common cuisines showed higher average order spend, possibly because of niche restaurant representation or higher pricing. Exploring marketing underrepresented cuisines more prominently or adding more niche restaurants to the platform portfolio could increase order volume or open opportunities to enter untapped markets.

Delivery speed had minimal impact on food ratings, suggesting that faster delivery does not necessarily lead to higher customer food satisfaction. Indicating that customer perception of food received could be influenced more by dish quality, preparation standards, delivery packaging and practices, or price.

---

## Project Limitation

The data used has 500 rows and covers orders across a single day, which provides a snapshot of restaurant activity and may not be indicative of average business performance.

---

## Next Steps

This project was created to primarily demonstrate SQL query proficiency and an understanding of how to structure analysis around business-relevant questions. While the insights are limited by the dataset's size and timeframe, the project demonstrates analysis workflow and the ability to generate insights from data.

To build on this, using a larger dataset across multiple a larger time frame would allow for more data to be collected leading to more accurate representation of business, enabling potentially more valuable insight to be uncovered.
