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
CustomerID Char(4)CONSTRAINT CustomerID_pk PRIMARY KEY,
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
WarehouseName VARCHAR2(50),
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
InsuranceID char(6) CONSTRAINT InsuranceID_pk PRIMARY KEY,
Company VARCHAR2(30) CONSTRAINT Company_NN NOT NULL,
InsurancePolicyID Char(20) CONSTRAINT InsurancePolicyID_NN NOT NULL
);

CREATE TABLE Repair(
ServiceID Char(10) CONSTRAINT ServiceID_pk PRIMARY KEY,
VIN CHAR(17) CONSTRAINT VIN_Repair_RE REFERENCES Car(VIN),
PartNumeber Char(10),
PartsPrice NUMBER(7,2) DEFAULT 0 CONSTRAINT partsprice_NN NOT NULL  ,
LaberCost NUMBER(7,2) DEFAULT 0 CONSTRAINT LaberCost_NN NOT NULL

);
CREATE TABLE Sales(
ContactID CHAR(6) CONSTRAINT ContactID_pk PRIMARY KEY,
SalesEmployee CHAR(6) CONSTRAINT SalesEmployee_Sales_RE REFERENCES Employee(EmployeeID) NOT NULL,
VIN CHAR(17) CONSTRAINT  VIN_Sales_RE REFERENCES Car(VIN) NOT NULL UNIQUE,
InsuranceID CHAR(6) CONSTRAINT InsuranceNumber_UNNN REFERENCES Insurance(InsuranceID) UNIQUE NOT NULL,
Price Number(9,2) CONSTRAINT Price_NN NOT NULL ,
SalesDate Date Default SYSDATE,
CustomerID Char(4) CONSTRAINT  CustomerID_contract_RE REFERENCES Customer(CustomerID)
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
   INTO Employee (SSN, EmployeeID , LastName , FirstName , Salary  , Brithday, ManagerID , DeparmentID )VALUES (555555555, 211185,'Buck','Peter',3000, TO_DATE('10-12-1996','MM-DD-YYYY'),211146,179652)
   INTO Employee (SSN, EmployeeID , LastName , FirstName , Salary  , Brithday, ManagerID , DeparmentID )VALUES (666666666, 211187,'Carter','Stevne',3000, TO_DATE('10-12-1996','MM-DD-YYYY'),223456,122133)
   INTO customer (customerid, driverlicence, brithday, address, City, State, Phone, Zipcode, LastName,FirstName) Values (1234, 1234567890, TO_DATE('1-12-1966','MM-DD-YYYY'),'1 Main st','Newrak','New Jersey',3022221235,19997,'Ambrose','Walter')
   INTO customer (customerid, driverlicence, brithday, address, City, State, Phone, Zipcode, LastName,FirstName) Values (1111, NULL, TO_DATE('1-30-2000','MM-DD-YYYY'),'445 Mount Eden Road','Mount Eden','Auckland',1201115296,39100,'Blaixton','Bartram')
   INTO customer (customerid, driverlicence, brithday, address, City, State, Phone, Zipcode, LastName,FirstName) Values (2222, 5266314899, TO_DATE('4-30-1991','MM-DD-YYYY'),'2050 Bamako Place','Washington','DC',1873218498,20521,'Carre','Gawen')
   INTO customer (customerid, driverlicence, brithday, address, City, State, Phone, Zipcode, LastName,FirstName) Values (4444, 8245932156, TO_DATE('6-30-1985','MM-DD-YYYY'),'6170 Peshwar Place','Washington','DC ',7545186153,20521,'Coperwhate','Jarret')
   INTO Warehouse (WarehouseID,WarehouseName,City,State,ZIPcode) Values (10000001,'Smith Warehouse','Washington','DC',20521)
   INTO Warehouse (WarehouseID,WarehouseName,City,State,ZIPcode) Values (10000002,'Winner Warehouse','Dover','DE',19700)
   INTO Warehouse (WarehouseID,WarehouseName,City,State,ZIPcode) Values (10000003,'Smith Warehouse','NYC','NY',10001)
   INTO Car (VIN, WarehouseID,MODEL,MAKER,YEAR,Miles,Color,Feature) Values ('1B7GG23Y4RW149187',10000001,'340i','BMW',2017,34,'Black','AC, DCT, AWD')
   INTO Car (VIN, WarehouseID,MODEL,MAKER,YEAR,Miles,Color,Feature) Values ('JTHBF5C24B5151848',10000001,'P100D','TESLA',2018,20,'Black','Rmote, APP, Autopliot')
   INTO Car (VIN, WarehouseID,MODEL,MAKER,YEAR,Miles,Color,Feature) Values ('2FZACFDC04AN08839',10000002,'RS7','Audi',2010,60,'Black','quattro')
   INTO Car (VIN, WarehouseID,MODEL,MAKER,YEAR,Miles,Color,Feature) Values ('3GNEK12T85G291533',10000002,'CC','Volkswagen',2012,86,'Black','DSG')
   INTO Car (VIN, WarehouseID,MODEL,MAKER,YEAR,Miles,Color,Feature) Values ('WA1LFAFP3FA041029',10000003,'One:1','Koenigsegg',2016,6,'Black Orange','1350HP, Carbon Fiber Body')
   INTO Car (VIN, WarehouseID,MODEL,MAKER,YEAR,Miles,Color,Feature) Values ('WDBLK70G63T132064',10000003,'Macan Turbo','Prosche',2018,15,'Black','Air Suspension, AWD')
   INTO Insurance(InsuranceID,Company,InsurancePolicyID) Values (800001,'State Fram',18632481)
   INTO Insurance(InsuranceID,Company,InsurancePolicyID) Values (800003,'GEICO',4562785)
   INTO Insurance(InsuranceID,Company,InsurancePolicyID) Values (800004,'Progressive',42126748924)
   INTO Insurance(InsuranceID,Company,InsurancePolicyID) Values (800005,'Liberty Mutual',451567486)
   INTO Repair (ServiceID,VIN,PartNumeber,PartsPrice,LaberCost) Values(7000000001,'1B7GG23Y4RW149187',1542639564,300,1000)
   INTO Repair (ServiceID,VIN,PartNumeber,PartsPrice,LaberCost) Values(7000000002,'2FZACFDC04AN08839',1561321843,1000,2000)
   INTO Repair (ServiceID,VIN,PartNumeber,PartsPrice,LaberCost) Values(7000000003,'3GNEK12T85G291533',8743218431,500,200)
   INTO Sales (ContactID,SalesEmployee,VIN,InsuranceID,price,SalesDate,customerid) Values (600001,211112,'1B7GG23Y4RW149187',800001,56000,TO_DATE('11-01-2018','MM-DD-YYYY'),1234)
   INTO Sales (ContactID,SalesEmployee,VIN,InsuranceID,price,SalesDate,customerid) Values (600002,211112,'3GNEK12T85G291533',800003,32000,TO_DATE('10-30-2018','MM-DD-YYYY'),1111)
   INTO Sales (ContactID,SalesEmployee,VIN,InsuranceID,price,SalesDate,customerid) Values (600003,211113,'WA1LFAFP3FA041029',800004,1200000,TO_DATE('03-01-2018','MM-DD-YYYY'),2222)
   INTO Sales (ContactID,SalesEmployee,VIN,InsuranceID,price,SalesDate,customerid) Values (600004,211113,'WDBLK70G63T132064',800005,84000,TO_DATE('02-28-2018','MM-DD-YYYY'),4444)
SELECT 1 FROM DUAL;

--display all table:
--Select * from Department;
--SELECT * FROM Sales;
--SELECT * FROM employee;
--Select * from Car;
--Select * from sales;
--Select * from repair;
--Select * from warehouse;
--Select * from insurance;

-- Using Delete and Update
-- Boss fired one employee. Since only one employee left in the department, he decied to rise the last employee salary.
DELETE From employee Where employeeid=211185;

UPdate employee Set salary=6000 Where employeeid = 211176;
--display the result for comparsion.
SELECT * FROM employee;

-- Using alter to add new column, then update and calculate the total cost for each car repair. 
ALTER TABLE repair
ADD TotalCost Number(7,2);
UPdate repair Set TotalCost=(partsprice + labercost)  ;
Select * from repair;

-- Display the cost to repair for each brand and model by using view.
Create or replace View Car_repair_cost_wiht_Brand AS
Select c.maker as maker, c.model as model, r.Totalcost as repaircost
from car c, repair r
where c.vin = r.vin;
Select * from Car_repair_cost_wiht_Brand;


-- Using view to display total salary that the company paied.
Create or replace View Total_salary AS
select sum(employee.salary) as total_salary
from employee;
Select * from Total_salary;

-- Display all income from repair and selling cars.
Create or replace View income AS
select sum(s.price) as total_sales, sum (r.totalcost) as total_repairincome
from sales s, repair r ;
Select * from income;

-- Using other two Views information to get Net-income.
Create or replace View Net_income AS
select (i.total_sales + i.total_repairincome - s.total_salary) as Netincome
from Total_salay s, income i ;
Select * from Net_income;

-- Display salary and employee in descending order.  
Select LastName, FirstName, Salary 
from employee 
order by Salary DESC, lastname;

-- Shows all sold car with salesman in descending order by price. 
Select s.price, c.Maker, c.model , e.LastName, e.FirstName 
from car c, employee e, sales s 
where s.vin = c.vin and e.employeeid = s.SalesEmployee 
order by s.price desc;
