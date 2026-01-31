rem Timber populate data 
rem

set echo on
set linesize 150
set pagesize 66

spool c:/cprg250s/timberpopulatedata.txt

--delete the children tables in order
DELETE tim_customer_review;
DELETE tim_order_product;
DELETE tim_supplier_product;
DELETE tim_order;
DELETE tim_product;
--then delete the parent tables
DELETE tim_category;
DELETE tim_customer;
DELETE tim_supplier;
DELETE tim_tax_rate;
DELETE tim_shipping_rate;


--set def off

-- insert data into tim_shipping_rate

insert into tim_shipping_rate values (0, 5, 9.95);
insert into tim_shipping_rate values (5, 10, 19.95);
insert into tim_shipping_rate values (10, 20, 39.95);
insert into tim_shipping_rate values (20, 100, 79.95);


-- insert data into tim_tax_rate

insert into tim_tax_rate values ('AB', 0.05, NULL, NULL);
insert into tim_tax_rate values ('BC', NULL, 0.07, 0.07);
insert into tim_tax_rate values ('MB', 0.05, NULL, 0.07);
insert into tim_tax_rate values ('NB', NULL, 0.15, NULL);
insert into tim_tax_rate values ('NL', NULL, 0.15, NULL);

insert into tim_tax_rate values ('NT', 0.05, NULL, NULL);
insert into tim_tax_rate values ('NS', NULL, 0.15, NULL);
insert into tim_tax_rate values ('NU', 0.05, NULL, NULL);
insert into tim_tax_rate values ('ON', NULL, 0.13, NULL);
insert into tim_tax_rate values ('PE', NULL, 0.15, NULL);

insert into tim_tax_rate values ('QC', 0.05, NULL, 0.09975);
insert into tim_tax_rate values ('SK', 0.05, NULL, 0.06);
insert into tim_tax_rate values ('YT', 0.05, NULL, NULL);


-- insert data into tim_supplier

insert into tim_supplier values (1, 'ABC Electronics', 'abc@example.com', 'Toronto', 'ON');
insert into tim_supplier values (2, 'XYZ Supplies', 'xyz@example.com', 'Vancouver', 'BC');
insert into tim_supplier values (3, 'Tech Solutions', 'tech@example.com', 'Calgary', 'AB');
insert into tim_supplier values (4, 'Smart Gadgets', 'smart@example.com', 'Montreal', 'QC');


-- insert data into tim_customer

insert into tim_customer values (1, 'John', 'Smith', '123.456.7890', '123 Main St', 'Toronto', 'ON', 'M1A2B3', 'john.smith@example.com', 1);
insert into tim_customer values (2, 'Mary', 'Johnson', '456.789.0123', '456 Oak Ave', 'Vancouver', 'BC', 'V6E1R8', 'mary.j@example.com', 0);
insert into tim_customer values (3, 'David', 'Lee', '789.012.3456', '789 Pine Blvd', 'Calgary', 'AB', 'T2P4V5', 'david.lee@example.com', 1);
insert into tim_customer values (4, 'Emily', 'White', '234.567.8901', '234 Cedar St ', 'Montreal', 'QC', 'H3A1T1', 'emily.white@example.com', 0);
insert into tim_customer values (5, 'Michael', 'Davis', '567.890.1234', '567 Birch Rd', 'Halifax', 'NS', 'B3H2P9', 'michael.d@example.com', 1);
insert into tim_customer values (6, 'Laura', 'Turner', '890.123.4567', '890 Elm Ave ', 'Regina', 'SK', 'S4P0K1', 'laura.turner@example.com', 0);
insert into tim_customer values (7, 'Brian', 'Miller', '012.345.6789', '012 Maple Blvd ', 'Ottawa', 'ON', 'A1B2C3', 'brian.miller@example.com', 1);
--End of ChatGPT code


-- insert data into tim_category

insert into tim_category values (1, 'Electronics', NULL);
insert into tim_category values (2, 'Phones', 1);
insert into tim_category values (3, 'Laptops', 1);
insert into tim_category values (4, 'Smartphones', 2);
insert into tim_category values (5, 'Gaming Laptops', 3);

