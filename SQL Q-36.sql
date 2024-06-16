CREATE TABLE shop (
    user_id INT,
    item_ordered VARCHAR(512)
);
INSERT INTO shop VALUES 
('1', 'Pizza'),
('1', 'Burger'),
('2', 'Cold Drink'),
('2', 'Burger'),
('3', 'Burger'),
('3', 'Cold Drink'),
('4', 'Pizza'),
('4', 'Cold Drink'),
('5', 'Cold Drink'),
('6', 'Burger'),
('6', 'Cold Drink'),
('7', 'Pizza'),
('8', 'Burger');

-- Write an SQL query to fetch user IDs that have only bought both 'Burger' and 'Cold Drink' items.

-- ANSWER

select * from shop;

select 
     user_id,
     group_concat(item_ordered) as combo
from shop
where item_ordered in ("Burger","Cold Drink")
group by user_id
having count(*) =2;