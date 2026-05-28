create database sales_project;
use sales_project;

select*from sales_data;

# 1. Retrieve total sales per region

select region, sum(sales) as total_sales
from sales_data
group by region;

# 2. Find top 5 best-selling products

select product_name, sum(quantity) as total_quantity
from sales_data
group by product_name
order by total_quantity desc limit 5;

# 3. Calculate monthly revenue

select year(order_date) as year, month(order_date) as month,
sum(sales) as monthly_revenue
from sales_data
group by year(order_date), month(order_date)
order by year(order_date), month(order_date);

# 4. Identify repeat customers

select customer_name, count(order_id) as total_orders
from sales_data
group by customer_name
having count(order_id) > 1;

# 5.  Find average order value per region

select region, sum(sales) / count(distinct order_id) as avg_order_value
from sales_data
group by region;

# 6. Rank product by sales within each category

select category, product_name, sum(sales) as total_sales,
rank() over(partition by category order by sum(sales) desc) as product_rank
from sales_data
group by category, product_name;

