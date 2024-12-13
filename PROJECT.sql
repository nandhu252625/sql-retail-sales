use sqlprojectp1;
create table retailsales
(
  transactions_id int primary key,
  sale_date	date,
  sale_time	time,
  customer_id int,
  gender varchar(20),
  age int,
  category varchar(20),
  quantiy int,
  price_per_unit float,
  cogs float,
  total_sale float
  );
 select*from retailsales	
 limit 200;
 select*from retailsales 
 where transactions_id is null
 or sale_date is null
 or sale_time is null
 or customer_id is null
 or gender is null
 or age is null
 or category is null
 or quantiy is null
 or price_per_unit is null
 or cogs is null
 or total_sale is null;
 # DATA EXPLORATION
 -- HOW MANY SALES WE HAVE?
 select count(*)as totalsales from retailsales;
 -- HOW MANY unique CUSTOMERS WE HAVE?
 select count(distinct customer_id)as customers from retailsales;
 -- HOW MANY CATEGORIES WE HAVE?
 select distinct(category) from retailsales;
 -- DATA ANALYSIS BUSINESS KEY PROBLEMS:
 --Q1.WRITE A SQL QUERY TO RETRIEVE ALL COLUMNS FOR SALE ON '2022-11-05';
 
 select*from retailsales where sale_date='2022-11-05';
 
 2 WRITE A SQL QUERY TO RETRIEVE ALL TRANSCATION WHERE CATEGORY IS CLOTHING AND QUANTIY IS SOLD 
 IS MORE THAN 10 IN MONTH OF NOV-2022?
     
select*from retailsales where category='clothing' and quantiy>10 and year(sale_date)='2022';
3.WRITE A SQL QUERY TO FIND THE TOTAL SALES OF EACH CATEGORY?

select category,sum(total_sale)as totalsales from retailsales group by category;
4.WRITE A QUERY TO FIND THE AVERAGE AGE OF CUSTOMERS WHO PURCHASED ITEMS FROM THE BEAUTY CATEGORY?
    select ROUND(avg(age),2) from retailsales where category='Beauty';
5.WRITE A QUERY TO FIND ALL TRANSACTIONS WHERE THE TOTAL SALE IS GREATER THAN 1000?
      select*from retailsales where total_sale>1000 order by total_sale;
6.WRITE A SQL QUERY TO FIND THE TOTAL NUMBER OF TRANSACTION MADE BY EACH GENDER  IN EACH CATEGORY?
      select category,gender,count(*)as totalsales from retailsales group by category,gender order by category;
      
7.write a sql query to calculate the average sale of eachmonth.find out best selling month in year
    select
    year(sale_date)as years,
    month(sale_date)as months,
    avg(total_sale)as totalsales from retailsales
    group by year(sale_date),month(sale_date) order by totalsales desc;
    
8.write a query to find the top5 customers based on highest total sales?
           select 
               customer_id as customers,
               sum(total_sale)as totalsales from retailsales
               group by customers
               order by totalsales desc
               limit 5;

9.WRITE A QUERY TO FIND THE NUMBER OF UNIQUE CUSTOMERS WHO PURCHASED ITEMS FROM EACH CATEGORY?
           select 
               category,count(distinct customer_id) from retailsales
               group by category;
               
10. write a--END OF PROJECT....
    
    
    
    

 
