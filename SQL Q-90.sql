CREATE TABLE purchase_history (
    userid INT,
    productid INT,
    purchasedate DATE
);
INSERT INTO purchase_history (userid, productid, purchasedate) VALUES
(1, 1, '2012-01-23'),
(1, 2, '2012-01-23'),
(1, 3, '2012-01-25'),
(2, 1, '2012-01-23'),
(2, 2, '2012-01-23'),
(2, 2, '2012-01-25'),
(2, 4, '2012-01-25'),
(3, 4, '2012-01-23'),
(3, 1, '2012-01-23'),
(4, 1, '2012-01-23'),
(4, 2, '2012-01-25');

-- FIND THE USERID WHO HAVE PURCHACE DIFFERENT PRODUCT, BUT NOT IN THE SAME DATE

-- ANSWER 

select * from purchase_history;
with cte as (
select * 
from purchase_history 
where userid in (select 
				userid
				from purchase_history 
                group by userid
                having count(distinct purchasedate) >=2))
select userid
from cte
group by userid
having count(*) = count(distinct productid);