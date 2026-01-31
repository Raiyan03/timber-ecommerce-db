SET echo ON
spool c:/cprg250s/Projectcreatetable.txt

DROP TABLE tim_customer_review CASCADE CONSTRAINTS;
DROP TABLE tim_order_product CASCADE CONSTRAINTS;
DROP TABLE tim_supplier_product CASCADE CONSTRAINTS;
DROP TABLE tim_order CASCADE CONSTRAINTS;
DROP TABLE tim_product CASCADE CONSTRAINTS;
DROP TABLE tim_tax_rate CASCADE CONSTRAINTS;
DROP TABLE tim_shipping_rate CASCADE CONSTRAINTS;
DROP TABLE tim_supplier CASCADE CONSTRAINTS;
DROP TABLE tim_category CASCADE CONSTRAINTS;
DROP TABLE tim_customer CASCADE CONSTRAINTS;


CREATE TABLE tim_shipping_rate
(
   	 Min_Weight NUMBER(10,2) CONSTRAINT sys_tim_shipping_rate_min_wt_pk PRIMARY KEY,
	 Max_Weight NUMBER(10,2),
   	 Shipping_rate NUMBER(10,2)
);
CREATE TABLE tim_tax_rate
(
	Province CHAR(2) CONSTRAINT sys_tim_tax_rate_province_ck 
		CHECK(Province in ('AB', 'BC', 'MB', 'NB', 'NL', 'NT', 'NS', 'NU', 'ON', 'PE', 'QC', 'SK', 'YT')),
	GST NUMBER(5,2),
	HST NUMBER(5,2),
	PST NUMBER(7,5),
	CONSTRAINT sys_tim_tax_rate_province_pk PRIMARY KEY (Province)
);
CREATE TABLE tim_supplier
(
	Supplier_Number INTEGER CONSTRAINTS sys_tim_supplier_number_pk PRIMARY KEY,
	Name VARCHAR2(25) NOT NULL,
	Email VARCHAR2(40) CONSTRAINT sys_tim_supplier_email_uk UNIQUE,
	City VARCHAR2(20),
	Province CHAR(2) CONSTRAINT sys_tim_supplier_prov_ck
		CHECK(Province in ('AB', 'BC', 'MB', 'NB', 'NL', 'NT', 'NS', 'NU', 'ON', 'PE', 'QC', 'SK', 'YT')),
	CONSTRAINT sys_tim_supplier_email_ck 
		CHECK (REGEXP_LIKE(Email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'))
);
CREATE TABLE tim_customer
(
	Customer_number INTEGER CONSTRAINT sys_tim_customer_number_pk PRIMARY KEY,
	Firstname VARCHAR2(20) NOT NULL,
	Lastname VARCHAR2(20) NOT NULL,
	Phone_Number VARCHAR2(20),
	Address VARCHAR2(25) ,
	City VARCHAR2(25) ,
	Province CHAR(2) CONSTRAINT sys_tim_customer_prov_ck
		CHECK(Province in ('AB', 'BC', 'MB', 'NB', 'NL', 'NT', 'NS', 'NU', 'ON', 'PE', 'QC', 'SK', 'YT')),
	Postal_Code CHAR(6) ,
	Email VARCHAR2(40) CONSTRAINT sys_tim_customer_email_ck
		CHECK (REGEXP_LIKE(Email,'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')),
	is_Timber_Member NUMBER(1) CONSTRAINT sys_tim_customer_is_timber_member_ck
		CHECK (is_Timber_Member IN (0, 1)),
	CONSTRAINT sys_tim_customer_phone_number_ck 
		CHECK (REGEXP_LIKE(Phone_Number, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$')),
	CONSTRAINT sys_tim_customer_postal_code_ck
		CHECK (REGEXP_LIKE(Postal_Code,'^[A-Z][0-9][A-Z][0-9][A-Z][0-9]$'))
);
CREATE TABLE tim_category
(
	Category_Number INTEGER CONSTRAINT sys_tim_category_number_pk PRIMARY KEY,
	Name VARCHAR2(25),
	Parent_Category_Number INTEGER,
	CONSTRAINT sys_tim_category_parent_category_number_fk FOREIGN KEY(Parent_Category_Number)
		REFERENCES tim_category (Category_Number)
);
CREATE TABLE tim_order
(
    Order_Number INTEGER CONSTRAINT sys_tim_order_number_pk PRIMARY KEY,
    Order_Date DATE,
    Delivery_Date DATE,
    Province CHAR(2) CHECK (Province in ('AB', 'BC', 'MB', 'NB', 'NL', 'NT', 'NS', 'NU', 'ON', 'PE', 'QC', 'SK', 'YT')),
    Total_Weight NUMBER(10,2) CHECK (Total_Weight > 0),
    tax_amount NUMBER,
    Customer_number INTEGER,
    CONSTRAINT sys_tim_order_province_fk1 FOREIGN KEY (Province) 
		REFERENCES tim_tax_rate (Province),
    --CONSTRAINT sys_tim_order_total_weight_fk2 FOREIGN KEY (Total_Weight) 
		--REFERENCES tim_shipping_rate (Min_Weight),
    CONSTRAINT sys_tim_order_customer_number_fk3 FOREIGN KEY (Customer_number) 
		REFERENCES tim_customer (Customer_number)
);
CREATE TABLE tim_product
(
	Product_Number INTEGER CONSTRAINT sys_tim_product_number_pk PRIMARY KEY,
	Category_Number INTEGER,
	Title VARCHAR2(40),
	Description VARCHAR2(100),
	Price NUMBER(10,2),
	Weight NUMBER(7,2),
	is_Tax_Exempt NUMBER(1),
	CONSTRAINT sys_tim_product_category_number_ck FOREIGN KEY (Category_Number)
		REFERENCES tim_category (Category_Number)
);
ALTER TABLE tim_product
	ADD CONSTRAINT sys_tim_product_price_ck CHECK (Price > 0);
ALTER TABLE tim_product
	ADD	CONSTRAINT sys_tim_product_weight_ck CHECK (Weight > 0);
ALTER TABLE tim_product
	ADD	CONSTRAINT sys_tim_product_is_tax_exempt_ck CHECK(is_Tax_Exempt IN (1, 0));

CREATE TABLE tim_order_product
(
	Order_Number INTEGER,
	Product_Number INTEGER,
	Quantity INTEGER CONSTRAINT sys_tim_order_product_quantity_ck 
		CHECK (Quantity >= 0),
	CONSTRAINT sys_tim_order_product_pk PRIMARY KEY(Product_Number, Order_Number),
	CONSTRAINT sys_tim_order_product_order_number_fk1 FOREIGN KEY (Order_Number)
		REFERENCES tim_order (Order_Number),
	CONSTRAINT sys_tim_order_product_number_fk2 FOREIGN KEY (Product_Number)
		REFERENCES tim_product (Product_Number)
);

CREATE TABLE tim_supplier_product
(
	Supplier_Number INTEGER,
	Product_Number INTEGER,
	CONSTRAINT tim_supplier_product_pk PRIMARY KEY(Supplier_number, Product_Number),
	CONSTRAINT tim_supplier_product_number_fk1 FOREIGN KEY(Product_Number)
		REFERENCES tim_product (Product_Number),
	CONSTRAINT tim_supplier_product_supplier_number_fk2 FOREIGN KEY(Supplier_Number)
		REFERENCES tim_supplier (Supplier_number)
);

CREATE TABLE tim_customer_review
(
	Review_Number INTEGER CONSTRAINT sys_tim_customer_review_number_pk PRIMARY KEY,
	Rating NUMBER(1) CONSTRAINT sys_tim_customer_review_rating_pk 
		CHECK(Rating >= 1 AND Rating <= 5),
	Date_of_review DATE,
	Reveiw_Comments VARCHAR2(200),
	Product_Number INTEGER,
	Customer_number INTEGER,
	CONSTRAINT sys_tim_customer_review_Product_Number_fk1 FOREIGN KEY (Product_Number)
		REFERENCES tim_product (Product_Number),
	CONSTRAINT sys_tim_customer_review_Customer_Number_fk2 FOREIGN KEY (Customer_number)
		REFERENCES tim_customer (Customer_number)
);
spool OFF
