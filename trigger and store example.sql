CREATE SCHEMA triggerexample;

USE triggerexample;

CREATE TABLE Employee  
(  
  Id INT PRIMARY KEY,  
  Name VARCHAR(45),  
  Salary INT,  
  Gender VARCHAR(12),  
  DepartmentId INT  
);  

INSERT INTO Employee VALUES 
(1,'Steffan', 82000, 'Male', 3),  
(2,'Amelie', 52000, 'Female', 2),  
(3,'Antonio', 25000, 'male', 1),  
(4,'Marco', 47000, 'Male', 2),  
(5,'Eliana', 46000, 'Female', 3) ;

SELECT * FROM triggerexample.Employee;

CREATE TABLE triggerexample.Employee_Audit_Test (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Audit_Action TEXT
);

DELIMITER //
CREATE TRIGGER trInsertEmployee
AFTER INSERT ON triggerexample.Employee
FOR EACH ROW
BEGIN
    INSERT INTO triggerexample.Employee_Audit_Test (Audit_Action)
    VALUES (CONCAT('New employee with Id = ', NEW.Id, ' is added at ', NOW()));
END;
//
DELIMITER ;

INSERT INTO Employee VALUES (6,'Peter', 62000, 'Male', 3) ;

DELIMITER //

CREATE PROCEDURE `egstore`()
BEGIN
    SELECT * FROM triggerexample.Employee ;
END
//
DELIMITER ;

