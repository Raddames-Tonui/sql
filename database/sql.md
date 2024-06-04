
# SQLite In-Memory Database Operations

This README provides an overview of the SQL operations to create and manage a simple in-memory SQLite database with `user` and `course` tables.

## Database Setup

### Create Tables

a. **User Table**:
```sql
CREATE TABLE IF NOT EXISTS user (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT,
    age INTEGER NOT NULL
);
```
b. Course Table
```sql
CREATE TABLE IF NOT EXISTS course (
    course_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    course_name TEXT NOT NULL,
    course_duration TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);
```

Modify Tables
Add a new column fees to the user table:
```sql

ALTER TABLE user ADD COLUMN fees DECIMAL(10, 2);
```

### Insert Data to user
```sql

INSERT INTO user (name, email, age, fees) 
VALUES  ('Alice Smith', 'alice@example.com', 30, 500.00),
        ('Bob Johnson', 'bob@example.com', 25, 450.00),
        ('Charlie Rose', 'charlie@example.com', 35, 600.00),
        ('Diana Prince', 'diana@example.com', 28, 550.00),
        ('Edward Norton', 'edward@example.com', 32, 700.00),
        ('Fiona Gallagher', 'fiona@example.com', 26, 480.00),
        ('George Carlin', 'george@example.com', 40, 750.00),
        ('Hannah Baker', 'hannah@example.com', 22, 400.00),
        ('Ian Somerhalder', 'ian@example.com', 38, 680.00),
        ('Jane Doe', 'jane@example.com', 29, 520.00);
```
### Insert Courses

```sql
INSERT INTO course (course_name, course_duration, user_id) 
VALUES  ('Mathematics', '3 months', 1),
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
```
### Update User Data
Update fees for a specific user:

``` sql

UPDATE user SET fees = 23000.50 WHERE user_id = 4;
Update course and fees for a specific user:
```
``` sql

UPDATE user SET course = 'Software Development', fees = 100 
WHERE user_id = 5;
```
### Delete Data
Delete a user by user_id:

``` sql

DELETE FROM user WHERE user_id = 14;
Delete users by user_id or email:
```
``` sql

DELETE FROM user WHERE user_id = 5 OR email = "isaac@yahoo.com";
Delete users by course:
```
```sql

DELETE FROM user WHERE course = 'Software Development';
Delete users in a range of user_id:
```
```sql

DELETE FROM user WHERE user_id BETWEEN 10 AND 12;
```
### Query Data
Select Data with Conditions
Select specific columns:

```sql

SELECT name, email, fees FROM user WHERE fees > 10000;
Order results by columns:
```
```sql

SELECT name, email, fees FROM user ORDER BY name, email;
Order results by columns in descending order:
```
```sql

SELECT name, email, fees FROM user ORDER BY name, email DESC;
Select users within an age range:
```
```sql

SELECT name, email, fees FROM user WHERE age BETWEEN 20 AND 24;
Aggregate Functions
Calculate the maximum fees:
```
```sql

SELECT MAX(fees) AS max_fees FROM user;
Count users within an age range:
```
```sql

SELECT COUNT(fees) FROM user WHERE age BETWEEN 20 AND 24;
Group by fees and count:
```
```sql

SELECT name, COUNT(fees) FROM user GROUP BY fees;
Advanced Queries
Select specific users by name:
```
```sql

SELECT * FROM user WHERE name = "June" OR name = "Raddames";
Select users with names starting with 'r':
```
```sql

```SELECT * FROM user WHERE name LIKE "r%";
Select distinct names:


SELECT DISTINCT name FROM user;
Select users with fees greater than a specific amount:


 SELECT name FROM user WHERE fees > 20000;
```