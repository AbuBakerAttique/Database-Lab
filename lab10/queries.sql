1. Create a user, user name should be your name.
------------------------------------------------------------------
 create user 'AbubakerAttique'@'localhost' identified by '123456'
    -> ;
Query OK, 0 rows affected (0.390 sec)



-------------------------------------------------------------------
2. Grants privileges to the user you created
    ● To access EMPLOYEE table (SELECT,UPDATE) from database themepark
    ● To access the views (SELECT) you have created in themepark (at least 1 view).
    ● To access full database of fb/company (which you have used in last lab)
    ● To create a database
----------------------------------------------------------------------------
 GRANT SELECT, UPDATE ON lab2.EMPLOYEE TO 'AbubakerAttique'@'localhost';
 -----------------------------------------------------------------------------
 GRANT SELECT ON themepark.* TO 'AbubakerAttique'@'localhost';
Query OK, 0 rows affected (0.039 sec)
-----------------------------------------------------------------------------
GRANT ALL PRIVILEGES ON hr.* TO 'AbubakerAttique'@'localhost'
    -> ;
Query OK, 0 rows affected (0.384 sec)
----------------------------------------------------------------------------------
 Grant create on *.* to 'AbubakerAttique'@'localhost';

---------------------------------------------------------------------------------------------------
3. Revoke the right to access the view you granted in exercise 2.
---------------------------------------------------------------------------------------------------

 REVOKE SELECT ON lab2.EMPLOYEE FROM 'AbubakerAttique'@'localhost';
Query OK, 0 rows affected (0.373 sec)
-------------------------------------------------------------------

FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.295 sec)


---------------------------------------------------------------------------------------------------------
4. Give a demonstration of commit, rollback and savepoint commands.
                ● You can use any already define database for the demonstration of TCL
                commands.
                ● Disable the autocommit option as shown in lab manual.
                ● Insert some data in any table, update some data in any table
                ● Now apply rollback and see the result
                ● Do some more transactions of insert, update and delete. Afterwards add a
                savepoint
                ● Insert 2 to 3 rows and then go back to previous savepoint and see the results.

----------------------------------------------------------------------------------------------------------------
Commit;
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> SET AUTOCOMMIT = 0;
Query OK, 0 rows affected (0.000 sec)

Insert
--------------------------------
insert into THEMEPARK VALUES('opo23','FairyLand','KARACHI','FR');
Query OK, 1 row affected (0.032 sec)
---------------------------------------


savepoint s1;
Query OK, 0 rows affected (0.000 sec)

rollback to s1;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| FR1001    | FairyLand     | PARIS        | FR           |
| NL1202    | Efling        | NOORD        | NL           |
| opo23     | FairyLand     | KARACHI      | FR           |
| pk0000    | khan          | lahore       | pk           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
9 rows in set (0.000 sec)


 ROLLBACK;
Query OK, 0 rows affected (0.000 sec)
--------------------------------------
 select * from THEMEPARK;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| FR1001    | FairyLand     | PARIS        | FR           |
| NL1202    | Efling        | NOORD        | NL           |
| pk0000    | khan          | lahore       | pk           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
8 rows in set (0.001 sec)