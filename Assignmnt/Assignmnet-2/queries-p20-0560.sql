1. Display the name of the employee who earns highest salary.
==========================================================================
query : select first_name,last_name,salary
    -> FROM employees
    -> WHERE salary = (SELECT MAX(salary) FROM employees)
    -> ;

output : 
+------------+-----------+----------+
| first_name | last_name | salary   |
+------------+-----------+----------+
| Steven     | King      | 24000.00 |
+------------+-----------+----------+

==========================================================================
2. Display the employee(s) earning the second highest salary.
==========================================================================
query : select first_name,last_name,salary
    -> FROM employees
    -> WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));

output : 
+------------+-----------+----------+
| first_name | last_name | salary   |
+------------+-----------+----------+
| Neena      | Kochhar   | 17000.00 |
| Lex        | De Haan   | 17000.00 |
+------------+-----------+----------+

==========================================================================

3. Display the employee(s) earning the third highest salary.
==========================================================================
query : select first_name,last_name,salary
    -> FROM employees
    -> WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary <(SELECT MAX(salary) FROM employees WHERE salary <(SELECT MAX(salary) FROM employees)));

output : 
+------------+-----------+----------+
| first_name | last_name | salary   |
+------------+-----------+----------+
| John       | Russell   | 14000.00 |
+------------+-----------+----------+

==========================================================================
4. Display the employee number and name for employee working as clerk and earning highest
salary among clerks.
==========================================================================
query : select first_name,employee_id,max(salary)
    -> from employees
    -> where job_id='PU_CLERK';

output : 
+------------+-------------+-------------+
| first_name | employee_id | max(salary) |
+------------+-------------+-------------+
| Alexander  |         115 |     3100.00 |
+------------+-------------+-------------+

==========================================================================



5. Display the names of accountant who earns a salary more than the highest salary of any clerk.
==========================================================================
query : select first_name,last_name
    -> from employees
    -> where job_id='FI_ACCOUNT' AND salary>(select max(salary) from employees where job_id='PU_CLERK');

output : 
+-------------+-----------+
| first_name  | last_name |
+-------------+-----------+
| Daniel      | Faviet    |
| John        | Chen      |
| Ismael      | Sciarra   |
| Jose Manuel | Urman     |
| Luis        | Popp      |
+-------------+-----------+


==========================================================================



6. Display the names of clerks who earn a salary more than the lowest salary of any programmer.
==========================================================================
query : select first_name,last_name
    -> from employees
    ->  where job_id='PU_CLERK' AND salary>(select min(salary) from employees where job_id='IT_PROG');

output : 
    NO RESULT

==========================================================================




7. Display the names of employees who earn a salary more than that of Peter or that of salary
greater than that of Lisa.
==========================================================================
query : select first_name, last_name
    ->      from employees
    ->      where salary>(select max(salary) from employees
    ->      where first_name='Peter'    OR     first_name='Lisa');

output : 
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Steven     | King      |
| Neena      | Kochhar   |
| Lex        | De Haan   |
| Nancy      | Greenberg |
| John       | Russell   |
| Karen      | Partners  |
| Alberto    | Errazuriz |
| Michael    | Hartstein |
| Shelley    | Higgins   |
+------------+-----------+

==========================================================================




8. Issue a query to list all the employees who salary is > the average salary of their own dept.
==========================================================================
query : select first_name,last_name
    ->      from employees e1
    ->      where e1.salary>(select avg(salary)
    ->     from employees e2
    ->      where e1.department_id=e2.department_id);

