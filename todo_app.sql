-- drop database name todo_app if exists
DROP DATABASE IF EXISTS todo_app; -- PASS

-- delete a user named michael if it exists
DROP USER IF EXISTS michael; -- PASS

-- create a user named michael with an encrypted password stonebreaker
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker'; -- PASS

-- create a database named todo_app
CREATE DATABASE todo_app; -- PASS

-- Connect to the newly created database
CREATE TABLE tasks (
id SERIAL NOT NULL PRIMARY KEY,
title varchar(255) NOT NULL,
description text,
created_at timestamp NOT NULL DEFAULT now(),
updated_at timestamp,
completed boolean NOT NULL DEFAULT false
);-- PASS

-- remove the column named completed
ALTER TABLE "tasks"
DROP "completed"; -- PASS

-- add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL.
ALTER TABLE tasks ADD completed_at timestamp DEFAULT NULL; -- PASS

-- change the updated_at column to not allow NULL values, and have a default value of now()
ALTER TABLE tasks
  ALTER COLUMN updated_at SET DEFAULT 'now()',
  ALTER COLUMN updated_at SET NOT NULL; -- PASS

-- create a new task, by only setting values (not defining which columns) 
--id = default value
--title = 'Study SQL'
--description = 'Complete this exercise'
--created_at = now()
--updated_at = now()
--completed_at = NULL
INSERT INTO tasks 
VALUES(default, 'Study SQL', 'Complete this exercise', now(), now(), NULL); -- PASS

--	create a new task title = 'Study PostgreSQL' description = 'Read all the documentation'
INSERT INTO tasks (title, description, created_at, updated_at)
VALUES('Study PostgreSQL', 'Read all the documentation', now(), now()); -- PASS

--	select all the titles of tasks that are not yet completed
SELECT title
FROM tasks
WHERE completed_at IS NULL; -- PASS

--	update the task with a title of 'Study SQL' to be completed as of now
UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL'; -- PASS

-- select all titles and descriptions of tasks that are not yet completed
SELECT title, description
FROM tasks
WHERE completed_at IS NULL; -- PASS

--	select all fields of every task sorted by creation date in descending order
SELECT *
FROM tasks
ORDER BY created_at DESC; -- PASS

-- create a new task
-- title = 'mistake 1'
-- description = 'a test entry'
INSERT INTO basks
VALUES(default, 'mistake 1', 'a test entry', now(), now(), NULL); -- PASS

--	create a new task
-- title = 'mistake 2'
-- description = 'another test entry'
INSERT INTO tasks
VALUES(default, 'mistake 2', 'another test entry', now(), now(), NULL); -- PASS

--	create a new task
-- title = 'third mistake'
-- description = 'another test entry'
INSERT INTO tasks
VALUES(default, 'third mistake', 'another test entry', now(), now(), NULL); -- PASS

-- select title fields of all tasks with a title that includes the word 'mistake'
SELECT title
FROM tasks
WHERE title LIKE '%mistake%'; -- PASS

-- 	delete the task that has a title of mistake 1
DELETE FROM tasks
WHERE title = 'mistake 1'; -- PASS

--	select title and description fields of all tasks with a title that includes the word 'mistake'
SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%'; -- PASS

-- delete all tasks that includes the word `'mistake'` in the title
DELETE FROM tasks
WHERE title LIKE '%mistake%'; -- PASS

-- select all fields of all tasks sorted by `title` in ascending order
SELECT *
FROM tasks
ORDER BY title; -- PASS