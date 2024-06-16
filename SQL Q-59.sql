-- Create the table named 'players'
CREATE TABLE players (
    player_id INT,
    group_id INT
);
INSERT INTO players (player_id, group_id) VALUES
(15, 1),
(25, 1),
(30, 1),
(45, 1),
(10, 2),
(35, 2),
(50, 2),
(20, 3),
(40, 3);
CREATE TABLE matches (
    match_id INT,
    first_player INT,
    second_player INT,
    first_score INT,
    second_score INT
);
INSERT INTO matches (match_id, first_player, second_player, first_score, second_score) VALUES
(1, 15, 45, 3, 0),
(2, 30, 25, 1, 2),
(3, 30, 15, 2, 0),
(4, 40, 20, 5, 2),
(5, 35, 50, 1, 1);

-- find the winner in each group, who score max he is the winner

-- ANSWER

select * from matches;
select * from players;

with cte as (
select first_player as player, sum(first_score) as score from matches group by first_player
union all
select second_player, sum(second_score) from matches group by second_player),
cte2 as (
select 
    p.group_id,
    p.player_id,
    c.score
from players as p join cte as c 
on p.player_id = c.player)

select 
      group_id,
      max(score) as hrun
from cte2
group by 1;
