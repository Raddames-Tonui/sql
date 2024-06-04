-- database: :memory:

-- Create the user table if it doesn't exist
CREATE TABLE IF NOT EXISTS user (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT,
    age INTEGER NOT NULL
);

-- Create the course table if it doesn't exist
CREATE TABLE IF NOT EXISTS course (
    course_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    course_name TEXT NOT NULL,
    course_duration TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Add a new column 'fees' to the user table
-- ALTER TABLE user ADD COLUMN fees DECIMAL(10, 2);

-- Insert data into user table
INSERT INTO user (name, email, age, fees) VALUES 
('Alice Smith', 'alice@example.com', 30, 500.00),
('Bob Johnson', 'bob@example.com', 25, 450.00),
('Charlie Rose', 'charlie@example.com', 35, 600.00),
('Diana Prince', 'diana@example.com', 28, 550.00),
('Edward Norton', 'edward@example.com', 32, 700.00),
('Fiona Gallagher', 'fiona@example.com', 26, 480.00),
('George Carlin', 'george@example.com', 40, 750.00),
('Hannah Baker', 'hannah@example.com', 22, 400.00),
('Ian Somerhalder', 'ian@example.com', 38, 680.00),
('Jane Doe', 'jane@example.com', 29, 520.00);

-- Insert data into course table
INSERT INTO course (course_name, course_duration, user_id) VALUES 
('Mathematics', '3 months', 1),
('Science', '4 months', 2),
('History', '2 months', 1),
('English', '3 months', 3),
('Physics', '5 months', 4),
('Chemistry', '3 months', 5),
('Biology', '4 months', 6),
('Computer Science', '6 months', 7),
('Literature', '2 months', 8),
('Art', '3 months', 9),
('Music', '4 months', 10);


SELECT user.user_id, user.name AS user_name, user.email, user.age, user.fees,
       course.course_id, course.course_name, course.course_duration
FROM user
INNER JOIN course ON user.user_id = course.user_id;

-- UPDATE user SET fees=23000.50 WHERE id = 4
-- UPDATE user SET course = 'Software Development', fees = 100 WHERE id =5 

-- DELETE FROM user WHERE id = 14
-- DELETE FROM user WHERE id =5 OR email = "isaac@yahoo.com"
-- DELETE FROM user WHERE COURSE = 'Software Development'
-- DELETE FROM user WHERE id BETWEEN 10 AND 12

-- SELECT column FROM user WHERE condition
-- SELECT name, email, fees FROM user WHERE fees > 10000
-- SELECT name, email, fees FROM user ORDER BY name,email
-- SELECT name, email, fees FROM user ORDER BY name,email DESC
-- SELECT name, email, fees FROM user WHERE age BETWEEN 20 AND 24

-- AGGREGATE sum, max, min, count, avg
-- SELECT max(fees) AS avg_fees FROM user
-- SELECT count(fees) FROM user WHERE age BETWEEN 20 AND 24
-- SELECT name, COUNT(fees) FROM user GROUP BY fees;

-- SELECT * FROM user WHERE name = "June" OR name = "Raddames"
-- SELECT * FROM user WHERE name LIKE "r%"
-- SELECT DISTINCT name FROM user 
-- SELECT name FROM user WHERE fees >20000

