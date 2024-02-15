CREATE SCHEMA alljoinwithexample;

CREATE TABLE alljoinwithexample.customer (
    customerid INT,
    customername VARCHAR(250),
    city VARCHAR(250),
    occupation VARCHAR(250)
);

CREATE TABLE alljoinwithexample.orders (
   orderid INT ,
   productname VARCHAR(250),
   ordernum INT ,
   orderdate date
);

INSERT INTO  alljoinwithexample.customer (customerid, customername, city, occupation) VALUES (1, 'peter', 'london', 'business');
INSERT INTO  alljoinwithexample.customer (customerid, customername, city, occupation) VALUES (2, 'joseph', 'texas', 'doctor');
INSERT INTO  alljoinwithexample.customer (customerid, customername, city, occupation) VALUES (3, 'mark', 'new delhi','engineer');
INSERT INTO  alljoinwithexample.customer (customerid, customername, city, occupation) VALUES (4, 'michael', 'new york', 'scientist');
INSERT INTO  alljoinwithexample.customer (customerid, customername, city, occupation) VALUES (5, 'alexandar', 'maxico', 'student');
INSERT INTO  alljoinwithexample.customer (customerid, customername, city, occupation) VALUES (6, 'ram', 'london', 'business');
INSERT INTO  alljoinwithexample.customer (customerid, customername, city, occupation) VALUES (7, 'siva', 'chennai', 'business');

#update
UPDATE alljoinwithexample.customer
SET occupation= 'student'
WHERE CustomerID = 1;


		
INSERT INTO  alljoinwithexample.orders (orderid,productname,ordernum,orderdate) VALUES (1, 'laptop', 5544, '2020-02-01');
INSERT INTO  alljoinwithexample.orders (orderid,productname,ordernum,orderdate) VALUES (2, 'mouse', 3322, '2020-02-11');
INSERT INTO  alljoinwithexample.orders (orderid,productname,ordernum,orderdate) VALUES (3, 'desktop', 2135, '2020-01-05');
INSERT INTO  alljoinwithexample.orders (orderid,productname,ordernum,orderdate) VALUES (4, 'mobile', 3432, '2020-02-22');
INSERT INTO  alljoinwithexample.orders (orderid,productname,ordernum,orderdate) VALUES (5, 'antivirus', 5648, '2020-03-10');
INSERT INTO  alljoinwithexample.orders (orderid,productname,ordernum,orderdate) VALUES (8, 'laptop', 5579, '2020-09-01');
INSERT INTO  alljoinwithexample.orders (orderid,productname,ordernum,orderdate) VALUES (10, 'mouse', 3346, '2020-09-11');

INSERT INTO  alljoinwithexample.orders (orderid,productname,ordernum,orderdate) VALUES (null, 'laptop', 5544, '2020-02-01');


#left join and order by
SELECT c.customerid, c.customername, o.ordernum, o.orderdate  
FROM alljoinwithexample.customer AS c 
LEFT JOIN alljoinwithexample.orders AS o
ON c.customerid = o.orderid
ORDER BY o.orderdate;

#inner join and group by
SELECT c.occupation, COUNT(c.occupation) 
FROM alljoinwithexample.customer AS c 
JOIN alljoinwithexample.orders AS o
ON c.customerid = o.orderid
GROUP BY c.occupation
HAVING COUNT(occupation) <= 1;

#right join and stored procedure
DELIMITER //

CREATE PROCEDURE alljoinwithexample.GetCustomersWithOrders()
BEGIN
    SELECT c.customerid, c.customername, c.occupation, o.ordernum, o.orderdate  
    FROM alljoinwithexample.customer AS c 
    RIGHT JOIN alljoinwithexample.orders AS o
    ON c.customerid = o.orderid;
END //

DELIMITER ;

#stored procedure call
CALL alljoinwithexample.GetCustomersWithOrders();



#fulljoin
SELECT c.customerid, c.customername, c.occupation, o.orderid, o.productname, o.ordernum, o.orderdate
FROM alljoinwithexample.customer AS c 
LEFT JOIN alljoinwithexample.orders AS o ON c.customerid = o.orderid
UNION
SELECT c.customerid, c.customername, c.occupation, o.orderid, o.productname, o.ordernum, o.orderdate
FROM alljoinwithexample.customer AS c 
RIGHT JOIN alljoinwithexample.orders AS o ON c.customerid = o.orderid;


#cross join
SELECT c.customerid, c.customername, c.occupation, o.orderid, o.productname, o.ordernum, o.orderdate
FROM alljoinwithexample.customer AS c 
CROSS JOIN alljoinwithexample.orders AS o;

#view
CREATE VIEW alljoinwithexample.customer_orders_view AS
SELECT c.customerid, c.customername, c.city, c.occupation, o.orderid, o.productname, o.ordernum, o.orderdate
FROM alljoinwithexample.customer AS c
LEFT JOIN alljoinwithexample.orders AS o ON c.customerid = o.orderid;

DELETE FROM alljoinwithexample.customer WHERE customerName='siva';



#SUM Query
SELECT SUM(ordernum) AS total_orders FROM alljoinwithexample.orders;

#MIN Query
SELECT MIN(ordernum) AS min_order FROM alljoinwithexample.orders;

#MAX Query
SELECT MAX(ordernum) AS max_order FROM alljoinwithexample.orders;

#and
SELECT c.customerid, c.customername, c.occupation, o.orderid, o.productname, o.ordernum, o.orderdate
FROM alljoinwithexample.customer AS c
INNER JOIN alljoinwithexample.orders AS o ON c.customerid = o.orderid
WHERE c.occupation != 'student' AND o.orderdate > '2020-02-01';

#or
SELECT c.customerid, c.customername, c.occupation, o.orderid, o.productname, o.ordernum, o.orderdate
FROM alljoinwithexample.customer AS c
INNER JOIN alljoinwithexample.orders AS o ON c.customerid = o.orderid
WHERE (c.occupation = 'doctor' OR c.occupation = 'engineer') AND o.ordernum < 4000;

#not
SELECT c.customerid, c.customername, c.city, c.occupation
FROM alljoinwithexample.customer AS c
LEFT JOIN alljoinwithexample.orders AS o ON c.customerid = o.orderid
WHERE (c.city NOT IN ('london', 'new York') );

#trigger 

CREATE TABLE IF NOT EXISTS alljoinwithexample.triggertable (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Audit_Action TEXT
);

USE alljoinwithexample;
DELIMITER //

CREATE TRIGGER trInsertcustomer
AFTER INSERT ON alljoinwithexample.customer
FOR EACH ROW
BEGIN
    INSERT INTO alljoinwithexample.triggertable (Audit_Action)
    VALUES (CONCAT('New customer with Id = ', NEW.customerid, ' is added at ', NOW()));
END;
//
DELIMITER ;

INSERT INTO  alljoinwithexample.customer (customerid, customername, city, occupation) VALUES
(10, 'gokul', 'london', 'business');

