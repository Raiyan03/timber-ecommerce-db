rem Final Project - Prototype System
set echo on
set linesize 150
set pagesize 66
spool c:/cprg250/RA_AllProductsReport/RA_AllProductsReport.txt





-- Report: All Products Report
-- Description: This report will show all the products with their information
-- Columns Used: product#, name, title, description, price, weight
-- Author: Raiyan Anwar

COLUMN Title FORMAT A30;
COLUMN Description FORMAT A50;
COLUMN Category FORMAT A20;
COLUMN Product# FORMAT 9999;
COLUMN Weight FORMAT 9999.99;
Select product_number as "Product#", 
	   name as "Category", 
	   title as "Title", 
	   description as "Description", 
	   TO_CHAR(price, 'FM$99990.00') AS "Price",
       TO_CHAR(weight, 'FM9990.00') AS "Weight"
from tim_product
	join Tim_Category USING(CATEGORY_NUMBER)
ORDER BY product_number;

spool off