output : 
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Steven     | King      |
| Alexander  | Hunold    |
| Bruce      | Ernst     |
| Nancy      | Greenberg |
| Daniel     | Faviet    |
| Den        | Raphaely  |
| Matthew    | Weiss     |
| Adam       | Fripp     |
| Payam      | Kaufling  |
| Shanta     | Vollman   |
| Kevin      | Mourgos   |
| Renske     | Ladwig    |
| Trenna     | Rajs      |
| John       | Russell   |
| Karen      | Partners  |
| Alberto    | Errazuriz |
| Gerald     | Cambrault |
| Eleni      | Zlotkey   |
| Peter      | Tucker    |
| David      | Bernstein |
| Peter      | Hall      |
| Janette    | King      |
| Patrick    | Sully     |
| Allan      | McEwen    |
| Clara      | Vishney   |
| Danielle   | Greene    |
| Lisa       | Ozer      |
| Harrison   | Bloom     |
| Tayler     | Fox       |
| Ellen      | Abel      |
| Nandita    | Sarchand  |
| Alexis     | Bull      |
| Kelly      | Chung     |
| Jennifer   | Dilly     |
| Sarah      | Bell      |
| Britney    | Everett   |
| Michael    | Hartstein |
| Shelley    | Higgins   |
+------------+-----------+

==========================================================================


9. Display the names of the employees who earn highest salary in their respective departments.
==========================================================================
query :  select first_name,last_name
    ->           from employees e1
    ->           where e1.salary=(select max(salary)
    ->           from employees e2
    ->           where e1.department_id=e2.department_id);

output : 
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Steven     | King      |
| Alexander  | Hunold    |
| Nancy      | Greenberg |
| Den        | Raphaely  |
| Adam       | Fripp     |
| John       | Russell   |
| Jennifer   | Whalen    |
| Michael    | Hartstein |
| Susan      | Mavris    |
| Hermann    | Baer      |
| Shelley    | Higgins   |
+------------+-----------+

==========================================================================


10. Write a query to display the name and job title of all employees working in dept 20.
==========================================================================
query : select first_name,last_name,job_id
    -> from employees
    -> where department_id='20';

output : 
+------------+-----------+--------+
| first_name | last_name | job_id |
+------------+-----------+--------+
| Michael    | Hartstein | MK_MAN |
| Pat        | Fay       | MK_REP |
+------------+-----------+--------+

==========================================================================





11. Display the names of the employees who earn highest salaries in their respective job groups.
==========================================================================
query : select first_name,last_name
    -> from employees e1
    -> where salary= (select max(salary) from employees e2
    -> where e1.job_id=e2.job_id);

output : 
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Steven     | King      |
| Neena      | Kochhar   |
| Lex        | De Haan   |
| Alexander  | Hunold    |
| Nancy      | Greenberg |
| Daniel     | Faviet    |
| Den        | Raphaely  |
| Alexander  | Khoo      |
| Adam       | Fripp     |
| Renske     | Ladwig    |
| John       | Russell   |
| Lisa       | Ozer      |
| Nandita    | Sarchand  |
| Jennifer   | Whalen    |
| Michael    | Hartstein |
| Pat        | Fay       |
| Susan      | Mavris    |
| Hermann    | Baer      |
| Shelley    | Higgins   |
| William    | Gietz     |
+------------+-----------+

==========================================================================





12. Write a query to list the employees in dept 20 with the same job as anyone in dept 50.
==========================================================================
query : select first_name,last_name
    -> from employees
    -> where department_id=20 AND  job_id=ALL(select job_id from employees
    -> where department_id=50);

output : 
NO RESULT OR NULL

==========================================================================






13. Display the employee names who are working in Finance department.
==========================================================================
query :  select first_name,last_name
    -> from employees
    -> where department_id=(select department_id from departments
    -> where department_name='Finance');

output : 
+-------------+-----------+
| first_name  | last_name |
+-------------+-----------+
| Nancy       | Greenberg |
| Daniel      | Faviet    |
| John        | Chen      |
| Ismael      | Sciarra   |
| Jose Manuel | Urman     |
| Luis        | Popp      |
+-------------+-----------+

==========================================================================






