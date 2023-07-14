
create database proceduretrigger;

 CREATE TABLE Users (
    ->   user_id INT PRIMARY KEY,
    ->   username VARCHAR(50) NOT NULL,
    ->   password VARCHAR(50) NOT NULL,
    ->   email VARCHAR(50) NOT NULL,
    ->   salary DECIMAL(10, 2)
    -> );

INSERT INTO Users (user_id, username, password, email, salary)
VALUES 
  (1, 'abc123', 'def321', 'abc123@yahoo.com', 30000.00),
  (2, 'xyz789', 'asd123', 'xyz789@gmail.com', 50000.00);

+---------+----------+----------+------------------+----------+
| user_id | username | password | email            | salary   |
+---------+----------+----------+------------------+----------+
|       1 | abc123   | def321   | abc123@yahoo.com | 30000.00 |
|       2 | xyz789   | asd123   | xyz789@gmail.com | 50000.00 |
+---------+----------+----------+------------------+----------+





CREATE TABLE Summary (
    ->   id INT PRIMARY KEY,
    ->   total_users INT NOT NULL,
    ->   Yahoo INT NOT NULL,
    ->   Hotmail INT NOT NULL,
    ->   Gmail INT NOT NULL
    -> );

 SELECT Users.username, Summary.total_users
    -> FROM Users
    -> JOIN Summary ON Users.user_id = Summary.id;


Create a database name person and create the tables above.
===========================================================




===========================================================

1. Write a procedure that take id, total_user, Yahoo, Hotmail, Gmail values as an
input and insert the data into the table summary.
====================================================================================================
query:
delimiter @
MariaDB [proceduretrigger]> CREATE PROCEDURE InsertSummaryData (
    ->   IN summary_id INT,
    ->   IN total_users INT,
    ->   IN yahoo_users INT,
    ->   IN hotmail_users INT,
    ->   IN gmail_users INT
    -> )
    -> BEGIN
    ->   INSERT INTO Summary (id, total_users, Yahoo, Hotmail, Gmail)
    ->   VALUES (summary_id, total_users, yahoo_users, hotmail_users, gmail_users);
    -> END @@

 CALL InsertSummaryData(1, 2, 1, 0, 1);
 ===================================================================================================
 +----+-------------+-------+---------+-------+
| id | total_users | Yahoo | Hotmail | Gmail |
+----+-------------+-------+---------+-------+
|  1 |           2 |     1 |       0 |     1 |
+----+-------------+-------+---------+-------+
   


=====================================================================================================
2. Write a procedure that take user_id, username, password, email values as an input
and insert the data into the table Users.
========================================================================================================


query:
delimiter @
CREATE PROCEDURE InsertUserData (
    ->   IN user_id INT,
    ->   IN username VARCHAR(50),
    ->   IN password VARCHAR(50),
    ->   IN email VARCHAR(50),
    ->   IN salary DECIMAL(10, 2)
    -> )
    -> BEGIN
    ->   INSERT INTO Users (user_id, username, password, email, salary)
    ->   VALUES (user_id, username, password, email, salary);
    -> END @@

CALL InsertUserData(3, 'Abubaker', 'abu123', 'abubaker@gmail.com', 70000.00);
=============================================================================================================
+---------+----------+----------+--------------------+----------+
| user_id | username | password | email              | salary   |
+---------+----------+----------+--------------------+----------+
|       1 | abc123   | def321   | abc123@yahoo.com   | 30000.00 |
|       2 | xyz789   | asd123   | xyz789@gmail.com   | 50000.00 |
|       3 | Abubaker | abu123   | abubaker@gmail.com | 70000.00 |
+---------+----------+----------+--------------------+----------+


==========================================================================================================
3. Write a procedure that output the total number of records/rows in the users table.
========================================================================================================
query:
CREATE PROCEDURE GetTotalUsers ()
BEGIN
  SELECT COUNT(*) AS totalUsers FROM Users;
END $$

CALL GetTotalUsers();
============================================================================================================
+------------+
| totalUsers |
+------------+
|          3 |
+------------+




===========================================================================================================
4. Write a procedure that output the average salary in the users table.
===========================================================================================================
query:

CREATE PROCEDURE GetAverageSalary ()
BEGIN
  SELECT AVG(salary) AS AverageSalary FROM Users;
END $$


CALL GetAverageSalary() $$
=========================================================================================================
+---------------+
| AverageSalary |
+---------------+
|  50000.00     |
+---------------+




============================================================================================================
5. Create a procedure named minmax which displays the lowest and the highest salary of
the users. Run the procedure to display the lowest and the highest salary.
===============================================================================================================
query:
CREATE PROCEDURE minmax()
BEGIN
  SELECT MIN(salary) AS MinimumSalary, MAX(salary) AS MaximumSalary FROM Users;
END $$

