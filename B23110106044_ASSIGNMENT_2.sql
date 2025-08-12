-- CREATING TABLES

CREATE TABLE Customers(
CustomerID SERIAL PRIMARY KEY,
CustomerName VARCHAR(70),
City VARCHAR(50),
State VARCHAR(50),
JoinDate DATE
);

CREATE TABLE Cars(
CarID SERIAL PRIMARY KEY,
Model VARCHAR(70),
Brand VARCHAR(50),
Year INT,
Price NUMERIC(7,2),
Color VARCHAR(30),
InventoryCount INT
);

CREATE TABLE Salespersons(
SalespersonID SERIAL PRIMARY KEY,
Name VARCHAR(70),
Department VARCHAR(50),
HireDate DATE
);

CREATE TABLE Sales(
SaleID SERIAL PRIMARY KEY,
CustomerID INT REFERENCES Customers(CustomerID),
CarID INT REFERENCES Cars(CarID),
SaleDate DATE,
SalePrice NUMERIC(10,2),
SalespersonID INT REFERENCES Salespersons(SalespersonID)
);

CREATE TABLE ServiceRecords(
RecordID SERIAL PRIMARY KEY,
CarID INT REFERENCES Cars(CarID),
ServiceDate DATE,
ServiceType VARCHAR(50),
Cost NUMERIC(7,2),
TechnicianID INT
);

-- INSERTING VALUES IN TABLES
INSERT INTO Customers (CustomerName, City, State, JoinDate) VALUES
('Ali Khan', 'Lahore', 'Punjab', '2021-01-10'),
('Sara Ahmed', 'Karachi', 'Sindh', '2021-02-15'),
('John Smith', 'Islamabad', 'ICT', '2021-03-05'),
('Maryam Fatima', 'Multan', 'Punjab', '2022-01-12'),
('Bilal Hassan', 'Faisalabad', 'Punjab', '2022-03-20'),
('Zain Malik', 'Karachi', 'Sindh', '2023-01-01');

INSERT INTO Cars (Model, Brand, Year, Price, Color, InventoryCount) VALUES
('Civic', 'Honda', 2023, 45000, 'White', 5),
('Accord', 'Honda', 2022, 55000, 'Black', 3),
('Corolla', 'Toyota', 2023, 40000, 'Silver', 7),
('Camry', 'Toyota', 2021, 60000, 'Black', 2),
('Model S', 'Tesla', 2023, 80000, 'Red', 4),
('Model 3', 'Tesla', 2022, 50000, 'Blue', 6),
('Alto', 'Suzuki', 2023, 15000, 'White', 10),
('Swift', 'Suzuki', 2022, 20000, 'Blue', 8);

INSERT INTO Salespersons (Name, Department, HireDate) VALUES
('Ahmed Raza', 'Sales', '2020-01-01'),
('Fatima Noor', 'Sales', '2021-02-01'),
('Usman Ali', 'Sales', '2019-03-01');

INSERT INTO Sales (CustomerID, CarID, SaleDate, SalePrice, SalespersonID) VALUES
(1, 1, '2023-01-15', 45000, 1),
(2, 2, '2023-02-20', 55000, 1),
(3, 3, '2023-03-05', 40000, 2),
(4, 4, '2023-03-15', 60000, 2),
(5, 5, '2023-04-10', 80000, 3),
(6, 6, '2023-05-12', 50000, 3),
(1, 3, '2023-06-01', 42000, 1),
(2, 1, '2023-06-15', 46000, 2),
(3, 7, '2023-07-10', 15000, 3),
(4, 8, '2023-07-15', 21000, 3),
(5, 4, '2023-08-01', 59000, 2),
(6, 2, '2023-08-20', 54000, 1),
(1, 5, '2023-09-01', 81000, 2);

INSERT INTO ServiceRecords (CarID, ServiceDate, ServiceType, Cost, TechnicianID) VALUES
(1, '2023-01-25', 'Oil Change', 300, 101),
(2, '2023-02-28', 'Brake Service', 700, 102),
(3, '2023-03-10', 'Tire Replacement', 500, 103),
(4, '2023-04-15', 'Engine Repair', 1200, 104),
(5, '2023-05-20', 'Battery Replacement', 600, 105),
(6, '2023-06-22', 'Oil Change', 350, 101),
(7, '2023-07-25', 'Tire Replacement', 450, 103),
(8, '2023-08-30', 'Engine Repair', 1500, 104);


-- 1. Total number of customers
SELECT COUNT(*) AS Total_Customers FROM Customers;

SELECT AVG(SalePrice) AS Avg_SalePrice FROM Sales;

SELECT MAX(SalePrice) AS Most_Expensive_Sale FROM Sales;

SELECT SUM(InventoryCount) AS Total_Inventory FROM Cars;

SELECT MIN(SaleDate) AS Earliest_Sale, MAX(SaleDate) AS Latest_Sale FROM Sales;

-- Part 2: GROUP BY Exercises
SELECT Brand, COUNT(*) AS Model_Count FROM Cars GROUP BY Brand;

SELECT SalespersonID, SUM(SalePrice) AS Total_Sales
FROM Sales
GROUP BY SalespersonID;

SELECT C.Model, AVG(S.SalePrice) AS Avg_Sale
FROM Sales S
JOIN Cars C ON S.CarID = C.CarID
GROUP BY C.Model;

SELECT ServiceType, AVG(Cost) AS Avg_Cost
FROM ServiceRecords
GROUP BY ServiceType;

SELECT Brand, Color, COUNT(*) AS Count_By_Color
FROM Cars
GROUP BY Brand, Color;

-- Part 3: HAVING Clause Exercises
SELECT Brand, COUNT(*) AS Model_Count
FROM Cars
GROUP BY Brand
HAVING COUNT(*) > 5;

SELECT C.Model, COUNT(*) AS Sale_Count
FROM Sales S
JOIN Cars C ON S.CarID = C.CarID
GROUP BY C.Model
HAVING COUNT(*) > 10;

SELECT SalespersonID, AVG(SalePrice) AS Avg_Sale
FROM Sales
GROUP BY SalespersonID
HAVING AVG(SalePrice) > 50000;

SELECT TO_CHAR(SaleDate, 'YYYY-MM') AS Sale_Month, COUNT(*) AS Sale_Count
FROM Sales
GROUP BY TO_CHAR(SaleDate, 'YYYY-MM')
HAVING COUNT(*) > 20;

SELECT ServiceType, AVG(Cost) AS Avg_Cost
FROM ServiceRecords
GROUP BY ServiceType
HAVING AVG(Cost) > 500;