14. Display the employee names who are working in Toronto.
==========================================================================
query : select first_name,last_name
    -> from employees
    -> where department_id=(select department_id from departments
    -> where location_id =(select location_id from locations
    -> where city='Toronto'))
    -> ;

output : 
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Michael    | Hartstein |
| Pat        | Fay       |
+------------+-----------+

==========================================================================





15. Write a query that would display the employee name, job where each employee works and the
name of their dept.
==========================================================================
query : select first_name, last_name, job_title, department_name 
->from employees, departments, jobs 
->where employees.department_id=departments.department_id AND employees.job_id=jobs.job_id;

output : 
+-------------+-------------+---------------------------------+------------------+
| first_name  | last_name   | job_title                       | department_name  |
+-------------+-------------+---------------------------------+------------------+
| William     | Gietz       | Public Accountant               | Accounting       |
| Shelley     | Higgins     | Accounting Manager              | Accounting       |
| Jennifer    | Whalen      | Administration Assistant        | Administration   |
| Steven      | King        | President                       | Executive        |
| Neena       | Kochhar     | Administration Vice President   | Executive        |
| Lex         | De Haan     | Administration Vice President   | Executive        |
| Daniel      | Faviet      | Accountant                      | Finance          |
| John        | Chen        | Accountant                      | Finance          |
| Ismael      | Sciarra     | Accountant                      | Finance          |
| Jose Manuel | Urman       | Accountant                      | Finance          |
| Luis        | Popp        | Accountant                      | Finance          |
| Nancy       | Greenberg   | Finance Manager                 | Finance          |
| Susan       | Mavris      | Human Resources Representative  | Human Resources  |
| Alexander   | Hunold      | Programmer                      | IT               |
| Bruce       | Ernst       | Programmer                      | IT               |
| David       | Austin      | Programmer                      | IT               |
| Valli       | Pataballa   | Programmer                      | IT               |
| Diana       | Lorentz     | Programmer                      | IT               |
| Shanta      | Vollman     | Marketing Manager               | Shipping         |
| Michael     | Hartstein   | Marketing Manager               | Marketing        |
| Pat         | Fay         | Marketing Representative        | Marketing        |
| Hermann     | Baer        | Public Relations Representative | Public Relations |
| Alexander   | Khoo        | Purchasing Clerk                | Purchasing       |
| Shelli      | Baida       | Purchasing Clerk                | Purchasing       |
| Sigal       | Tobias      | Purchasing Clerk                | Purchasing       |
| Guy         | Himuro      | Purchasing Clerk                | Purchasing       |
| Karen       | Colmenares  | Purchasing Clerk                | Purchasing       |
| Den         | Raphaely    | Purchasing Manager              | Purchasing       |
| John        | Russell     | Sales Manager                   | Sales            |
| Karen       | Partners    | Sales Manager                   | Sales            |
| Alberto     | Errazuriz   | Sales Manager                   | Sales            |
| Gerald      | Cambrault   | Sales Manager                   | Sales            |
| Eleni       | Zlotkey     | Sales Manager                   | Sales            |
| Peter       | Tucker      | Sales Representative            | Sales            |
| David       | Bernstein   | Sales Representative            | Sales            |
| Peter       | Hall        | Sales Representative            | Sales            |
| Christopher | Olsen       | Sales Representative            | Sales            |
| Nanette     | Cambrault   | Sales Representative            | Sales            |
| Oliver      | Tuvault     | Sales Representative            | Sales            |
| Janette     | King        | Sales Representative            | Sales            |
| Patrick     | Sully       | Sales Representative            | Sales            |
| Allan       | McEwen      | Sales Representative            | Sales            |
| Lindsey     | Smith       | Sales Representative            | Sales            |
| Louise      | Doran       | Sales Representative            | Sales            |
| Sarath      | Sewall      | Sales Representative            | Sales            |
| Clara       | Vishney     | Sales Representative            | Sales            |
| Danielle    | Greene      | Sales Representative            | Sales            |
| Mattea      | Marvins     | Sales Representative            | Sales            |
| David       | Lee         | Sales Representative            | Sales            |
| Sundar      | Ande        | Sales Representative            | Sales            |
| Amit        | Banda       | Sales Representative            | Sales            |
| Lisa        | Ozer        | Sales Representative            | Sales            |
| Harrison    | Bloom       | Sales Representative            | Sales            |
| Tayler      | Fox         | Sales Representative            | Sales            |
| William     | Smith       | Sales Representative            | Sales            |
| Elizabeth   | Bates       | Sales Representative            | Sales            |
| Sundita     | Kumar       | Sales Representative            | Sales            |
| Ellen       | Abel        | Sales Representative            | Sales            |
| Alyssa      | Hutton      | Sales Representative            | Sales            |
| Jonathon    | Taylor      | Sales Representative            | Sales            |
| Jack        | Livingston  | Sales Representative            | Sales            |
| Charles     | Johnson     | Sales Representative            | Sales            |
| Winston     | Taylor      | Shipping Clerk                  | Shipping         |
| Jean        | Fleaur      | Shipping Clerk                  | Shipping         |
| Martha      | Sullivan    | Shipping Clerk                  | Shipping         |
| Girard      | Geoni       | Shipping Clerk                  | Shipping         |
| Nandita     | Sarchand    | Shipping Clerk                  | Shipping         |
| Alexis      | Bull        | Shipping Clerk                  | Shipping         |
| Julia       | Dellinger   | Shipping Clerk                  | Shipping         |
| Anthony     | Cabrio      | Shipping Clerk                  | Shipping         |
| Kelly       | Chung       | Shipping Clerk                  | Shipping         |
| Jennifer    | Dilly       | Shipping Clerk                  | Shipping         |
| Timothy     | Gates       | Shipping Clerk                  | Shipping         |
| Randall     | Perkins     | Shipping Clerk                  | Shipping         |
| Sarah       | Bell        | Shipping Clerk                  | Shipping         |
| Britney     | Everett     | Shipping Clerk                  | Shipping         |
| Samuel      | McCain      | Shipping Clerk                  | Shipping         |
| Vance       | Jones       | Shipping Clerk                  | Shipping         |
| Alana       | Walsh       | Shipping Clerk                  | Shipping         |
| Kevin       | Feeney      | Shipping Clerk                  | Shipping         |
| Donald      | OConnell    | Shipping Clerk                  | Shipping         |
| Douglas     | Grant       | Shipping Clerk                  | Shipping         |
| Julia       | Nayer       | Stock Clerk                     | Shipping         |
| Irene       | Mikkilineni | Stock Clerk                     | Shipping         |
| James       | Landry      | Stock Clerk                     | Shipping         |
| Steven      | Markle      | Stock Clerk                     | Shipping         |
| Laura       | Bissot      | Stock Clerk                     | Shipping         |
| Mozhe       | Atkinson    | Stock Clerk                     | Shipping         |
| James       | Marlow      | Stock Clerk                     | Shipping         |
| TJ          | Olson       | Stock Clerk                     | Shipping         |
| Jason       | Mallin      | Stock Clerk                     | Shipping         |
| Michael     | Rogers      | Stock Clerk                     | Shipping         |
| Ki          | Gee         | Stock Clerk                     | Shipping         |
| Hazel       | Philtanker  | Stock Clerk                     | Shipping         |
| Renske      | Ladwig      | Stock Clerk                     | Shipping         |
| Stephen     | Stiles      | Stock Clerk                     | Shipping         |
| John        | Seo         | Stock Clerk                     | Shipping         |
| Joshua      | Patel       | Stock Clerk                     | Shipping         |
| Trenna      | Rajs        | Stock Clerk                     | Shipping         |
| Curtis      | Davies      | Stock Clerk                     | Shipping         |
| Randall     | Matos       | Stock Clerk                     | Shipping         |
| Peter       | Vargas      | Stock Clerk                     | Shipping         |
| Matthew     | Weiss       | Stock Manager                   | Shipping         |
| Adam        | Fripp       | Stock Manager                   | Shipping         |
| Payam       | Kaufling    | Stock Manager                   | Shipping         |
| Kevin       | Mourgos     | Stock Manager                   | Shipping         |
+-------------+-------------+---------------------------------+------------------+
==========================================================================




