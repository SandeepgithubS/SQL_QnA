CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY,
    OrderID INT
);

INSERT INTO Orders (OrderID, OrderDate, TotalAmount) VALUES
(1, '2023-01-15', 150.50),
(2, '2023-02-20', 200.75),
(3, '2023-02-28', 300.25),
(4, '2023-03-10', 180.00),
(5, '2023-04-05', 250.80);

INSERT INTO Returns (ReturnID, OrderID) VALUES
(101, 2),
(102, 4),
(103, 5),
(104, 1),
(105, 3);

/* Given the Orders table with columns OrderID, OrderDate, and TotalAmount, and the 
Returns table with columns ReturnID and OrderID, 
write an SQL query to calculate the total numbers of returned orders for each month */

-- ANSWER

select * from orders;
select * from returns;

select 
    monthname(o.orderdate) as month,
    count(r.returnid) as retns
from orders as o left join returns as r
on o.orderid = r.orderid
group by monthname(o.orderdate);