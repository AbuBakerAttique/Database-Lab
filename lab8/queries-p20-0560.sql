TASK 1) 
Employee Emma Cauderdale (EMP_NUM =100) has now changed her phone number to
324-9652. Update her information in the EMPFR view. Write a query to show her new phone number
has been updated and then Remove the EMPFR view.
====================================================================================================
     create view EMPFR as
    -> select * from employee;

    update employee
    -> set emp_phone = '324-9652'
    -> where emp_num = 100;

    

select emp_phone from employee;
OUTPUT:

+-----------+
| emp_phone |
+-----------+
| 324-9652  |
| 324-4472  |
| 675-8993  |
| 898-3456  |
| 504-4434  |
| 890-3243  |
| 324-7845  |
+-----------+




=====================================================================================================

TASK 2)
The Theme Park managers want to create a view called EMP_DETAILS which
contains the following information. EMP_NO, PARK_CODE, PARK_NAME,
EMP_LNAME,EMP_FNAME, EMP_HIRE_DATE and EMP_DOB.
======================================================================================================
query :
        CREATE VIEW EMP_DETAILS AS
    -> SELECT e.EMP_NUM, e.PARK_CODE, p.PARK_NAME, e.EMP_LNAME, e.EMP_FNAME, e.EMP_HIRE_DATE, e.EMP_DOB
    -> FROM employee e
    -> JOIN themepark p
    -> ON e.PARK_CODE = p.PARK_CODE;

    describe emp_details;
    +---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| EMP_NUM       | decimal(4,0) | NO   |     | NULL    |       |
| PARK_CODE     | varchar(10)  | YES  |     | NULL    |       |
| PARK_NAME     | varchar(35)  | NO   |     | NULL    |       |
| EMP_LNAME     | varchar(15)  | NO   |     | NULL    |       |
| EMP_FNAME     | varchar(15)  | NO   |     | NULL    |       |
| EMP_HIRE_DATE | date         | YES  |     | NULL    |       |
| EMP_DOB       | date         | NO   |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+

    select * from emp_details;
+---------+-----------+--------------+------------+-----------+---------------+------------+
| EMP_NUM | PARK_CODE | PARK_NAME    | EMP_LNAME  | EMP_FNAME | EMP_HIRE_DATE | EMP_DOB    |
+---------+-----------+--------------+------------+-----------+---------------+------------+
|     100 | FR1001    | FairyLand    | Calderdale | Emma      | 1992-03-15    | 1972-06-15 |
|     101 | UK3452    | PleasureLand | Ricardo    | Marshel   | 1996-04-25    | 1978-03-19 |
|     102 | FR1001    | FairyLand    | Arshad     | Arif      | 1990-12-20    | 1969-11-14 |
|     103 | UK3452    | PleasureLand | Roberts    | Anne      | 1994-08-16    | 1974-10-16 |
|     104 | ZA1342    | GoldTown     | Denver     | Enrica    | 2001-10-20    | 1980-11-08 |
|     105 | FR1001    | FairyLand    | Namowa     | Mirrelle  | 2006-11-08    | 1990-03-14 |
|     106 | ZA1342    | GoldTown     | Smith      | Gemma     | 1989-01-05    | 1968-02-12 |
+---------+-----------+--------------+------------+-----------+---------------+------------+



=================================================================================================
TASK 3) 

E8.3 Using your view EMP_DETAILS, write a query that displays all employee first and last names and
the park names.

=====================================================================================================
query :
        SELECT EMP_FNAME, EMP_LNAME, PARK_NAME
    -> FROM EMP_DETAILS;

OUTPUT:
+-----------+------------+--------------+
| EMP_FNAME | EMP_LNAME  | PARK_NAME    |
+-----------+------------+--------------+
| Emma      | Calderdale | FairyLand    |
| Marshel   | Ricardo    | PleasureLand |
| Arif      | Arshad     | FairyLand    |
| Anne      | Roberts    | PleasureLand |
| Enrica    | Denver     | GoldTown     |
| Mirrelle  | Namowa     | FairyLand    |
| Gemma     | Smith      | GoldTown     |
+-----------+------------+--------------+




=====================================================================================================

Task 4)
Create a view called TICKET_SALES which contains details of the min, max and average sales
at each Theme Park. The name of the theme park should also be displayed.
==========================================================================================================
query:
    create view TICKET_SALES as select
    -> PARK_NAME,max(LINE_PRICE),min(LINE_PRICE),AVG(LINE_PRICE) 
    -> from THEMEPARK as t JOIN SALES as s ON t.PARK_CODE=s.PARK_CODE
    -> JOIN SALES_LINE as sl ON s.TRANSACTION_NO=sl.TRANSACTION_NO 
    -> group by park_name;
    