insert into tim_category values (6, 'Clothing', NULL);
insert into tim_category values (7, 'Men Apparel', 6);
insert into tim_category values (8, 'Women Apparel', 6);
insert into tim_category values (9, 'Shoes', 6);
insert into tim_category values (10, 'Boots', 9);
--End of ChatGPT code


-- insert data into tim_product

insert into tim_product values (1, 1, 'Smart TV', 'High-definition smart television', 599.99, 20.5, 0);
insert into tim_product values (2, 4, 'iPhone 13', 'Latest iPhone with advanced features', 999.99, 0.5, 0);
insert into tim_product values (3, 5, 'Gaming Laptop', 'Powerful laptop for gaming enthusiasts', 1299.99, 6.8, 0);
insert into tim_product values (4, 4, 'iPhone SE', 'Compact and affordable iPhone', 499.99, 0.4, 0);
insert into tim_product values (5, 5, 'Gaming Laptop Pro', 'Professional gaming laptop with advanced specs', 1599.99, 7.2, 0);
insert into tim_product values (6, 7, 'Men T-Shirt', 'Comfortable cotton T-shirt for men', 19.99, 0.3, 0);
insert into tim_product values (7, 7, 'Men Jeans', 'Stylish denim jeans for men', 39.99, 1.2, 0);
insert into tim_product values (8, 8, 'Women Dress', 'Elegant dress for women', 49.99, 0.8, 0);
insert into tim_product values (9, 9, 'Running Shoes', 'Lightweight running shoes for sports', 79.99, 0.6, 0);
insert into tim_product values (10, 10, 'Hiking Boots', 'Durable boots for outdoor adventures', 89.99, 1.5, 0);
insert into tim_product values (11, 1, '4K Monitor', 'Ultra-high-definition computer monitor', 349.99, 12.3, 0);
insert into tim_product values (12, 2, 'Android Smartphone', 'Feature-rich Android smartphone', 799.99, 0.7, 0);
insert into tim_product values (13, 3, 'Convertible Laptop', 'Versatile laptop with 360-degree hinge', 899.99, 4.5, 0);
insert into tim_product values (14, 4, 'Budget Smartphone', 'Affordable smartphone with essential features', 299.99, 0.6, 0);
insert into tim_product values (15, 5, 'Portable Gaming Console', 'Compact gaming console for on-the-go gaming', 299.99, 0.9, 0);
insert into tim_product values (16, 7, 'Men Sweater', 'Warm and stylish sweater for men', 29.99, 0.6, 0);
insert into tim_product values (17, 7, 'Men Shorts', 'Casual shorts for men', 24.99, 0.4, 0);
insert into tim_product values (18, 8, 'Evening Gown', 'Elegant gown for special occasions', 129.99, 1.0, 0);
insert into tim_product values (19, 9, 'Casual Sneakers', 'Comfortable sneakers for everyday wear', 59.99, 0.5, 0);
insert into tim_product values (20, 10, 'Winter Boots', 'Insulated boots for cold weather', 79.99, 1.8, 0);

-- insert data into tim_order

insert into tim_order values (1, '05-Feb-23', '07-Feb-23', 'ON', NULL, NULL, 1);
insert into tim_order values (2, '07-Feb-23', '10-Feb-23', 'ON', NULL, NULL, 1);
insert into tim_order values (3, '08-Feb-23', '11-Feb-23', 'BC', NULL, NULL, 2);
insert into tim_order values (4, '08-Feb-23', '12-Feb-23', 'QC', NULL, NULL, 4);
insert into tim_order values (5, '18-Feb-23', '22-Feb-23', 'NS', NULL, NULL, 5);
insert into tim_order values (6, '05-Mar-23', '10-Mar-23', 'NS', NULL, NULL, 5);
insert into tim_order values (7, '15-Mar-23', '18-Mar-23', 'ON', NULL, NULL, 7);
insert into tim_order values (8, '06-Apr-23', '08-Apr-23', 'ON', NULL, NULL, 1);
insert into tim_order values (9, '11-May-23', '16-May-23', 'BC', NULL, NULL, 2);
insert into tim_order values (10, '27-May-23', '01-Jun-23', 'QC', NULL, NULL, 4);

-- insert data into tim_supplier_product

insert into tim_supplier_product values (1 , 1);
insert into tim_supplier_product values (1 , 2);
insert into tim_supplier_product values (1 , 3);
insert into tim_supplier_product values (1 , 4);
insert into tim_supplier_product values (1 , 5);

