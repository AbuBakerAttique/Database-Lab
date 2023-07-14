///////////////////////// EXCERCISE 5 //////////////////////////////////////////

____________________________________________________________________________________________________
E4.1 : Write a query that displays the average hourly rate that has been paid to all employees.
Your query should return €7.03.
======================================================
ANSWER :   select avg(HOUR_RATE) from hours;
======================================================




___________________________________________________________________________________________________
E4.2 : Write a query that displays the average attraction age for all attractions where the
PARK_CODE is equal to ‘UK3452’. Your query should return 7.25 years.
===============================================
ANSWER :  select avg(ATTRACT_AGE) from attraction where park_code = "UK3452";
===============================================




_____________________________________________________________________________________________________
E4.3 : Display the employee numbers of all employees and the total number of hours they
have worked. Output format
========================================================
ANSWER : select emp_num, sum(hours_per_attract) from hours group by emp_num;
========================================================





_____________________________________________________________________________________________________
E4.4  : Show the attraction number and the minimum and maximum hourly rate for each attraction.
=====================================================
ANSWER : select attract_no,min(HOUR_RATE),max(HOUR_RATE) from hours group by attract_no;
=====================================================





_________________________________________________________________________________________________
E4.5 :  Using the HOURS table, write a query to display the employee number (EMP_NUM), the
attraction number (ATTRACT-NO) and the average hours worked per attraction
(HOURS_PER_ATTRACT) limiting the result to where the average hours worked per attraction
is greater or equal to 5. Check your results against those shown in below Figure.
=========================================
ANSWER : select emp_num,attract_no,avg(hours_per_attract) from hours group by emp_num;
========================================






____________________________________________________________________________________________________
E4.6 : Write a CROSS JOIN query which selects all rows from the EMPLOYEE and
HOURS tables. How many rows were returned?
====================================================
ANSWER : SELECT * FROM employee CROSS JOIN hours;
=====================================================





_____________________________________________________________________________________________________
E4.7 : Write a query that displays the employees first and last name (EMP_FNAME
and EMP_LNAME), the attraction number(ATTRACT_NO) and the date worked.
==========================================
ANSWER : select EMP_LNAME,EMP_FNAME,ATTRACT_NO,DATE_WORKED from employee natural join hours;
============================================






_____________________________________________________________________________________________________
E4.8 : Rewrite the query you wrote in E 4.7 so that the attraction name
(ATTRACT_NAME located in the ATTRACTION table) is also displayed.
========================================
ANSWER : select EMP_FNAME,EMP_LNAME,ATTRACT_NO,ATTRACT_NAME FROM employee natural join hours natural join attraction;
========================================





____________________________________________________________________________________________________
E4.9 : Display the park names and total sales for Theme Parks who are located in the
country ‘UK’ or ‘FR’.
=======================================
ANSWER : select park_name,sum(line_price) from themepark natral join sales_line where park_country = "UK" AND park_country = "FR";
========================================






_____________________________________________________________________________________________________
E4.10 : List the sale date, line quantity and line price of all transactions on the 18th May
2007.
==================================
ANSWER : SELECT SALE_DATE,LINE_QTY,LINE_PRICE FROM SALES JOIN SALES_LINE USING (TRANSACTION_NO) where SALE_DATE = "2007-05-18";
=================================

____________________________________________________________________________________________________