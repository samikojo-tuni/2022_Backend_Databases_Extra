# Setting up the development environment
During the 1st lesson, we set up the development environment and started learning SQL basics.
Install instructions can be found from instructions.md file.

# SQL-commands
Create-command can be used to create e.g. databases and tables.

## Students example
```
CREATE DATABASE learning;

-- See if database creation worked
SHOW DATABASES;

-- If learning is listed here, everything went well

-- Create table for storing student information
CREATE TABLE students(
  id INT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  birth_year YEAR);

-- Make sure students table is listed
SHOW TABLES;

-- Describe colunms of the students table
DESCRIBE students;

-- Add some data into the student table
INSERT INTO students(id, first_name, last_name, birth_year) VALUES
  (123123, "Madalyn", "Matthewson", 1990),
  (121212, "Liz", "Doctor", 1995),
  (987654, "Mack", "Garbutt", 1999),
  (654893, "Alesha", "Hoggard", 2002),
  (332233, "Margaret", "Hightower", 2001),
  (223344, "Pat", "Burnham", 2000),
  (768975, "Anderson", "Wyatt", 2002),
  (446688, "Bryn", "Savage", 1995),
  (997755, "Tawnee", "Seymour", 1992),
  (421789, "Permelia", "Lamb", 1998);

-- See that the data is there
SELECT * FROM students;

-- Try to insert data with a conflicting primary key
INSERT INTO students(id, first_name, last_name) VALUES
  (997755, "Mick", "Johnson");

-- The previous command should have failed
-- Let's fix the primary key and add a new row with birth_year column set to NULL
INSERT INTO students(id, first_name, last_name) VALUES (456543, "Mick", "Johnson");

-- That worked just fine
-- Let's fetch all student information and order the result set by last_name
SELECT * FROM students ORDER BY last_name;

-- If we want to order the result in descending order, we can add DESC modifier
SELECT * FROM students ORDER BY last_name DESC;

-- Update some information
UPDATE students SET birth_year=1994 WHERE id=121212;

-- Delete one student
DELETE FROM students WHERE id=997755;

-- Usually we don't want to fetch all the data. Let's fetch only students' first and last name
SELECT first_name, last_name FROM students;

-- Select only those students who don't have birth year set
SELECT first_name, last_name FROM students WHERE birth_year IS NULL;

-- Let's reverse the query and select students who have birth year set
SELECT first_name, last_name FROM students WHERE birth_year IS NOT NULL;

-- We can filter the result set by using WHERE clause
SELECT first_name, last_name FROM students WHERE birth_year < 1995;
SELECT first_name, last_name, birth_year FROM students WHERE birth_year > 1995;

-- Like operator can be used to create string searches with wildcard characters. The
-- query below returns all students who have a first name beginning with M.
SELECT first_name, last_name, birth_year
FROM students
WHERE first_name LIKE "M%";

-- We can combine two or more conditions with AND and OR operators
SELECT first_name, last_name, birth_year
FROM students
WHERE birth_year=2001 OR birth_year=2002;

SELECT first_name, last_name, birth_year
FROM students
WHERE first_name LIKE "M%" AND first_name LIKE "%k";
```

## Music database required by Exercise 1
Download the music database creation script from Materials folder.
If you use Cygwin, copy that file to your Cygwin folder, e.g.
C:\Cygwin64\home\<user_name>\databases\

Open MariaDB terminal with command `mysql -u root -p`
Create a new database `CREATE DATABASE music;`
Exit the MariaDB terminal `quit();`

Run the create_music.sql script
`mysql -u root -p < create_music.sql`
Note: This has to be run in the folder where you stored the create_music.sql file.

You can use the music database to test your solutions for the exercise 1.

Create a new folder where you will add solutions to exercises.
`mkdir exercises`
Move to that folder
`cd exercises`

Go to GitHub.com and create a new repository for yourself. Make it private at this point.

Intialize a new local Git repository
`git init`

Add your remote repository for this Git repo
`git remote add origin https://github.com/<username>/<reponame>.git`

Create a folder for the 1st exercise and move there
```
mkdir exercise_1
cd exercise_1
```

Create a new file for each task in exercise 1 and add your solution there.
You can do this using Visual Studio Code.

When you have created your solutions, commit and push them. You can do this all at once or one by one. In this example we will only commit and push the solution for the 1st task.

```
git add task1.sql
git commit -m "Add: Solution for the first task"
git push
```

If you haven't introduced yourself for the git yet, you must do that before the 1st commit works.
```
git config --global user.email "your_email_address"
git config --global user.name = "your_name"
```

If the push fails, it's probably beacuse there are no branches on the remote repository yet.
Let's create one
`git push --set-upstream origin master`

If Git complains about missing credentials, you need to authenticate yourself
`git push -u --set-upstream origin master`
And provide your username and access token (the token can be generated in GitHub's web page)