insert into tim_supplier_product values (2 , 4);
insert into tim_supplier_product values (2 , 5);
insert into tim_supplier_product values (2 , 6);
insert into tim_supplier_product values (2 , 7);
insert into tim_supplier_product values (2 , 8);

insert into tim_supplier_product values (3 , 9);
insert into tim_supplier_product values (3 , 10);
insert into tim_supplier_product values (3 , 11);
insert into tim_supplier_product values (3 , 12);
insert into tim_supplier_product values (3 , 13);

insert into tim_supplier_product values (4 , 14);
insert into tim_supplier_product values (4 , 15);
insert into tim_supplier_product values (4 , 16);
insert into tim_supplier_product values (4 , 17);
insert into tim_supplier_product values (4 , 18);

insert into tim_supplier_product values (4 , 19);
insert into tim_supplier_product values (4 , 20);
insert into tim_supplier_product values (3 , 19);
insert into tim_supplier_product values (2 , 18);
insert into tim_supplier_product values (1 , 17);

-- insert data into tim_order_product

insert into tim_order_product values (1, 1, 1);
insert into tim_order_product values (1, 2, 1);
insert into tim_order_product values (1, 3, 2);
insert into tim_order_product values (1, 4, 1);
insert into tim_order_product values (1, 5, 1);

insert into tim_order_product values (2, 2, 1);
insert into tim_order_product values (2, 14, 1);
insert into tim_order_product values (2, 20, 1);

insert into tim_order_product values (3, 3, 1);
insert into tim_order_product values (3, 7, 1);

insert into tim_order_product values (4, 9, 1);

insert into tim_order_product values (5, 18, 3);

insert into tim_order_product values (6, 13, 1);

insert into tim_order_product values (7, 9, 1);

insert into tim_order_product values (8, 1, 3);

insert into tim_order_product values (9, 20, 1);

insert into tim_order_product values (10, 8, 1);

UPDATE tim_order o
SET tax_amount = (
    SELECT SUM(p.Price * op.Quantity* (NVL(tr.GST, 0) + NVL(tr.HST, 0) + NVL(tr.PST, 0)))
    FROM tim_order_product op
    JOIN tim_product p ON op.Product_Number = p.Product_Number
	JOIN TIM_TAX_RATE tr ON o.Province = tr.Province
    WHERE op.Order_Number = o.Order_Number
);


UPDATE tim_order o
SET Total_Weight = (
    SELECT SUM(p.Weight * op.Quantity)
    FROM tim_order_product op
    JOIN tim_product p ON op.Product_Number = p.Product_Number
    WHERE op.Order_Number = o.Order_Number
);

-- insert data into tim_customer_review

insert into tim_customer_review values (1, 4, TO_DATE('2023-01-05', 'YYYY-MM-DD'), 'Great product!', 1, 1);
insert into tim_customer_review values (2, 5, TO_DATE('2023-02-10', 'YYYY-MM-DD'), 'Excellent service and quality.', 2, 2);
insert into tim_customer_review values (3, 3, TO_DATE('2023-03-15', 'YYYY-MM-DD'), 'Average experience.', 3, 3);
insert into tim_customer_review values (4, 2, TO_DATE('2023-04-20', 'YYYY-MM-DD'), 'Disappointed with the product.', 4, 4);
insert into tim_customer_review values (5, 5, TO_DATE('2023-05-25', 'YYYY-MM-DD'), 'Superb!', 5, 5);
insert into tim_customer_review values (6, 4, TO_DATE('2023-06-30', 'YYYY-MM-DD'), 'Good value for money.', 1, 6);
insert into tim_customer_review values (7, 3, TO_DATE('2023-07-05', 'YYYY-MM-DD'), 'Could be better.', 2, 7);
insert into tim_customer_review values (8, 5, TO_DATE('2023-08-10', 'YYYY-MM-DD'), 'Amazing product!', 3, 1);
insert into tim_customer_review values (9, 1, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'Terrible experience.', 4, 2);
insert into tim_customer_review values (10, 4, TO_DATE('2023-10-20', 'YYYY-MM-DD'), 'Satisfied with the purchase.', 5, 3);


spool off




