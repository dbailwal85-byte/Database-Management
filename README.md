create database industry;
use industry;
CREATE TABLE today
	(
		sale_id INT PRIMARY KEY,
        product VARCHAR(50),
        category VARCHAR(50),
        quantity INT,
        price DECIMAL(10,2),
        region VARCHAR (50),
        salesperson VARCHAR (50),
        sale_date DATE
    );
INSERT INTO today (sale_id,product,category,quantity,price,region,salesperson,sale_date)
VALUES
		(1,"Laptop","Electronics",5,50000,"East","John","2024-01-05"),
        (2,"Mobile","Electronics",10,20000,"West","Mary","2024-01-10"),
        (3,"Chair","Furniture",20,1500,"East","John","2024-02-15"),
        (4,"Table","Furniture",8,5000,"North","Steve","2024-02-18"),
        (5,"Laptop","Electronics",7,55000,"South","Mary","2024-03-01"),
        (6,"Mobile","Electronics",15,18000,"East","John","2024-03-05"),
        (7,"Sofa","Furniture",3,25000,"West","Steve","2024-03-20"),
        (8,"Laptop","Electronics",2,52000,"North","Mary","2024-04-02"),
        (9,"Chair","Furniture",30,1200,"South","John","2024-04-12"),
        (10,"mobile","Electronics",12,22000,"West","Steve","2024-04-15");

select * from today;

select*from industry.today;

#1-Find total sales amount for each region.
select region ,
sum(price) as total_sales from today group by region;

#2- Find total quantity sold by each salesperson.
select salesperson,
sum(quantity) as total_quantity from today group by salesperson;

#3- Show categories where total quantity sold is more than 30.
select category,
sum(quantity) as total_quantity from today group by category having sum(quantity)>30;

#4-Find total revenue by each category.
select category,
sum(quantity*price) as total_revenue
from today group by category;

#5-Find salesperson who sold total quantity more than 20.
select salesperson,
sum(quantity) as total_quantity
from today group by salesperson
having sum(quantity)>20;

#6-Find region-wise average sale price. 
select region,
avg(price) as average_price
from today
group by region;

#7-Find total revenue for each salesperson and show only those having revenue above$300000.
select salesperson,
sum(quantity*price) as total_revenue
from today
group by salesperson
having sum(quantity*price)>300000;

#8-Find how many products each category has.
select category,
count(product) as total_products
from today
group by category;

#9-Find total sales per month. 
select month(sale_date),
sum(quantity*price) as total_sales
from today
group by month(sale_date)
order by month(sale_date);

#10-Find each region's maximum sale price.
select region,
max(price) as max_sale_price
from today
group by region;

#11-Find each category's average quantity sold,but show only where avg>10.
select category,
avg(quantity) as avg_quantity
from today
group by category
having avg(quantity)>10;

#12-Find total revenue by region and category.
select region,category,
sum(quantity*price)as total_revenue
from today
group by region,category
order by region,total_revenue DESC;

#13-Find how many sales each salesperson made in each region.
Select region,salesperson,
count(*) as total_sales
from today
group by region,salesperson
order by region,total_sales DESC;

#14-Find the region where total quantity sold exceeds20.
select region,
sum(quantity) as total_quantity
from today
group by region
having sum(quantity)>20;

#15-Find salesperson who sold in more than one region.
select salesperson,
count(distinct region) as region_count
from today
group by salesperson
having count(distinct region)> 1;

#16-Find category having total revenuue between $200000 and $1000000.
select category,
sum(quantity*price) as total_revenue
from today
group by category
having total_revenue between 200000 and 1000000;

#17-Find top 1 category with the highest total sales;
select category,sum(quantity*price)as total_sales
from today
group by category
order by total_sales DESC;

#18-Find salesperson's average sale value per transaction.
select salesperson,AVG(quantity*price) as avg_sale_value
from today
group by salesperson;

#19-Find category with minimum average price greater than 20000.
select category,avg(price) as avg_price
from today group by category
having avg(price)>20000
order by avg_price ASC;

#20-Find region and sales person combination where revenue>200000.
select region,salesperson,
sum(quantity*price) as total_revenue
from today group by region,salesperson
having sum(quantity*price)>200000;