OUTPUT: 
+--------------+-----------------+-----------------+-----------------+
| PARK_NAME    | max(LINE_PRICE) | min(LINE_PRICE) | AVG(LINE_PRICE) |
+--------------+-----------------+-----------------+-----------------+
| FairyLand    |          139.96 |           14.99 |       50.232500 |
| GoldTown     |          114.68 |           12.12 |       47.637778 |
| PleasureLand |          168.40 |           21.98 |       60.785714 |
+--------------+-----------------+-----------------+-----------------+


===========================================================================================================

TASK 5)
Using the date specifiers in Table 2.2, modify the query shown in Figure 55 to
display the date in the format ’Fri – 18 – 5 – 07’.
===========================================================================================================
query:
        select distinct(DATE_FORMAT(SALE_DATE,'%D %b %Y'))
    -> FROM SALES;


OUTPUT:
+-------------------------------------+
| (DATE_FORMAT(SALE_DATE,'%D %b %Y')) |
+-------------------------------------+
| 18th May 2007                       |
+-------------------------------------+




==========================================================================================================

TASK 6)
Write a query which generates a list of employee user IDs, using the born month, first day of the
month they were born and the first six characters of last name in UPPER case. Your query should
return the results shown in below Figure.

USER ID format (MDName) here M= month, D= first day of month, Name= Employee last name first
6 alphabets.
=====================================================================================================
query
    SELECT EMP_FNAME,EMP_LNAME,CONCAT(DATE_FORMAT(EMP_DOB,'%m'), DATE_FORMAT(EMP_DOB,'%d'),UPPER(LEFT(EMP_LNAME,6))) AS USER_ID 
    ->FROM EMPLOYEE;


OUTPUT
+-----------+------------+------------+
| EMP_FNAME | EMP_LNAME  | USER_ID    |
+-----------+------------+------------+
| Emma      | Calderdale | 0615CALDER |
| Marshel   | Ricardo    | 0319RICARD |
| Arif      | Arshad     | 1114ARSHAD |
| Anne      | Roberts    | 1016ROBERT |
| Enrica    | Denver     | 1108DENVER |
| Mirrelle  | Namowa     | 0314NAMOWA |
| Gemma     | Smith      | 0212SMITH  |
+-----------+------------+------------+



=======================================================================================================


TASK 7)
Write a query which lists the names and dates of births of all employees born on the
14th day of the month.
======================================================================================================
query:
        SELECT EMP_FNAME, EMP_LNAME, EMP_DOB
    -> FROM employee
    -> WHERE dayofmonth(EMP_DOB)= 14;

OUTPUT:
+-----------+-----------+------------+
| EMP_FNAME | EMP_LNAME | EMP_DOB    |
+-----------+-----------+------------+
| Arif      | Arshad    | 1969-11-14 |
| Mirrelle  | Namowa    | 1990-03-14 |
+-----------+-----------+------------+




========================================================================================================
TASK 8)

Write a query which generates a list of employee user passwords, using the first three digits of
their phone number, and the first two characters of first name in lower case. Label the column
USER_PASSWORD.
===========================================================================================
query:
     SELECT CONCAT(LOWER(SUBSTRING(EMP_FNAME, 1, 3)), SUBSTRING(EMP_PHONE, 1, 3)) AS USER_PASSWORDWORD
    -> FROM EMPLOYEE;
+-------------------+
| USER_PASSWORDWORD |
+-------------------+
| emm324            |
| mar324            |
| ari675            |
| ann898            |
| enr504            |
| mir890            |
| gem324            |
+-------------------+



==================================================================================================

TASK 9) 

Create a View that list the first name, last name of all employees who earn more than the
average hourly rate
=====================================================================================================
query:
        CREATE VIEW SALARY AS
    -> SELECT EMP_FNAME, EMP_LNAME
    -> FROM employee e
    -> JOIN hours h ON e.EMP_NUM = h.EMP_NUM
    -> WHERE h.HOUR_RATE > (SELECT AVG(HOUR_RATE) FROM hours);

    select * SALARY;

OUTPUT:
+-----------+-----------+
| EMP_FNAME | EMP_LNAME |
+-----------+-----------+
| Enrica    | Denver    |
| Enrica    | Denver    |
| Mirrelle  | Namowa    |
| Mirrelle  | Namowa    |
| Mirrelle  | Namowa    |
+-----------+-----------+



=====================================================================================================

TASK 10)

Create a View that list the attract capacity, with a attract capacity less than or equal
to the average attract capacity.
=============================================================================================
query select * from attraction
    -> where ATTRACT_CAPACITY <= (SELECT AVG(ATTRACT_CAPACITY) FROM ATTRACTION);

