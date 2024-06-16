CREATE TABLE Customers1 (
    CustomerID INT,
    CustomerName VARCHAR(50)
);
CREATE TABLE Purchases (
    PurchaseID INT,
    CustomerID INT,
    ProductName VARCHAR(50),
    PurchaseDate DATE
);
INSERT INTO Customers1 (CustomerID, CustomerName) VALUES
(1, 'John'),
(2, 'Emma'),
(3, 'Michael'),
(4, 'Ben'),
(5, 'John')	;
INSERT INTO Purchases (PurchaseID, CustomerID, ProductName, PurchaseDate) VALUES
(100, 1, 'iPhone', '2024-01-01'),
(101, 1, 'MacBook', '2024-01-20'),	
(102, 1, 'Airpods', '2024-03-10'),
(103, 2, 'iPad', '2024-03-05'),
(104, 2, 'iPhone', '2024-03-15'),
(105, 3, 'MacBook', '2024-03-20'),
(106, 3, 'Airpods', '2024-03-25'),
(107, 4, 'iPhone', '2024-03-22'),	
(108, 4, 'Airpods', '2024-03-29'),
(110, 5, 'Airpods', '2024-02-29'),
(109, 5, 'iPhone', '2024-03-22');

/* write a SQL query to find customers who bought Airpods after purchasing an iPhone. */

-- ANSWER

select * from Customers1;
select * from Purchases;

with cte as (
select CustomerID, ProductName,PurchaseDate from Purchases where ProductName= "iphone"),
cte2 as (
select CustomerID, ProductName,PurchaseDate from Purchases where ProductName= "Airpods")

select * from Customers1 
where customerid in (
select a.customerid
from cte as a join cte2 as b
on a.CustomerID = b.CustomerId
where a.PurchaseDate < b.PurchaseDate);