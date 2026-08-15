select* from Orders

--Find the total rows present in every table.
select count(*)
from Orders
select count(*)
from People
select count(*) 
from Returns

--Find the number od null present in sales and profit column.
select count(*)-count(sales)
from Orders
select count(*)-count(Profit)
from Orders


--Total Sales and Total Profit for every Region.
select Region,sum(Sales) as total_sales,sum(Profit) as total_Profit
from Orders
group by Region
order by total_Profit

--Total Profit,Sales and Average Discount per each Sub-Category.
select [Sub_Category],sum(Sales) as total_sales,sum(Profit) as total_Profit,AVG(Discount) as avg_discount
from Orders
group by [Sub_Category]
order by total_Profit 


--Return rate per Category.
select o.Category,count(r.Order_ID) as returned_orders,
       count(o.Order_ID) as total_orders,
	   100.0*count(r.Order_ID)/count(o.Order_ID) as Return_Rate
from Orders o
left join Returns r
on o.Order_ID=r.Order_ID
group by o.Category

--what were the top 5 sub-categories and their profit numbers?
select TOP 5 [Sub_Category],sum(Profit) as total_Profit
from Orders
group by [Sub_Category]
Order by total_Profit DESC

--Monthly sales trend.
select MONTH(Order_Date)as month ,sum(Sales) as total_sales
from Orders
group by MONTH(Order_Date)
order by month DESC

--Top 10 costumers by sales .
select Top 10 Customer_ID,sum(Sales) as total_sales
from Orders
group by Customer_ID
order by total_sales DESC

--Profit margin by segment.
select Segment, (sum(Profit)/sum(Sales)*100) as Profit_margin
from Orders
group by Segment
order by Profit_margin desc

/*
. Central region has the lowest profit
. Tables (Furniture) is the least profitable sub-category — a margin issue, not just discount abuse 
  (Machines has a higher discount but isn't as unprofitable)
. Return rates are consistent (~8%) across all categories, no outlier
. December has the highest sales (holiday season pattern)
. Home Office segment has the best profit margin, despite likely not having the highest raw sales
*/


--Rank products within each category by profit
WITH product_profit AS (
    SELECT Category, Product_Name, SUM(Profit) AS total_profit
    FROM Orders
    GROUP BY Category, Product_Name
)
SELECT Category, Product_Name, total_profit,
       RANK() OVER (PARTITION BY Category ORDER BY total_profit DESC) AS profit_rank
FROM product_profit

--
with Monthly_Sales as (
SELECT MONTH(Order_Date) AS month, SUM(Sales) AS total_sales
FROM Orders
GROUP BY MONTH(Order_Date))
select month , SUM(total_sales) OVER (ORDER BY month) AS running_total
from Monthly_Sales 

--Find all orders where Sales is greater than the overall average Sales across all orders.
select *
from Orders
where Sales>(select avg(Sales) from Orders)