OUTPUT:

+------------+-----------------+-------------+------------------+-----------+
| ATTRACT_NO | ATTRACT_NAME    | ATTRACT_AGE | ATTRACT_CAPACITY | PARK_CODE |
+------------+-----------------+-------------+------------------+-----------+
|      10034 | ThunderCoaster  |          11 |               34 | FR1001    |
|      10056 | SpinningTeacups |           4 |               62 | FR1001    |
|      10067 | FlightToStars   |          11 |               24 | FR1001    |
|      10078 | Ant-Trap        |          23 |               30 | FR1001    |
|      10082 | NULL            |          10 |               40 | ZA1342    |
|      30011 | BlackHole2      |          12 |               34 | UK3452    |
|      30012 | Pirates         |          10 |               42 | UK3452    |
+------------+-----------------+-------------+------------------+-----------+



===================================================================================================

TASK 11)

Create a View to list the ticket_numbers and corresponding park_codes of the
tickets that are priced higher than the highest-priced ‘Child’ ticket.
==================================================================================================
query:
      CREATE VIEW INFO AS
    -> SELECT TICKET_NO, PARK_CODE
    -> FROM ticket t
    -> WHERE t.TICKET_PRICE > (SELECT MAX(t2.TICKET_PRICE) FROM ticket t2 WHERE t2.TICKET_TYPE = 'Child');

    select * from INFO;

OUTPUT:
+-----------+-----------+
| TICKET_NO | PARK_CODE |
+-----------+-----------+
|     11001 | SP4533    |
|     13002 | FR1001    |
|     67833 | ZA1342    |
|     88568 | UK3452    |
+-----------+-----------+



==================================================================================================
TASK 12)

Create a View to show the attraction number and the minimum and maximum hourly rate for
each attraction.

query:
SELECT ATTRACTION.ATTRACT_NO, MIN(HOUR_RATE), MAX(HOUR_RATE)
    ->      FROM ATTRACTION , HOURS
    ->      GROUP BY ATTRACTION.ATTRACT_NO;

OUTPUT:
+------------+----------------+----------------+
| ATTRACT_NO | MIN(HOUR_RATE) | MAX(HOUR_RATE) |
+------------+----------------+----------------+
|      10034 |           5.99 |           8.50 |
|      10056 |           5.99 |           8.50 |
|      10067 |           5.99 |           8.50 |
|      10078 |           5.99 |           8.50 |
|      10082 |           5.99 |           8.50 |
|      10098 |           5.99 |           8.50 |
|      20056 |           5.99 |           8.50 |
|      30011 |           5.99 |           8.50 |
|      30012 |           5.99 |           8.50 |
|      30044 |           5.99 |           8.50 |
|      98764 |           5.99 |           8.50 |
+------------+----------------+----------------+







==================================================================================================
TASK 13)

Create a View that displays the employees first and last name (EMP_FNAME
and EMP_LNAME), the attraction number(ATTRACT_NO) and the date worked.
Hint: (You will have to join the HOURS and the EMPLOYEE tables.
===============================================================================================
query:
        CREATE VIEW EMP_ATTRACT_WORKED AS
    -> SELECT e.EMP_FNAME, e.EMP_LNAME, a.ATTRACT_NO, h.DATE_WORKED
    -> FROM employee e
    -> JOIN hours h ON e.EMP_NUM = h.EMP_NUM
    -> JOIN attraction a ON h.ATTRACT_NO = a.ATTRACT_NO;

    select * from EMP_ATTRACT_WORKED;


OUTPUT

+-----------+------------+------------+-------------+
| EMP_FNAME | EMP_LNAME  | ATTRACT_NO | DATE_WORKED |
+-----------+------------+------------+-------------+
| Emma      | Calderdale |      10034 | 2007-05-18  |
| Emma      | Calderdale |      10034 | 2007-05-20  |
| Marshel   | Ricardo    |      10034 | 2007-05-18  |
| Arif      | Arshad     |      30012 | 2007-05-23  |
| Arif      | Arshad     |      30044 | 2007-05-21  |
| Arif      | Arshad     |      30044 | 2007-05-22  |
| Enrica    | Denver     |      30011 | 2007-05-21  |
| Enrica    | Denver     |      30012 | 2007-05-22  |
| Mirrelle  | Namowa     |      10078 | 2007-05-18  |
| Mirrelle  | Namowa     |      10098 | 2007-05-18  |
| Mirrelle  | Namowa     |      10098 | 2007-05-19  |
+-----------+------------+------------+-------------+


=================================================================================================