CALL minmax() $$
===============================================================================================================
+---------------+---------------+
| MinimumSalary | MaximumSalary |
+---------------+---------------+
|      30000.00 |      70000.00 |
+---------------+---------------+

==================================================================================================================
6. Create trigger(s) to update the records in the summary table. The summary table
will contain only one record and will be updated each time a new entry is made to
the users table, or a user is deleted from the users table. You need to create the
following two triggers.
=====================================================================================================
I. Whenever a new entry is made to the user’s table then total_user attribute in
the summary table must be incremented by 1.
====================================================================================================
query:
CREATE TRIGGER UpdateSummary
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
  UPDATE Summary SET total_users = total_users + 1;
END $$

=====================================================================================================
II. Whenever a record is deleted from the user’s table then total_user attribute
in the summary table must be decremented by 1.
======================================================================================================
query:
CREATE TRIGGER DeleteSummary
AFTER DELETE ON Users
FOR EACH ROW
BEGIN
  UPDATE Summary SET total_users = total_users - 1;
END $$

======================================================================================================
Insert data in the users table (at least 5-10 records) with different email addresses.
Check the summary table each time you add a new user or delete a user to check if the
trigger(s) are working correctly.
=======================================================================================================
query:
INSERT INTO Users (user_id, username, password, email, salary) VALUES
(4, 'Raz', 'raz1', 'Raz@gmail.com', 5000.00),
(5, 'Jalal', 'jalal2', 'Jalal@yahoo.com', 55000.00),
(6, 'Shareef', 'shareed3', 'Shareef@hotmail.com', 80000.00),
(7, 'ahmed', 'ahmed4', 'ahmed@gmail.com', 95000.00)
$$


+---------+----------+----------+---------------------+----------+
| user_id | username | password | email               | salary   |
+---------+----------+----------+---------------------+----------+
|       1 | abc123   | def321   | abc123@yahoo.com    | 30000.00 |
|       2 | xyz789   | asd123   | xyz789@gmail.com    | 50000.00 |
|       3 | Abubaker | abu123   | abubaker@gmail.com  | 70000.00 |
|       4 | Raz      | raz1     | Raz@gmail.com       |  5000.00 |
|       5 | Jalal    | jalal2   | Jalal@yahoo.com     | 55000.00 |
|       6 | Shareef  | shareed3 | Shareef@hotmail.com | 80000.00 |
|       7 | ahmed    | ahmed4   | ahmed@gmail.com     | 95000.00 |
+---------+----------+----------+---------------------+----------+



CREATE TRIGGER update_summary
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    IF NEW.email LIKE '%gmail.com' THEN
        UPDATE Summary SET Gmail = Gmail + 1;
    ELSEIF NEW.email LIKE '%hotmail.com' THEN
        UPDATE Summary SET Hotmail = Hotmail + 1;
    ELSEIF NEW.email LIKE '%yahoo.com' THEN
        UPDATE Summary SET Yahoo = Yahoo + 1;
    END IF;
    
    UPDATE Summary SET total_users = total_users + 1;
END;

+----+-------------+-------+---------+-------+
| id | total_users | Yahoo | Hotmail | Gmail |
+----+-------------+-------+---------+-------+
|  8 |           7 |     2 |       1 |     4 |
+----+-------------+-------+---------+-------+





CREATE TRIGGER delete_user
AFTER DELETE ON Users
FOR EACH ROW
BEGIN
    IF OLD.email LIKE '%gmail.com' THEN
        UPDATE Summary SET Gmail = Gmail - 1;
    ELSEIF OLD.email LIKE '%hotmail.com' THEN
        UPDATE Summary SET Hotmail = Hotmail - 1;
    ELSEIF OLD.email LIKE '%yahoo.com' THEN
        UPDATE Summary SET Yahoo = Yahoo - 1;
    END IF;

    UPDATE Summary SET total_users = total_users - 1;
END;



// AFTER DELETION 

+---------+----------+----------+---------------------+----------+
| user_id | username | password | email               | salary   |
+---------+----------+----------+---------------------+----------+
|       1 | abc123   | def321   | abc123@yahoo.com    | 30000.00 |
|       2 | xyz789   | asd123   | xyz789@gmail.com    | 50000.00 |
|       3 | Abubaker | abu123   | abubaker@gmail.com  | 70000.00 |
|       4 | Raz      | raz1     | Raz@gmail.com       |  5000.00 |
|       5 | Jalal    | jalal2   | Jalal@yahoo.com     | 55000.00 |
|       6 | Shareef  | shareed3 | Shareef@hotmail.com | 80000.00 |
+---------+----------+----------+---------------------+----------+


select * from Summary;
+----+-------------+-------+---------+-------+
| id | total_users | Yahoo | Hotmail | Gmail |
+----+-------------+-------+---------+-------+
|  8 |           6 |     2 |       1 |     3 |
+----+-------------+-------+---------+-------+
============================================================


============================================================




========================================================================================================