ALTER TABLE Manager
DROP CONSTRAINT EmployeeID_RE ;

DROP TABLE Employee;
DROP TABLE Department;
DROP TABLE Sales;
DROP TABLE Customer;
DROP TABLE Car;
DROP TABLE Insurance;
DROP TABLE Repair;
DROP TABLE Warehouse;


CREATE TABLE Department(
DepartmentName VARCHAR2(20) CONSTRAINT DepartmentName_UNNN UNIQUE NOT NULL,
DepartmentID Char(6) CONSTRAINT DepartmentID_pk PRIMARY KEY
);

CREATE TABLE Employee(
SSN char(9)  CONSTRAINT SSN_NN NOT NULL,
EmployeeID char(6) CONSTRAINT employee_pk PRIMARY KEY,
LastName VARCHAR2(50) CONSTRAINT LastName_NN NOT NULL,
FirstName VARCHAR2(50) CONSTRAINT FirstName_NN NOT NULL,
Salary NUMBER(8,2)  DEFAULT 0,
Brithday Date,
ManagerID char(6) CONSTRAINT Manager_RE REFERENCES Employee(EmployeeID),
DeparmentID VARCHAR2(20) CONSTRAINT DepartmentID_RE REFERENCES Department(DepartmentID)
);


CREATE TABLE Sales(
ContactID CHAR(6) CONSTRAINT ContactID_pk PRIMARY KEY,
SalesEmployee CHAR(6) CONSTRAINT SalesEmployee_Sales_RE REFERENCES Employee(EmployeeID) NOT NULL,
VIN CHAR(17) CONSTRAINT  VIN_Sales_RE REFERENCES Car(VIN) NOT NULL UNIQUE,
InsuranceID CHAR(12) CONSTRAINT InsuranceNumber_UNNN REFERENCES Insurance(InsuranceID) UNIQUE NOT NULL,
Price Number(8,2) CONSTRAINT Price_NN NOT NULL ,
SalesDate Date Default SYSDATE,
CustomerID Char(20) CONSTRAINT  CustomerID_contract_RE REFERENCES Customer(CustomerID),
EmployeeID char(6) CONSTRAINT Employee_Contract_RE REFERENCES Empolyee(EmployeeID)

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

CREATE TABLE Warehouse(
WarehouseID CHAR(8) CONSTRAINT WarehouseID_pk PRIMARY KEY,
Location VARCHAR2(50),
City VARCHAR2(20),
State VARCHAR2(15),
ZIPcode Char(5)
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
PartsPrice NUMBER(7,2)CONSTRAINT partsprice_NN DEFAULT 0 NOT NULL,
LaberCost NUMBER(7,2)CONSTRAINT LaberCost_NN DEFAULT 0 NOT NULL,
SELECT
   PartsPrice,
   LaberCost,
   (PartsPrice+LaberCost) as 'TotalCost'
FROM Insurance
);
