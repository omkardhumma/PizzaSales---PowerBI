use PizzaDB

select * from pizza_sales;

select round(SUM(total_price),2) as Total_Revenue from pizza_sales;

select round(sum(total_price) / count(distinct order_id),2) as Average_Order_Value from pizza_sales;

select sum(quantity) as Quantity_Sold from pizza_sales;

select count(distinct order_id) as Total_Orders from pizza_sales;

select cast (sum(quantity) as decimal(10,2)) / cast (count(distinct order_id) as decimal(10,2)) as Avrage_pizza_per_Order from pizza_sales;

select DATENAME(WEEKDAY, order_date) as Order_day, count(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(DW, order_date);

select DATENAME(month, order_date) as Order_month, COUNT(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(month, order_date)
order by total_orders desc;

SELECT pizza_category, round(sum(total_price),2) as Total_Sales, concat(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),'%') as PCT
from pizza_sales group by pizza_category;

select pizza_category, sum(quantity) as Total_Quantity
from pizza_sales group by pizza_category order by Total_Quantity desc;

SELECT pizza_size, round(sum(total_price),2) as Total_Sales, concat(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),'%') as PCT
from pizza_sales group by pizza_size order by PCT desc;

select top 5 pizza_name, sum(total_price) as Total_Revenue 
from pizza_sales 
group by pizza_name
order by Total_Revenue desc;

select top 5 pizza_name, sum(total_price) as Total_Revenue 
from pizza_sales 
group by pizza_name
order by Total_Revenue;

select top 5 pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders;

select top 5 pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity;