Alter TABLE Sales
DROP constraint SalesEmployee_Sales_RE
DROP CONSTRAINT VIN_Sales_RE;
DROP TABLE Employee;
DROP TABLE Department;
DROP TABLE Sales;
DROP TABLE Customer;
Alter TABLE Repair
Drop constraint VIN_Repair_RE;

DROP TABLE Car;
DROP TABLE Insurance;
DROP TABLE Repair;
DROP TABLE Warehouse;


CREATE TABLE Department(
DepartmentID Char(6) CONSTRAINT DepartmentID_pk PRIMARY KEY ,
DepartmentName VARCHAR2(50) CONSTRAINT DepartmentName_UNNN UNIQUE NOT NULL

);

CREATE TABLE Employee(
SSN char(9)  CONSTRAINT SSN_NN NOT NULL,
EmployeeID char(6) CONSTRAINT employee_pk PRIMARY KEY,
LastName VARCHAR2(50) CONSTRAINT LastName_NN NOT NULL,
FirstName VARCHAR2(50) CONSTRAINT FirstName_NN NOT NULL,
Salary NUMBER(8,2)  DEFAULT 0,
Brithday Date,
ManagerID char(6) CONSTRAINT Manager_RE REFERENCES Employee(EmployeeID),
DeparmentID Char(6) CONSTRAINT DepartmentID_RE REFERENCES Department(DepartmentID) 
);


CREATE TABLE Customer(
CustomerID Char(20)CONSTRAINT CustomerID_pk PRIMARY KEY,
DriverLicence Char(10) CONSTRAINT DL_UN UNIQUE,
Brithday Date,
Address Char(30),
City VARCHAR2(20),
State VARCHAR2(15),
Phone Char(10),
Zipcode Char(5),
LastName VARCHAR2(50),
FirstName VARCHAR2(50)
);

CREATE TABLE Warehouse(
WarehouseID CHAR(8) CONSTRAINT WarehouseID_pk PRIMARY KEY,
Location VARCHAR2(50),
City VARCHAR2(20),
State VARCHAR2(15),
ZIPcode Char(5)
);

CREATE TABLE Car(
VIN CHAR(17) CONSTRAINT VIN_pk PRIMARY KEY,
WarehouseID CHAR(8) CONSTRAINT WarehouseID_RE REFERENCES Warehouse(WarehouseID),
MODEL VARCHAR2(50) CONSTRAINT Model_NN NOT NULL,
MAKER VARCHAR2(50) CONSTRAINT Maker_NN NOT NULL,
YEAR Char(4) CONSTRAINT Year_NN NOT NULL,
Miles Char(7)  DEFAULT 0,
Color VARCHAR2(20),
Feature VARCHAR2(100)
);



CREATE TABLE Insurance(
InsuranceID char(12) CONSTRAINT InsuranceID_pk PRIMARY KEY,
Company Char(30) CONSTRAINT Company_NN NOT NULL,
InsurancePolicyID Char(20) CONSTRAINT InsurancePolicyID_NN NOT NULL
);

CREATE TABLE Repair(
ServiceID Char(10) CONSTRAINT ServiceID_pk PRIMARY KEY,
VIN CHAR(17) CONSTRAINT VIN_Repair_RE REFERENCES Car(VIN),
PartNumeber Char(10),
PartsPrice NUMBER(7,2) DEFAULT 0 CONSTRAINT partsprice_NN NOT NULL  ,
LaberCost NUMBER(7,2) DEFAULT 0 CONSTRAINT LaberCost_NN NOT NULL
-- (SELECT
--    (PartsPrice,
--    LaberCost,
--    (PartsPrice+LaberCost) as TotalCost)
-- FROM Repair)
);
CREATE TABLE Sales(
ContactID CHAR(6) CONSTRAINT ContactID_pk PRIMARY KEY,
SalesEmployee CHAR(6) CONSTRAINT SalesEmployee_Sales_RE REFERENCES Employee(EmployeeID) NOT NULL,
VIN CHAR(17) CONSTRAINT  VIN_Sales_RE REFERENCES Car(VIN) NOT NULL UNIQUE,
InsuranceID CHAR(12) CONSTRAINT InsuranceNumber_UNNN REFERENCES Insurance(InsuranceID) UNIQUE NOT NULL,
Price Number(8,2) CONSTRAINT Price_NN NOT NULL ,
SalesDate Date Default SYSDATE,
CustomerID Char(20) CONSTRAINT  CustomerID_contract_RE REFERENCES Customer(CustomerID)
);

INSERT ALL
   INTO Department (DepartmentID, DepartmentName) VALUES (123456, 'Sales_Department')
   INTO Department (DepartmentID, DepartmentName) VALUES (179652, 'Service_Department')
   INTO Department (DepartmentID, DepartmentName) VALUES (122112, 'Accounting_Department')
   INTO Department (DepartmentID, DepartmentName) VALUES (122133, 'Insurance_Department')
   INTO Employee (SSN, EmployeeID , LastName , FirstName , Salary  , Brithday, ManagerID , DeparmentID )VALUES (123456789, 223456,'Jake', 'Tom',13000.00, TO_DATE('12-01-1988','MM-DD-YYYY'),NULL,NULL)
   INTO Employee (SSN, EmployeeID , LastName , FirstName , Salary  , Brithday, ManagerID , DeparmentID )VALUES (135431862, 223457,'Grace','Butter',3000, TO_DATE('11-01-1993','MM-DD-YYYY'),223456,122112)
   INTO Employee (SSN, EmployeeID , LastName , FirstName , Salary  , Brithday, ManagerID , DeparmentID )VALUES (111111111, 211112,'Heghington','George',5000, TO_DATE('04-01-1993','MM-DD-YYYY'),223456,123456)
   INTO Employee (SSN, EmployeeID , LastName , FirstName , Salary  , Brithday, ManagerID , DeparmentID )VALUES (222222222, 211113,'Eden','Barthe',3000, TO_DATE('07-08-1994','MM-DD-YYYY'),223456,123456)
   INTO Employee (SSN, EmployeeID , LastName , FirstName , Salary  , Brithday, ManagerID , DeparmentID )VALUES (333333333, 211146,'Ludge','Jarard',7000, TO_DATE('01-01-1983','MM-DD-YYYY'),223456,NULL)
   INTO Employee (SSN, EmployeeID , LastName , FirstName , Salary  , Brithday, ManagerID , DeparmentID )VALUES (444444444, 211176,'Maire','Lyonell',4000, TO_DATE('12-30-1985','MM-DD-YYYY'),211146,179652)
   INTO Employee (SSN, EmployeeID , LastName , FirstName , Salary  , Brithday, ManagerID , DeparmentID )VALUES (555555555, 211185,'Maire','Peter',3000, TO_DATE('10-12-1996','MM-DD-YYYY'),211146,179652)
   INTO Employee (SSN, EmployeeID , LastName , FirstName , Salary  , Brithday, ManagerID , DeparmentID )VALUES (666666666, 211187,'Maire','Peter',3000, TO_DATE('10-12-1996','MM-DD-YYYY'),223456,122133)
   
   
   
SELECT 1 FROM DUAL;



SELECT * FROM employee;
Select * from Department;