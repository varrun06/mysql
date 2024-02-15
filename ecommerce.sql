CREATE TABLE ecommerce.user (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    telephone VARCHAR(15)
);

CREATE TABLE ecommerce.productcategorie (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    description TEXT
);


CREATE TABLE ecommerce.productinventory (
    id INT PRIMARY KEY,
    quantity INT
);



CREATE TABLE ecommerce.discount (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    description TEXT,
    discountpercent DECIMAL(5, 2),
    active BOOLEAN
);

CREATE TABLE ecommerce.paymentdetail (
    id INT PRIMARY KEY,
    orderid INT,
    amount DECIMAL(10,2),
    provider VARCHAR(50),
    status VARCHAR(20)
   );




CREATE TABLE ecommerce.product (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    SKU VARCHAR(20),
    categoryid INT,
    inventoryid INT,
    price DECIMAL(10, 2),
    discountid INT
);



CREATE TABLE ecommerce.orderdetail (
    id INT PRIMARY KEY,
    userid INT,
    total DECIMAL(10, 2),
    paymentid INT
    
);



CREATE TABLE ecommerce.orderitem (
    id INT PRIMARY KEY,
    orderid INT,
    productid INT,
    quantity INT
    
);



CREATE TABLE ecommerce.cartitem (
    sessionid VARCHAR(50),
    productid INT,
    quantity INT
   
);



CREATE TABLE ecommerce.shoppingsession (
    id INT PRIMARY KEY,
    userid INT,
    total DECIMAL(10, 2)
    
);



CREATE TABLE ecommerce.useraddresses (
    id INT PRIMARY KEY,
    userid INT,
    addressline1 VARCHAR(100),
    addressline2 VARCHAR(100),
    city VARCHAR(50),
    postalcode VARCHAR(20),
    country VARCHAR(50),
    telephone VARCHAR(15),
    mobile VARCHAR(15)
);

CREATE TABLE ecommerce.userpayment (
    id INT PRIMARY KEY,
    userid INT,
    paymenttype VARCHAR(50),
    provider VARCHAR(50),
    accountno VARCHAR(16),
    expiry DATE
);

