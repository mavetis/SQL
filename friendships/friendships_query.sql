-- Using the below ERD as reference, write a SQL query that returns a list of users along with their friends' names.
SELECT users.id, users.first_name, users.last_name, users2.first_name AS friend_first_name, users2.last_name AS friend_last_name
FROM users
LEFT JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users as users2 ON users2.id = friendships.friend_id;

-- Return all users who are friends with Kermit, make sure their names are displayed in results.
SELECT users.first_name, users.last_name, users2.first_name AS friend_first_name, users2.last_name AS friend_last_name
FROM users
LEFT JOIN friendships ON users.id = friendships.friend_id
LEFT JOIN users AS users2 ON friendships.user_id = users2.id
WHERE users.first_name = 'Kermit';

-- Return the count of all friendships
SELECT COUNT(friendships.id) AS 'Num of Friends'
FROM friendships;

-- Find out who has the most friends and return the count of their friends.
SELECT users.first_name, users.last_name, COUNT(friendships.id) AS num_of_friends
FROM users
LEFT JOIN friendships ON users.id = friendships.user_id
GROUP BY users.id
ORDER BY 'num_of_friends' DESC
LIMIT 1;

-- Create a new user and make them friends with Eli Byers, Kermit The Frog, and Marky Mark
insert into users (first_name, last_name)
values ("marina", "Avetisian");
insert into friendships (user_id, friend_id)
values (6, 2),(6,4),(6,5);

-- Return the friends of Eli in alphabetical order
SELECT users.first_name AS friend_name, users.last_name AS friend_last_name, friend.first_name, friend.last_name
FROM users 
LEFT JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users AS friend ON friendships.friend_id = friendships.friend.id
WHERE friend.first_name = 'Eli'
ORDER BY users.first_name ASC;

-- Remove Marky Mark from Eli’s friends. 
SELECT friend.id AS 'id',friend.first_name AS 'first_name',friend.last_name AS 'last_name',
users.first_name AS 'friend_name',users.last_name AS 'friend_last_name',friendships.friend_id
FROM users
LEFT JOIN friendships ON users.id = friendships.friend_id
AND users.first_name = 'Marky'
LEFT JOIN users AS friend ON friendships.user_id = friend.id
AND friend.first_name = 'Eli';
DELETE FROM friendships 
WHERE user_id = 2 AND friend_id = 5;

-- Return all friendships, displaying just the first and last name of both friends
SELECT users.first_name,users.last_name,users2.first_name AS friend_first_name,users2.last_name AS friend_last_name
FROM users
LEFT JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users AS users2 ON friendships.friend_id = users2.id;
