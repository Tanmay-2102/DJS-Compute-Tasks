CREATE DATABASE Social_Media;

USE Social_Media;

CREATE TABLE Users (
    user_id VARCHAR(10) PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(50),
    join_date DATE,
    country VARCHAR(20),
    bio TEXT );

CREATE TABLE Posts (
    post_id VARCHAR(10) PRIMARY KEY,
    user_id VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),   
    content TEXT,
    timestamp DATETIME,
    likes_count INT,
    comments_count INT );

CREATE TABLE Comments (
	comment_id VARCHAR(10) PRIMARY KEY,
    post_id VARCHAR(10),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    user_id VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    content TEXT,
    timestamp DATETIME );

CREATE TABLE Friendships (
    friendship_id VARCHAR(10) PRIMARY KEY,
    user_id1 VARCHAR(10),
    FOREIGN KEY (user_id1) REFERENCES Users(user_id),
    user_id2 VARCHAR(10),
    FOREIGN KEY (user_id2) REFERENCES Users(user_id),
    status VARCHAR(20),
    created_at DATE );

CREATE TABLE UserInterests (
    interest_id VARCHAR(10) PRIMARY KEY,
    user_id VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    interest VARCHAR(20) );
    
INSERT INTO Users (user_id, username, email, join_date, country, bio)
VALUES
('U001', 'social_butterfly', 'user001@email.com', '2023-01-15', 'USA', 'Love to travel and meet new people'),
('U002', 'tech_guru', 'techie@email.com', '2022-11-30', 'India', 'Tech enthusiast and coder'),
('U003', 'fitness_fanatic', 'fitfan@email.com', '2024-03-22', 'Brazil', 'Fitness enthusiast and health coach'),
('U004', 'foodie_lover', 'foodie@email.com', '2023-07-12', 'India', 'Food blogger and recipe creator'),
('U005', 'nature_photo', 'naturephoto@email.com', '2022-05-14', 'Brazil', 'Nature photography enthusiast'),
('U006', 'bookworm', 'bookworm@email.com', '2021-12-20', 'India', 'Avid reader and book reviewer'),
('U007', 'travel_junkie', 'traveljunkie@email.com', '2023-08-03', 'France', 'Travel addict exploring the world'),
('U008', 'music_maniac', 'musicmaniac@email.com', '2023-02-18', 'USA', 'Music lover'),
('U009', 'gamer_guy', 'gamerguy@email.com', '2023-09-25', 'India', 'Passionate about games'),
('U010', 'fashionista', 'fashionista@email.com', '2023-06-30', 'USA', 'Fashion blogger and style enthusiast');

INSERT INTO Posts (post_id, user_id, content, timestamp, likes_count, comments_count)
VALUES
('P0001', 'U001', 'Having a great time at the beach!', '2024-07-14 15:30:00', 42, 5),
('P0002', 'U002', 'Just launched my new app!', '2024-07-14 16:45:00', 78, 12),
('P0003', 'U003', 'Feeling fantastic after a great workout!', '2024-07-14 16:00:00', 15, 3),
('P0004', 'U004', 'Check out my latest food blog!', '2024-07-14 18:15:00', 67, 8),
('P0005', 'U005', 'Captured a stunning sunset!', '2024-07-14 19:30:00', 34, 2),
('P0006', 'U006', 'Finished reading a fantastic book!', '2024-07-14 20:45:00', 54, 9),
('P0007', 'U007', 'Exploring the mountains!', '2024-07-14 21:00:00', 82, 14),
('P0008', 'U008', 'Attended an amazing concert!', '2024-07-14 22:15:00', 29, 6),
('P0009', 'U009', 'New high score on my favorite game!', '2024-07-14 23:30:00', 47, 11),
('P0010', 'U010', 'Sharing my latest fashion tips!', '2024-07-15 00:45:00', 39, 4),
('P0011', 'U001', 'Visited an ancient temple today!', '2024-07-15 08:30:00', 25, 2),
('P0012', 'U002', 'Completed a coding marathon!', '2024-07-15 09:45:00', 60, 5),
('P0013', 'U003', 'Ran 10 miles this morning!', '2024-07-15 10:00:00', 80, 9),
('P0014', 'U001', 'Exploring the local markets!', '2024-07-16 08:30:00', 33, 4),
('P0015', 'U001', 'Mountain biking adventure!', '2024-07-16 09:45:00', 40, 6),
('P0016', 'U002', 'Built a new AI model today!', '2024-07-16 10:00:00', 72, 8),
('P0017', 'U002', 'Organized a tech meetup!', '2024-07-16 11:15:00', 85, 10),
('P0018', 'U003', 'Completed a marathon!', '2024-07-16 12:30:00', 95, 12),
('P0019', 'U003', 'Healthy meal prep for the week!', '2024-07-16 13:45:00', 65, 7),
('P0020', 'U001', 'Beachside yoga session!', '2024-07-16 14:00:00', 50, 5),
('P0021', 'U002', 'Started learning a new programming language!', '2024-07-16 15:15:00', 55, 6),
('P0022', 'U003', 'Joined a new fitness club!', '2024-07-16 16:30:00', 40, 4),
('P0023', 'U001', 'Visited a historical monument!', '2024-07-16 17:45:00', 38, 3),
('P0024', 'U002', 'Just published a new tech article!', '2024-07-17 08:30:00', 90, 11),
('P0025', 'U003', 'Trying out a new fitness routine!', '2024-07-17 10:00:00', 85, 9);

