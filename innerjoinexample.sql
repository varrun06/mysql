CREATE SCHEMA sample1;

USE sample1;

CREATE TABLE elective1 (
    name  VARCHAR(250)
);

CREATE TABLE elective2 (
    name VARCHAR(250)
);

CREATE TABLE elective3 (
    name  VARCHAR(250)
);

INSERT INTO  elective1 (name) VALUES
('prathi'),
('naveen'),
('malar'),
('reena');

INSERT INTO  elective2 (name) VALUES
('prathi'),
('reena');

INSERT INTO  elective3 (name) VALUES
('naveen'),
('prathi'),
('malar');

INSERT INTO  elective3 (name) VALUES ('prathi');
SELECT e1.name 
FROM elective1 AS e1 
JOIN elective2 AS e2
ON e1.name = e2.name;

SELECT e2.name 
FROM elective2 AS e2 
JOIN elective3 AS e3
ON e2.name = e3.name;


SELECT *
FROM elective1
INNER JOIN elective2
ON elective1.name = elective2.name
INNER JOIN elective3
ON elective2.name = elective3.name;


