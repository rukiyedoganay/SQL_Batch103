CREATE TABLE custuomers_products
(
product_id INT,
customer_name VARCHAR(50),
product_name VARCHAR(50)
);

INSERT INTO custuomers_products VALUES	(10,'Mark', 'Orange');
INSERT INTO custuomers_products VALUES	(10,'Mark', 'Orange');
INSERT INTO custuomers_products VALUES	(20,'John', 'Apple');
INSERT INTO custuomers_products VALUES	(30,'Amy', 'Palm');
INSERT INTO custuomers_products VALUES	(20,'Mark', 'Apple');
INSERT INTO custuomers_products VALUES	(10,'Adem', 'Orange');
INSERT INTO custuomers_products VALUES	(40,'John', 'Apricot');
INSERT INTO custuomers_products VALUES	(20,'Eddie', 'Apple');

SELECT * FROM custuomers_products;

--Task1: product_name degeri Orange, Apple ya da Palm olan recordları çağırın
--1.Yol
SELECT * 
FROM custuomers_products
WHERE product_name = 'Orange' or product_name ='Apple' or product_name ='Palm';
--2.Yol
SELECT * 
FROM custuomers_products
WHERE product_name IN ('Orange','Apple','Palm');

--Task2: product_name degeri  Orange, Apple ya da Palm olmayan recordları çağırın
SELECT *
FROM custuomers_products
WHERE product_name NOT IN ('Orange','Apple','Palm');

--Task3: product_id'si 30dan küçük veya eşit VE 20den büyük veya eşit recordları çağırın
--1.Yol
SELECT *
FROM custuomers_products
WHERE product_id<=30 AND product_id>=20;
--2.Yol
SELECT *
FROM custuomers_products
WHERE product_id BETWEEN 20 and 30; --20 ve 30 dahil

--Task4: product_id degeri 20'den küçük, 25'ten büyük recordları çağırın
--1.Yol
SELECT *
FROM custuomers_products
WHERE product_id<20 or product_id>25;
--2.Yol
SELECT *
FROM custuomers_products
WHERE product_id NOT BETWEEN 20 AND 25 --20 ve 25 dahil değil

----------EXISTS CONDITION-----------
--SUBQUERY ile kullanılır. 
--Eğer subquery herhangi bir data çağırırsa 'Outer Query' çalıştırılır.
--Eğer subquery herhangi bir data çağırılmazsa 'Outer Query' çalıştırılmaz.
--EXISTS condition SELECT, INSERT, UPDATE, DELETE komutlarında kullanılabilir.

CREATE TABLE customers_likes
(
product_id CHAR(10),
customer_name VARCHAR(50),
liked_product VARCHAR(50)
);

INSERT INTO customers_likes VALUES (10,'Mark','Orange');
INSERT INTO customers_likes VALUES (50,'Mark','Pineapple');
INSERT INTO customers_likes VALUES (60,'John','Avocado');
INSERT INTO customers_likes VALUES (30,'Lary','Cherries');
INSERT INTO customers_likes VALUES (20,'Mark','Apple');
INSERT INTO customers_likes VALUES (10,'Adem','Orange');
INSERT INTO customers_likes VALUES (40,'John','Apricot');
INSERT INTO customers_likes VALUES (20,'Eddie','Apple');

SELECT * FROM customers_likes;

--Task5: customer_name degerleri arasında Lary varsa customer_name degerini 'NO name' olarak güncelle.
UPDATE customers_likes 
SET customer_name ='No name'
WHERE EXISTS(SELECT liked_product FROM customers_likes WHERE customer_name= 'LaryX');

--Task6: liked_product degerleri arasında Orange, Pineapple ya da Avocado varsa
-- name degerlerini 'No Name' olarak güncelle.
UPDATE customers_likes
SET customer_name='No Name'
WHERE EXISTS
(SELECT customer_name from customers_likes WHERE liked_product IN ('Orange','Pineapple','Avocado'))

--Task7: customer_name degeri varsa Orange olan recordları silin.
DELETE FROM customers_likes
WHERE EXISTS (SELECT liked_product FROM customers_likes WHERE liked_product='Orange')


--------SUBQUERY----------

CREATE TABLE employees
(
id CHAR(9),
name VARCHAR(50),
state VARCHAR(50),
salary SMALLINT,
company VARCHAR(20)
);

INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500,'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500,'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000,'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000,'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas',7000,'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500,'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500,'IBM');

SELECT * FROM employees;

CREATE TABLE companies
(
company_id CHAR (9),
company VARCHAR(20),
number_of_employees SMALLINT

);

INSERT INTO companies VALUES (100, 'IBM', 12000);
INSERT INTO companies VALUES (101, 'GOOGLE', 18000);
INSERT INTO companies VALUES (102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES (103, 'APPLE', 21000);

SELECT * FROM companies


--Task8: number_of_employees 15000'den büyük olan name ve company degerlerini çağırın.
SELECT name,company FROM employees 
WHERE company IN(SELECT company FROM companies WHERE number_of_employees>15000);

--Task9: Florida'da bulunan company_id ve company degerlerini çağırın.

SELECT company_id, company 
FROM companies
WHERE company IN(SELECT company FROM employees WHERE state='Florida');

--Task10: company_id degeri 100'den buyuk olan name ve state degerlerini çağırınız.
SELECT name,state,company
FROM employees
WHERE company IN(SELECT company FROM companies WHERE company_id>'100')
















