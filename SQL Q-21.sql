CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    likes INT,
    post_date DATE
);
INSERT INTO posts (post_id, user_id, likes, post_date) VALUES
(1, 101, 50, '2024-02-27'),
(2, 102, 30, '2024-02-28'),
(3, 103, 70, '2024-02-29'),
(4, 101, 80, '2024-02-01'),
(5, 102, 40, '2024-02-02'),
(6, 103, 60, '2024-02-29'),
(7, 101, 90, '2024-01-29'),
(8, 101, 20, '2024-02-05'),
(9, 102, 50, '2024-01-29'),
(10, 103, 30, '2024-02-29'),
(11, 101, 60, '2024-01-08'),
(12, 102, 70, '2024-01-09'),
(13, 103, 80, '2024-01-10'),
(14, 101, 40, '2024-01-29'),
(15, 102, 90, '2024-01-29'),
(16, 103, 20, '2024-01-13'),
(17, 101, 70, '2024-01-14'),
(18, 102, 50, '2024-02-29'),
(19, 103, 30, '2024-02-16'),
(20, 101, 60, '2024-02-17');

/* Determine the users who have posted more than 2 times  in the past week and calculate the total number of likes
they have received. Return user_id and number of post and no of likes */

-- ANSWER

select * from posts;
select 
      user_id, 
      week(post_date) as wk, 
      count(*) as cnt, 
      sum(likes) as total 
from posts 
where week(post_date) < (select max(week(post_date)) from posts)
group by user_id, week(post_date)
having count(*) >= 2;