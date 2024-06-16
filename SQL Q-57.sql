CREATE TABLE std (
    PersonID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Score INT
);
INSERT INTO std (PersonID, Name, Email, Score) VALUES
(1, 'Alice', 'alice2018@hotmail.com', 88),
(2, 'Bob', 'bob2018@hotmail.com', 11),
(3, 'Davis', 'davis2018@hotmail.com', 27),
(4, 'Tara', 'tara2018@hotmail.com', 45),
(5, 'John', 'john2018@hotmail.com', 63);

-- Create the table named 'friend'
CREATE TABLE friend (
    PersonID INT,
    FriendID INT
    
);
INSERT INTO friend (PersonID, FriendID) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 5),
(4, 2),
(4, 3),
(4, 5);


-- find the person_id whose friends total marks > 100

-- ANSWER 

select * from std;
select * from friend;

with cte as (
select 
     f.personid,
     f.friendid,
     s.name,
     s. score
from friend as f join std as s
on f.FriendID = s.PersonID),

cte2 as (
select 
     personid,
     group_concat(name) as frnds,
     sum(score) as totals
from cte
group by personid
having sum(score) > 100)

select 
     a.personid, 
     s.name, 
     a.frnds,
     a.totals
from cte2 as a join std as s
on a.personid = s.personid;