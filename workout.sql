CREATE SCHEMA workout_schema;

CREATE TABLE workout_schema.customer_table (
    customerid INT PRIMARY KEY,
    customername VARCHAR(250),
    city VARCHAR(250),
    country VARCHAR(250)
);

CREATE TABLE workout_schema.order_table (
   orderid INT PRIMARY KEY,
   customerid INT,
   Price INT,
   Date DATE,
   FOREIGN KEY (customerid) REFERENCES workout_schema.customer_table(customerid)
);

INSERT INTO workout_schema.customer_table (customerid, customername, city, country) VALUES
(1, 'ram', 'New York', 'USA'),
(2, 'abi', 'London', 'UK'),
(3, 'rahul', 'chennai', 'india');

INSERT INTO workout_schema.customer_table (customerid, customername, city, country) VALUES

(4, 'tony', 'chennai', 'india');

INSERT INTO workout_schema.order_table (orderid, customerid, Price, Date) VALUES
(101, 1, 50, '2024-02-01'),
(102, 1, 75, '2024-02-03'),
(103, 2, 100, '2024-02-02'),
(104, 3, 80, '2024-02-05'),
(105, 2, 120, '2024-02-07');

UPDATE workout_schema.customer_table
SET city = 'neyveli'
WHERE customerid = 3;

DELETE FROM workout_schema.order_table WHERE customerid = 2;
DELETE FROM workout_schema.customer_table WHERE customerid = 2;


SELECT c.customerid, o.orderid
FROM workout_schema.customer_table AS c
JOIN workout_schema.order_table AS o
ON c.customerid = o.customerid;


SELECT c.customerid, o.orderid
FROM workout_schema.customer_table AS c
LEFT JOIN workout_schema.order_table AS o
ON c.customerid = o.customerid;

SELECT c.customerid, o.orderid
FROM workout_schema.customer_table AS c
RIGHT JOIN workout_schema.order_table AS o
ON c.customerid = o.customerid;

CREATE TABLE workout_schema.check_table (
    checkid INT PRIMARY KEY,
    checkname VARCHAR(250),
    checkcity VARCHAR(250),
    checkcountry VARCHAR(250),
    pincode INTEGER
);

INSERT INTO workout_schema.check_table (checkid, checkname, checkcity, checkcountry, pincode) VALUES
(1, 'tony', 'New York', 'USA', 12345),
(2, 'kiran', 'London', 'UK', 54321),
(3, 'siva', 'chennai', 'India', 67890),
(4, 'pravin', 'neyveli', 'India', 98765),
(5, 'vimal', 'chennai', 'India', 23456),
(6, 'kasi', 'cuddalore', 'India', 34567);

SELECT COUNT(checkid) AS check_count, checkcountry
FROM workout_schema.check_table
GROUP BY checkcountry;

SELECT checkid, checkname, checkcity, checkcountry, pincode FROM workout_schema.check_table
UNION
SELECT  customerid, customername, city, country,null FROM workout_schema.customer_table;

ALTER TABLE workout_schema.check_table
ADD phonenumber INTEGER;

DROP TABLE workout_schema.check_table;