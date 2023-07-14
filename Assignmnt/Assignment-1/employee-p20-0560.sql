================================================
// First We will create database
================================================
CREATE database Organization;

use Organization;

create TABLE employees (
  emp_no INT(11) PRIMARY KEY,
  first_name VARCHAR(14) NOT NULL,
  last_name VARCHAR(16) NOT NULL,
  birth_date DATE NOT NULL,
  gender ENUM('M','F') NOT NULL,
  hire_date DATE NOT NULL
);

create TABLE department (
  dept_no CHAR(4) PRIMARY KEY,
  dept_name VARCHAR(40) NOT NULL
);

create TABLE dept_emp (
  emp_no INT(11) NOT NULL,
  dept_no CHAR(4) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  PRIMARY KEY (emp_no,dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

create TABLE salaries (
  emp_no INT(11) NOT NULL,
  salary INT(11) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  PRIMARY KEY (emp_no,from_date),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

create TABLE dept_manager (
  dept_no CHAR(4) NOT NULL,
  emp_no INT(11) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  PRIMARY KEY (emp_no,dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

create TABLE titles (
  emp_no INT(11) NOT NULL,
  title VARCHAR(50) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE,
  PRIMARY KEY (emp_no,title,from_date),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

===========================================================
INSERT data in each of the tables.
===========================================================


1)  Adding employees and departments

INSERT INTO employees (emp_no, first_name, last_name, birth_date, gender, hire_date)
VALUES (10001, 'Abubaker', 'khan', '1970-01-16', 'M', '2000-01-01'),
       (10002, 'sultana', 'mo', '1970-01-02', 'F', '2002-02-02');

INSERT INTO department (dept_no, dept_name)
VALUES ('d001', 'Computer'),
       ('d002', 'Software');

2)  Adding employees to departments

INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
VALUES (10001, 'd001', '2002-01-01', '2012-01-01'),
       (10002, 'd002', '2003-02-02', '2015-02-02');

3)  Adding employee salaries

INSERT INTO salaries (emp_no, salary, from_date, to_date)
VALUES (10001, 7000, '2002-01-01', '2012-01-01'),
       (10002, 8000, '2003-02-02', '2015-02-02');

4) Adding employee titles and managers

INSERT INTO titles (emp_no, title, from_date, to_date)
VALUES (10001, 'HOD', '2002-01-01', '2012-01-01'),
       (10002, 'Professor', '2003-02-02', '2015-02-02');

INSERT INTO dept_manager (dept_no, emp_no, from_date, to_date)
VALUES ('d001', 10001, '2002-01-01', '2012-01-01'),
       ('d002', 10002, '2003-02-02', '2015-02-02');

==================================================================
UPDATE a number of records
==================================================================

1) Changing department of an employee

UPDATE dept_emp
SET dept_no = 'd002'
WHERE emp_no = 10001;

2) Updating employee salary

UPDATE salaries
SET salary = 10000
WHERE emp_no = 10001;

3) Changing the name of a department

UPDATE department
SET dept_name = 'Software and Computer'
WHERE dept_no = 'd001';

4) Changing employee job title

UPDATE titles
SET title = 'Director'
WHERE emp_no = 10001;

5)  Changing employee hire date

UPDATE employees
SET hire_date = '2005-01-01'
WHERE emp_no = 10001;

------------------------------------------------------------
DELETE A COUPLE OF RECORDS
------------------------------------------------------------

1)  Deleting employees hired before February 2016

DELETE FROM employees
WHERE hire_date < '2016-02-01';

2) Deleting all departments

DELETE FROM department;