16. Display department names and employee count for those departments having no more than 2
employees.
==========================================================================
query : select COUNT(employee_id), department_name
->from employees, departments 
->where employees.department_id=departments.department_id group by department_name having COUNT(employee_id)<3;

output : 
+--------------------+------------------+
| COUNT(employee_id) | department_name  |
+--------------------+------------------+
|                  2 | Accounting       |
|                  1 | Administration   |
|                  1 | Human Resources  |
|                  2 | Marketing        |
|                  1 | Public Relations |
+--------------------+------------------+

==========================================================================





17. Display the first name, last name, department number, and department name for each employee
order by employee last name.
==========================================================================
query : select first_name, last_name, employees.department_id, department_name
    -> from employees, departments
    -> where employees.department_id=departments.department_id
    -> order by last_name;

output : 
+-------------+-------------+---------------+------------------+
| first_name  | last_name   | department_id | department_name  |
+-------------+-------------+---------------+------------------+
| Ellen       | Abel        |            80 | Sales            |
| Sundar      | Ande        |            80 | Sales            |
| Mozhe       | Atkinson    |            50 | Shipping         |
| David       | Austin      |            60 | IT               |
| Hermann     | Baer        |            70 | Public Relations |
| Shelli      | Baida       |            30 | Purchasing       |
| Amit        | Banda       |            80 | Sales            |
| Elizabeth   | Bates       |            80 | Sales            |
| Sarah       | Bell        |            50 | Shipping         |
| David       | Bernstein   |            80 | Sales            |
| Laura       | Bissot      |            50 | Shipping         |
| Harrison    | Bloom       |            80 | Sales            |
| Alexis      | Bull        |            50 | Shipping         |
| Anthony     | Cabrio      |            50 | Shipping         |
| Gerald      | Cambrault   |            80 | Sales            |
| Nanette     | Cambrault   |            80 | Sales            |
| John        | Chen        |           100 | Finance          |
| Kelly       | Chung       |            50 | Shipping         |
| Karen       | Colmenares  |            30 | Purchasing       |
| Curtis      | Davies      |            50 | Shipping         |
| Lex         | De Haan     |            90 | Executive        |
| Julia       | Dellinger   |            50 | Shipping         |
| Jennifer    | Dilly       |            50 | Shipping         |
| Louise      | Doran       |            80 | Sales            |
| Bruce       | Ernst       |            60 | IT               |
| Alberto     | Errazuriz   |            80 | Sales            |
| Britney     | Everett     |            50 | Shipping         |
| Daniel      | Faviet      |           100 | Finance          |
| Pat         | Fay         |            20 | Marketing        |
| Kevin       | Feeney      |            50 | Shipping         |
| Jean        | Fleaur      |            50 | Shipping         |
| Tayler      | Fox         |            80 | Sales            |
| Adam        | Fripp       |            50 | Shipping         |
| Timothy     | Gates       |            50 | Shipping         |
| Ki          | Gee         |            50 | Shipping         |
| Girard      | Geoni       |            50 | Shipping         |
| William     | Gietz       |           110 | Accounting       |
| Douglas     | Grant       |            50 | Shipping         |
| Nancy       | Greenberg   |           100 | Finance          |
| Danielle    | Greene      |            80 | Sales            |
| Peter       | Hall        |            80 | Sales            |
| Michael     | Hartstein   |            20 | Marketing        |
| Shelley     | Higgins     |           110 | Accounting       |
| Guy         | Himuro      |            30 | Purchasing       |
| Alexander   | Hunold      |            60 | IT               |
| Alyssa      | Hutton      |            80 | Sales            |
| Charles     | Johnson     |            80 | Sales            |
| Vance       | Jones       |            50 | Shipping         |
| Payam       | Kaufling    |            50 | Shipping         |
| Alexander   | Khoo        |            30 | Purchasing       |
| Janette     | King        |            80 | Sales            |
| Steven      | King        |            90 | Executive        |
| Neena       | Kochhar     |            90 | Executive        |
| Sundita     | Kumar       |            80 | Sales            |
| Renske      | Ladwig      |            50 | Shipping         |
| James       | Landry      |            50 | Shipping         |
| David       | Lee         |            80 | Sales            |
| Jack        | Livingston  |            80 | Sales            |
| Diana       | Lorentz     |            60 | IT               |
| Jason       | Mallin      |            50 | Shipping         |
| Steven      | Markle      |            50 | Shipping         |
| James       | Marlow      |            50 | Shipping         |
| Mattea      | Marvins     |            80 | Sales            |
| Randall     | Matos       |            50 | Shipping         |
| Susan       | Mavris      |            40 | Human Resources  |
| Samuel      | McCain      |            50 | Shipping         |
| Allan       | McEwen      |            80 | Sales            |
| Irene       | Mikkilineni |            50 | Shipping         |
| Kevin       | Mourgos     |            50 | Shipping         |
| Julia       | Nayer       |            50 | Shipping         |
| Donald      | OConnell    |            50 | Shipping         |
| Christopher | Olsen       |            80 | Sales            |
| TJ          | Olson       |            50 | Shipping         |
| Lisa        | Ozer        |            80 | Sales            |
| Karen       | Partners    |            80 | Sales            |
| Valli       | Pataballa   |            60 | IT               |
| Joshua      | Patel       |            50 | Shipping         |
| Randall     | Perkins     |            50 | Shipping         |
| Hazel       | Philtanker  |            50 | Shipping         |
| Luis        | Popp        |           100 | Finance          |
| Trenna      | Rajs        |            50 | Shipping         |
| Den         | Raphaely    |            30 | Purchasing       |
| Michael     | Rogers      |            50 | Shipping         |
| John        | Russell     |            80 | Sales            |
| Nandita     | Sarchand    |            50 | Shipping         |
| Ismael      | Sciarra     |           100 | Finance          |
| John        | Seo         |            50 | Shipping         |
| Sarath      | Sewall      |            80 | Sales            |
| William     | Smith       |            80 | Sales            |
| Lindsey     | Smith       |            80 | Sales            |
| Stephen     | Stiles      |            50 | Shipping         |
| Martha      | Sullivan    |            50 | Shipping         |
| Patrick     | Sully       |            80 | Sales            |
| Jonathon    | Taylor      |            80 | Sales            |
| Winston     | Taylor      |            50 | Shipping         |
| Sigal       | Tobias      |            30 | Purchasing       |
| Peter       | Tucker      |            80 | Sales            |
| Oliver      | Tuvault     |            80 | Sales            |
| Jose Manuel | Urman       |           100 | Finance          |
| Peter       | Vargas      |            50 | Shipping         |
| Clara       | Vishney     |            80 | Sales            |
| Shanta      | Vollman     |            50 | Shipping         |
| Alana       | Walsh       |            50 | Shipping         |
| Matthew     | Weiss       |            50 | Shipping         |
| Jennifer    | Whalen      |            10 | Administration   |
| Eleni       | Zlotkey     |            80 | Sales            |
+-------------+-------------+---------------+------------------+

