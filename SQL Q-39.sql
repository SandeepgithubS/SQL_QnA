CREATE TABLE Songs (
    song_id INT ,
    song_name VARCHAR(255),
    artist_name VARCHAR(255)
);
CREATE TABLE Listens (
    listen_id INT PRIMARY KEY,
    user_id INT,
    song_id INT,
    listen_date DATE
);
INSERT INTO Songs (song_id, song_name, artist_name) VALUES
(1, 'Song A', 'Artist X'),
(2, 'Song B', 'Artist Y'),
(3, 'Song C', 'Artist Z'),
(4, 'Song D', 'Artist X'),
(5, 'Song E', 'Artist Y'),
(6, 'Song F', 'Artist Z'),
(7, 'Song G', 'Artist X'),
(8, 'Song H', 'Artist Y'),
(9, 'Song I', 'Artist Z'),
(10, 'Song J', 'Artist X');

INSERT INTO Listens (listen_id, user_id, song_id, listen_date) VALUES
(1, 101, 1, '2024-03-22'),
(2, 102, 1, '2024-03-22'),
(3, 103, 2, '2024-03-22'),
(4, 104, 2, '2024-03-22'),
(5, 105, 2, '2024-03-22'),
(6, 106, 3, '2024-03-22'),
(7, 107, 4, '2024-03-22'),
(8, 108, 5, '2024-03-22'),
(9, 109, 6, '2024-03-22'),
(10, 110, 7, '2024-03-22'),
(11, 111, 7, '2024-03-22'),
(12, 112, 8, '2024-03-22'),
(13, 113, 8, '2024-03-22'),
(14, 114, 8, '2024-03-22'),
(15, 115, 9, '2024-03-22'),
(16, 116, 9, '2024-03-22'),
(17, 117, 10, '2024-03-22'),
(18, 118, 10, '2024-03-22'),
(19, 119, 10, '2024-03-22'),
(20, 120, 10, '2024-03-22');

/* Write a SQL query to find the top 10 most popular songs by total number of listens. 
You have two tables: Songs (containing song_id, song_name, 
and artist_name) and Listens (containing listen_id, user_id, song_id, and listen_date) */

-- ANSWER

select * from songs;
select * from listens;

select 
     s.song_name,
     count(l.user_id) as cnt
from songs as s join listens as l
on s.song_id = l.song_id
group by s.song_name
order by 2 desc
limit 10;