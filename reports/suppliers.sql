rem Final Project - Prototype System
set echo on
set linesize 150
set pagesize 66
spool c:/cprg250/RA_SuppliersReport/RA_SuppliersReport.txt


-- Report: Suppliers Report
-- Description: This report will display all suppliers and the products they provide
-- Columns Used: Supplier#, suppliername, title, product#
-- Author: Raiyan Anwar

COLUMN Supplier# Format 999;
COLUMN Name FORMAT A30;
COLUMN Title FORMAT A30;
COLUMN Product# FORMAT 999;
BREAK ON Supplier# ON "Name"
Select Supplier_number as "Supplier#", 
	   name as "Name", 
	   product_number as "Product#", 
	   title as "Title"
from TIM_SUPPLIER
	JOIN tim_supplier_product USING(Supplier_Number)
	JOIN tim_Product USING(Product_Number)
order by name;
clear breaks

spool off