INSERT INTO Comments (comment_id, post_id, user_id, content, timestamp)
VALUES
('C0001', 'P0001', 'U002', 'Looks amazing!', '2024-07-14 15:35:00'),
('C0002', 'P0002', 'U003', 'Congrats on the launch!', '2024-07-14 16:50:00'),
('C0003', 'P0003', 'U001', 'Keep up the great work!', '2024-07-14 16:05:00'),
('C0004', 'P0004', 'U005', 'Yummy!', '2024-07-14 18:20:00'),
('C0005', 'P0005', 'U004', 'Beautiful shot!', '2024-07-14 19:35:00'),
('C0006', 'P0006', 'U007', 'That sounds great!', '2024-07-14 20:50:00'),
('C0007', 'P0007', 'U008', 'Love the view!', '2024-07-14 21:05:00'),
('C0008', 'P0008', 'U006', 'Amazing experience!', '2024-07-14 22:20:00'),
('C0009', 'P0009', 'U010', 'Well done!', '2024-07-14 23:35:00'),
('C0010', 'P0010', 'U009', 'Great advice!', '2024-07-15 00:50:00');

INSERT INTO Friendships (friendship_id, user_id1, user_id2, status, created_at)
VALUES
('F0001', 'U001', 'U002', 'accepted', '2024-05-20'),
('F0002', 'U002', 'U003', 'pending', '2024-06-15'),
('F0003', 'U003', 'U001', 'rejected', '2024-07-01'),
('F0004', 'U004', 'U005', 'pending', '2024-07-05'),
('F0005', 'U005', 'U006', 'rejected', '2024-07-10'),
('F0006', 'U006', 'U007', 'accepted', '2024-07-15'),
('F0007', 'U007', 'U008', 'pending', '2024-07-20'),
('F0008', 'U008', 'U009', 'accepted', '2024-07-25'),
('F0009', 'U009', 'U010', 'rejected', '2024-07-30'),
('F0010', 'U010', 'U001', 'accepted', '2024-08-01');

INSERT INTO UserInterests (interest_id, user_id, interest) 
VALUES
('I0001', 'U001', 'Travel'),
('I0002', 'U002', 'Technology'),
('I0003', 'U003', 'Fitness'),
('I0004', 'U004', 'Food'),
('I0005', 'U005', 'Photography'),
('I0006', 'U006', 'Reading'),
('I0007', 'U007', 'Travel'),
('I0008', 'U008', 'Music'),
('I0009', 'U009', 'Gaming'),
('I0010', 'U010', 'Fashion');

# SQL Queries:
# 1
SELECT u.user_id, u.username, COUNT(p.post_id) AS post_count
FROM Users u
INNER JOIN Posts p ON u.user_id = p.user_id
GROUP BY u.user_id, u.username
HAVING post_count > 5;

# 2
SELECT u.country, COUNT(u.user_id) AS user_count
FROM Users u
GROUP BY u.country
ORDER BY user_count DESC
LIMIT 3;

# 4
INSERT INTO Comments (comment_id, post_id, user_id, content, timestamp)
VALUES
('C0011', 'P0001', 'U001', 'Looks amazing!', '2024-07-14 15:35:00');

SELECT u.user_id, u.username, p.content AS post_content, c.content AS comment_content
FROM Comments c
JOIN Posts p ON c.post_id = p.post_id
JOIN Users u ON c.user_id = u.user_id
WHERE p.user_id = c.user_id;

# Bonus Task 1
DELIMITER //

CREATE TRIGGER increment_comments_count
AFTER INSERT ON Comments
FOR EACH ROW
BEGIN
    UPDATE Posts
    SET comments_count = comments_count + 1
    WHERE post_id = NEW.post_id;
END //

DELIMITER ;

INSERT INTO Comments (comment_id, post_id, user_id, content, timestamp)
VALUES
('C0012', 'P0001', 'U001', 'Looks amazing!', '2024-07-14 15:35:00');

DELIMITER //

CREATE TRIGGER decrement_comments_count
AFTER DELETE ON Comments
FOR EACH ROW
BEGIN
    UPDATE Posts
    SET comments_count = comments_count - 1
    WHERE post_id = OLD.post_id;
END //

DELIMITER ;

DELETE FROM Comments
WHERE comment_id = 'C0012';

SELECT * FROM Posts;
