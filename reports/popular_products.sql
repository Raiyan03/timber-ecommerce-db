rem Final Project - Prototype System
set echo on
set linesize 150
set pagesize 66
spool c:/cprg250/RA_PopularProductReport/RA_PopularProductReport.txt


-- Report: Most Popular Products Report
-- Description: This report will show a sorted list of the most popular
			 -- products based on order history.
-- Columns Used: product#, title, quantity, order#
-- Author: Raiyan Anwar

select product_number as "Product#", 
	   title as "Title", 
	   count(order_number) AS "Total Orders", 
	   sum(quantity) as "Quantity Ordered"
From tim_order_product
	Join tim_product USING (product_number)
Group by product_number, title
Order by count(order_number) desc, sum(quantity) desc;

spool off