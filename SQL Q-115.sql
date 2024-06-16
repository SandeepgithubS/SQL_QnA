CREATE TABLE Employees5 (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT
);

INSERT INTO Employees5 (id, name, department, managerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101),
(107, 'Michael', 'C', NULL),
(108, 'Sarah', 'C', 107),
(109, 'Emily', 'C', 107),
(110, 'Brian', 'C', 107);

/* Given a table named employees with the following columns: id, name, department, managerId
Write a SQL query to find the names of  managers who have at least five direct reports. 
Return the result table in any order.Ensure that no employee is their own manager.
The result format should include only the names of the managers meeting the criteria. */

-- ANSWER

select * from employees5;

select 
    a.managerid,
    b.name
from employees5 as a join employees5 as b
where a.managerId = b.id
group by 1,2
having count(a.managerid) >=5;