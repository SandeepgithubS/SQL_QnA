CREATE TABLE Employees3 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);
INSERT INTO Employees3 (id, name) VALUES
    (1, 'Alice'),
    (7, 'Bob'),
    (11, 'Meir'),
    (90, 'Winston'),
    (3, 'Jonathan');

CREATE TABLE EmployeeUNI (
    id INT PRIMARY KEY,
    unique_id INT
);
INSERT INTO EmployeeUNI (id, unique_id) VALUES
    (3, 1),
    (11, 2),
    (90, 3);
    
/* Write a solution to show the unique ID of each user, 
   If a user does not have a unique ID replace just show null.
    Return employee name and their unique_id. */
    
-- ANSWER

select * from employees3;
select * from EmployeeUNI;

select 
    a.name,
    b. unique_id 
from employees3 as a left join EmployeeUNI as b
on a.id = b.unique_id
order by 1;