==========================================================================





18. Display for all employees, their name, their job title, their department name, the city they are
located in, the country name and the region.
==========================================================================
query : select first_name, last_name, job_title, department_name, city, country_name, region_name 
->from employees, departments, jobs, locations, countries, regions
-> where employees.department_id=departments.department_id AND employees.job_id=jobs.job_id AND departments.location_id=locations.location_id AND locations.country_id=countries.country_id AND countries.region_id=regions.region_id;

output : 
+-------------+-------------+---------------------------------+------------------+---------------------+--------------------------+-------------+
| first_name  | last_name   | job_title                       | department_name  | city                | country_name             | region_name |
+-------------+-------------+---------------------------------+------------------+---------------------+--------------------------+-------------+
| Hermann     | Baer        | Public Relations Representative | Public Relations | Munich              | Germany                  | Europe      |
| Susan       | Mavris      | Human Resources Representative  | Human Resources  | London              | United Kingdom           | Europe      |
| John        | Russell     | Sales Manager                   | Sales            | Oxford              | United Kingdom           | Europe      |
| Karen       | Partners    | Sales Manager                   | Sales            | Oxford              | United Kingdom           | Europe      |
| Alberto     | Errazuriz   | Sales Manager                   | Sales            | Oxford              | United Kingdom           | Europe      |
| Gerald      | Cambrault   | Sales Manager                   | Sales            | Oxford              | United Kingdom           | Europe      |
| Eleni       | Zlotkey     | Sales Manager                   | Sales            | Oxford              | United Kingdom           | Europe      |
| Peter       | Tucker      | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| David       | Bernstein   | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Peter       | Hall        | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Christopher | Olsen       | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Nanette     | Cambrault   | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Oliver      | Tuvault     | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Janette     | King        | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Patrick     | Sully       | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Allan       | McEwen      | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Lindsey     | Smith       | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Louise      | Doran       | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Sarath      | Sewall      | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Clara       | Vishney     | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Danielle    | Greene      | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Mattea      | Marvins     | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| David       | Lee         | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Sundar      | Ande        | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Amit        | Banda       | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Lisa        | Ozer        | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Harrison    | Bloom       | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Tayler      | Fox         | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| William     | Smith       | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Elizabeth   | Bates       | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Sundita     | Kumar       | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Ellen       | Abel        | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Alyssa      | Hutton      | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Jonathon    | Taylor      | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Jack        | Livingston  | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Charles     | Johnson     | Sales Representative            | Sales            | Oxford              | United Kingdom           | Europe      |
| Michael     | Hartstein   | Marketing Manager               | Marketing        | Toronto             | Canada                   | Americas    |
| Pat         | Fay         | Marketing Representative        | Marketing        | Toronto             | Canada                   | Americas    |
| Alexander   | Hunold      | Programmer                      | IT               | Southlake           | United States of America | Americas    |
| Bruce       | Ernst       | Programmer                      | IT               | Southlake           | United States of America | Americas    |
| David       | Austin      | Programmer                      | IT               | Southlake           | United States of America | Americas    |
| Valli       | Pataballa   | Programmer                      | IT               | Southlake           | United States of America | Americas    |
| Diana       | Lorentz     | Programmer                      | IT               | Southlake           | United States of America | Americas    |
| Matthew     | Weiss       | Stock Manager                   | Shipping         | South San Francisco | United States of America | Americas    |
| Adam        | Fripp       | Stock Manager                   | Shipping         | South San Francisco | United States of America | Americas    |
| Payam       | Kaufling    | Stock Manager                   | Shipping         | South San Francisco | United States of America | Americas    |
| Shanta      | Vollman     | Marketing Manager               | Shipping         | South San Francisco | United States of America | Americas    |
| Kevin       | Mourgos     | Stock Manager                   | Shipping         | South San Francisco | United States of America | Americas    |
| Julia       | Nayer       | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Irene       | Mikkilineni | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| James       | Landry      | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Steven      | Markle      | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Laura       | Bissot      | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Mozhe       | Atkinson    | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| James       | Marlow      | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| TJ          | Olson       | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Jason       | Mallin      | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Michael     | Rogers      | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Ki          | Gee         | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Hazel       | Philtanker  | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Renske      | Ladwig      | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Stephen     | Stiles      | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| John        | Seo         | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Joshua      | Patel       | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Trenna      | Rajs        | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Curtis      | Davies      | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Randall     | Matos       | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Peter       | Vargas      | Stock Clerk                     | Shipping         | South San Francisco | United States of America | Americas    |
| Winston     | Taylor      | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Jean        | Fleaur      | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Martha      | Sullivan    | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Girard      | Geoni       | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Nandita     | Sarchand    | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Alexis      | Bull        | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Julia       | Dellinger   | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Anthony     | Cabrio      | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Kelly       | Chung       | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Jennifer    | Dilly       | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Timothy     | Gates       | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Randall     | Perkins     | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Sarah       | Bell        | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Britney     | Everett     | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Samuel      | McCain      | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Vance       | Jones       | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Alana       | Walsh       | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Kevin       | Feeney      | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Donald      | OConnell    | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Douglas     | Grant       | Shipping Clerk                  | Shipping         | South San Francisco | United States of America | Americas    |
| Jennifer    | Whalen      | Administration Assistant        | Administration   | Seattle             | United States of America | Americas    |
| Den         | Raphaely    | Purchasing Manager              | Purchasing       | Seattle             | United States of America | Americas    |
| Alexander   | Khoo        | Purchasing Clerk                | Purchasing       | Seattle             | United States of America | Americas    |
| Shelli      | Baida       | Purchasing Clerk                | Purchasing       | Seattle             | United States of America | Americas    |
| Sigal       | Tobias      | Purchasing Clerk                | Purchasing       | Seattle             | United States of America | Americas    |
| Guy         | Himuro      | Purchasing Clerk                | Purchasing       | Seattle             | United States of America | Americas    |
| Karen       | Colmenares  | Purchasing Clerk                | Purchasing       | Seattle             | United States of America | Americas    |
| Steven      | King        | President                       | Executive        | Seattle             | United States of America | Americas    |
| Neena       | Kochhar     | Administration Vice President   | Executive        | Seattle             | United States of America | Americas    |
| Lex         | De Haan     | Administration Vice President   | Executive        | Seattle             | United States of America | Americas    |
| Nancy       | Greenberg   | Finance Manager                 | Finance          | Seattle             | United States of America | Americas    |
| Daniel      | Faviet      | Accountant                      | Finance          | Seattle             | United States of America | Americas    |
| John        | Chen        | Accountant                      | Finance          | Seattle             | United States of America | Americas    |
| Ismael      | Sciarra     | Accountant                      | Finance          | Seattle             | United States of America | Americas    |
| Jose Manuel | Urman       | Accountant                      | Finance          | Seattle             | United States of America | Americas    |
| Luis        | Popp        | Accountant                      | Finance          | Seattle             | United States of America | Americas    |
| Shelley     | Higgins     | Accounting Manager              | Accounting       | Seattle             | United States of America | Americas    |
| William     | Gietz       | Public Accountant               | Accounting       | Seattle             | United States of America | Americas    |
+-------------+-------------+---------------------------------+------------------+---------------------+--------------------------+-------------+
106 rows in set (0.320 sec)

==========================================================================




19. What is the minimum salaries grouped by department id for those groups having a minimum
salary less than 5000. Listed by the minimum salary.
==========================================================================
query : select department_id, MIN(salary) 
->from employees group by department_id having MIN(salary)<5000 order by MIN(salary) asc ;


output : 
+---------------+-------------+
| department_id | MIN(salary) |
+---------------+-------------+
|            50 |     2100.00 |
|            30 |     2500.00 |
|            60 |     4200.00 |
|            10 |     4400.00 |
+---------------+-------------+
==========================================================================