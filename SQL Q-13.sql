CREATE TABLE tweets (
    tweet_id INTEGER,
    user_id INTEGER,
    msg VARCHAR(255),
    tweet_date TIMESTAMP
);
INSERT INTO tweets (tweet_id, user_id, msg, tweet_date) VALUES
(214252, 111, 'Am considering taking Tesla private at $420. Funding secured.', '2021-12-30 00:00:00'),
(739252, 111, 'Despite the constant negative press covfefe', '2022-01-01 00:00:00'),
(846402, 111, 'Following @NickSinghTech on Twitter changed my life!', '2022-02-14 00:00:00'),
(241425, 254, 'If the salary is so competitive why won’t you tell me what it is?', '2022-03-01 00:00:00'),
(231574, 148, 'I no longer have a manager. I can\'t be managed', '2022-03-23 00:00:00');

-- Write a query to obtain a histogram of tweets posted per user in 2022. 
-- Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

-- ANSWER

select * from tweets;

SELECT 
num_post,
COUNT(user_id) as num_user
FROM
  (
    SELECT
      user_id,
      COUNT(tweet_id) as num_post
    FROM tweets
    WHERE EXTRACT(YEAR FROM tweet_date) = '2022'
    GROUP BY user_id
    )x1
GROUP BY num_post;