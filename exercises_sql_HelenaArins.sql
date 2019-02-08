1 - Create a query to display the first name, last name,  hire	 date, salary, and salary after a raise of 20%. Name the last column 
(salary after a raise) heading as “ANNUAL_SAL” (OEHR_EMPLOYEES table).

SELECT DISTINCT FIRST_NAME, 
       LAST_NAME, 
       HIRE_DATE, 
       SALARY, 
       SALARY * 1.2 AS ANNUAL_SAL
FROM OEHR_EMPLOYEES	

2 - Create a query to display the customer last name concatenated with the first name, separated by space, and the telephone number 
concatenated with the email address(If no email address put 'No Email'), separated by hyphen. Name the column headings “FULL_NAME” and 
“CONTACT_DETAILS” respectively (demo_customers table).
Não existe a tabela demo_customers

3 - Display the employee number, first name, job id and department number for all employees whose department number equals 20, 60 or 80 
(OEHR_EMPLOYEES table)..

SELECT EMPLOYEE_ID, 
       FIRST_NAME,
       JOB_ID,
       DEPARTMENT_ID
FROM OEHR_EMPLOYEES
WHERE DEPARTMENT_ID IN ('20', '60', '80');


4 - Display the employee number, first name, job id and department number for all employees whose department number is not equal 
to 20, 60 and 80 (OEHR_EMPLOYEES table).

SELECT EMPLOYEE_ID, 
       FIRST_NAME,
       JOB_ID,
       DEPARTMENT_ID
FROM OEHR_EMPLOYEES
WHERE DEPARTMENT_ID NOT IN ('20', '60', '80');


5 - Display the first name and salary for all employees whose first name ends with an e (OEHR_EMPLOYEES table).
SELECT FIRST_NAME,
       SALARY
FROM OEHR_EMPLOYEES
WHERE FIRST_NAME LIKE '%e';

6 - Display the last name and department number for all employees where the second letter in their last name is i (OEHR_EMPLOYEES table).
SELECT LAST_NAME,
       DEPARTMENT_ID
FROM OEHR_EMPLOYEES
WHERE LAST_NAME LIKE '_i%';	

7 - Display the first name, hire date, salary and department number for all employees whose first name doesn’t have the letter A. Sort the query in ascending order by department number (OEHR_EMPLOYEES table).
SELECT FIRST_NAME,
       HIRE_DATE,
       SALARY,
       DEPARTMENT_ID
FROM OEHR_EMPLOYEES
WHERE FIRST_NAME NOT LIKE '%A%'
AND FIRST_NAME NOT LIKE '%a%';
ORDER BY DEPARTMENT_ID

8 - Display the first name concatenated with the last name, separated by comma, and salary, for all employees whose salary not in the 
range between 7000 and 15000. Sort the query in ascending order by the full name (first_name, last_name) (OEHR_EMPLOYEES table).
SELECT CONCAT(CONCAT(FIRST_NAME,','), LAST_NAME) AS FULL_NAME,
       SALARY
FROM OEHR_EMPLOYEES
WHERE SALARY < 7000 
OR SALARY > 15000
ORDER BY FULL_NAME

9 - Display all data from Employees table for all employees whose:
salary is in the range of 6000 and 800 and their commission is not null OR
department number is not equal to 80, 90 and 100 (OEHR_EMPLOYEES table)
SELECT *
FROM OEHR_EMPLOYEES
WHERE SALARY BETWEEN 800 AND 6000
AND COMMISSION_PCT IS NOT NULL 
OR DEPARTMENT_ID NOT IN (80,90,100)

10 - Display the first name in lower case and last name in upper case, for all employees 
whose employee number is in the range between 80 and 150.(OEHR_EMPLOYEES table)
SELECT LOWER(FIRST_NAME) AS FIRST_NAME,
       UPPER(LAST_NAME) AS LAST_NAME
FROM OEHR_EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 80 AND 150

11 - For each employee, display the first name, last name, and email address. 
The email address will be composed from the first letter of first name, concatenated with the three first letters of last name, 
concatenated with @oracle.com.(OEHR_EMPLOYEES table)
SELECT DISTINCT FIRST_NAME,
       LAST_NAME,
       CONCAT(CONCAT(SUBSTR(FIRST_NAME,1,1),SUBSTR(LAST_NAME,1,3)), '@oracle.com') AS EMAIL_ADDRESS 
FROM OEHR_EMPLOYEES

12 - For each employee, use the CONCAT function to display the first name concatenated with the last name, concatenated with hire date.(OEHR_EMPLOYEES table)
SELECT DISTINCT CONCAT(CONCAT(FIRST_NAME,LAST_NAME), HIRE_DATE)
FROM OEHR_EMPLOYEES

13 - Display the last name for all employees where last name’s length is greater than 8 characters.(OEHR_EMPLOYEES table)
SELECT DISTINCT LAST_NAME
FROM OEHR_EMPLOYEES
WHERE LENGTH(LAST_NAME) > 8

14 - For each employee, display the first name, last name, phone number and a new phone number using the REPLACE function. 
in the new phone number replace all prefixes of 515 with 	.(OEHR_EMPLOYEES table)
SELECT DISTINCT FIRST_NAME, 
       LAST_NAME, 
       PHONE_NUMBER,
       CONCAT(REPLACE(SUBSTR(PHONE_NUMBER,1,3), 515, 815), SUBSTR(PHONE_NUMBER,4,20))
FROM OEHR_EMPLOYEES

15 - For each employee, display :
first name
salary
salary after a raise of 12%
salary after a raise of 12%,  expressed as a whole number (ROUND).
salary after a raise of 12%, round down to the nearest whole number.
(OEHR_EMPLOYEES table)

SELECT DISTINCT FIRST_NAME, 
       SALARY,
       SALARY * 1.12,
       ROUND(SALARY * 1.	12),
       CEIL(SALARY * 1.12)
FROM OEHR_EMPLOYEES


16 - For each employee, display the first name, hire date, hire date minus 10 days, hire date plus one month, 
and the day difference between current date and hire date.(OEHR_EMPLOYEES table)
SELECT DISTINCT FIRST_NAME, 
       HIRE_DATE,
       HIRE_DATE+9,
       ADD_MONTHS(HIRE_DATE, 1)
FROM OEHR_EMPLOYEES

17 - Display the last name in upper case, the salary in format model : ‘9,999.999’, and hire date in format model: ‘DD/MM/YYYY’, 
for all employees whose last name begins with the letter D or K.(OEHR_EMPLOYEES table)
SELECT DISTINCT UPPER(LAST_NAME), 
       TO_CHAR(SALARY, '999,999.999'),
       TO_CHAR(HIRE_DATE, 'DD/MM/YYYY')
FROM OEHR_EMPLOYEES
WHERE LAST_NAME LIKE 'D%'
OR LAST_NAME LIKE 'K%';      

18 - For each employee, display the first name, last name, salary and commission percentage. 
If an employee doesn’t earn a commission, display “No Commission” instead of NULL.(OEHR_EMPLOYEES table)
SELECT DISTINCT FIRST_NAME, 
                LAST_NAME, 
				SALARY, 
                NVL(TO_CHAR(COMMISSION_PCT), 'No Commission') AS COMMISSION_PCT
FROM OEHR_EMPLOYEES

19 - Case Function - For each employee, display the first name, last name, salary, and a salary grade based on these conditions :
if the salary is between 0 and 5000 – salary grade level is A
if the salary is between 5001 and 15000 – salary grade level is B
if the salary is between 15001 and 20000 – salary grade level is C
for any other range – salary grade level is D
(OEHR_EMPLOYEES table)

SELECT DISTINCT FIRST_NAME, 
                LAST_NAME, 
                SALARY, 
                CASE WHEN SALARY BETWEEN (0) AND (5000) THEN 'A'
                WHEN SALARY BETWEEN (5001) AND (15000) THEN 'B'
                WHEN SALARY BETWEEN (15001) AND (20000) THEN 'C'
                ELSE 'D' END AS CLASS
FROM OEHR_EMPLOYEES;

20 - Display the department	number, and the average salary for each department, 
for all departments whose number is in the range of 20 and 80, and their average salary is greater than 9000.(OEHR_EMPLOYEES table)
SELECT DISTINCT DEPARTMENT_ID, 
       AVG(SALARY)
FROM OEHR_EMPLOYEES
WHERE DEPARTMENT_ID BETWEEN 20 AND 80
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > 9000;

21 - Display the first name, last name, and department number for all employees who work in Sales department (OEHR_Employees and OEHR_Departments table).
SELECT DISTINCT EMP.FIRST_NAME, 
       EMP.LAST_NAME,
       EMP.DEPARTMENT_ID,   
FROM OEHR_EMPLOYEES EMP
JOIN OEHR_Departments DEP ON DEP.DEPARTMENT_ID = EMP.DEPARTMENT_ID
WHERE  DEP.DEPARTMENT_NAME = 'Sales'

22 - Display the first name, salary and department number for all employees 
whose department is located Seattle (OEHR_Employees, OEHR_Departments and OEHR_Locations table).
SELECT DISTINCT EMP.FIRST_NAME, 
       EMP.SALARY,
       EMP.DEPARTMENT_ID  
FROM OEHR_EMPLOYEES EMP
INNER JOIN OEHR_Departments DEP ON DEP.DEPARTMENT_ID = EMP.DEPARTMENT_ID
INNER JOIN OEHR_Locations LOC ON LOC.LOCATION_ID = DEP.LOCATION_ID
WHERE  LOC.CITY = 'Seattle'

23 - Display the first name, salary, and department number for all employees who earn less than the average salary, 
and also work at the same department as employee whose first name is Kevin.(OEHR_EMPLOYEES table)
SELECT DISTINCT EMP.FIRST_NAME, 
       EMP.SALARY,
       EMP.DEPARTMENT_ID  
FROM OEHR_EMPLOYEES EMP
WHERE SALARY < (SELECT AVG(SALARY) FROM OEHR_EMPLOYEES)

24 - Display the first name, last name, department number and department name, 
for all employees in departments 50 or 90. (OEHR_Employees & OEHR_Departments tables)
SELECT DISTINCT EMP.FIRST_NAME, 
       EMP.LAST_NAME,
       EMP.DEPARTMENT_ID,  
       DEP.DEPARTMENT_NAME
FROM OEHR_EMPLOYEES EMP
INNER JOIN OEHR_Departments DEP ON DEP.DEPARTMENT_ID = EMP.DEPARTMENT_ID
WHERE EMP.DEPARTMENT_ID BETWEEN 50 AND 90;

25 - Display the full name, department name, city, and state province, 
for all employees whose last name contains the letter a (OEHR_Departments, OEHR_Employees & OEHR_Locations tables)
SELECT DISTINCT  EMP.FIRST_NAME || ' ' || EMP.LAST_NAME as FULL_NAME,
       DEP.DEPARTMENT_NAME,
       LOC.CITY,
       LOC.STATE_PROVINCE
FROM OEHR_EMPLOYEES EMP
INNER JOIN OEHR_Departments DEP ON DEP.DEPARTMENT_ID = EMP.DEPARTMENT_ID
INNER JOIN OEHR_Locations LOC ON LOC.LOCATION_ID = DEP.LOCATION_ID
WHERE  EMP.LAST_NAME LIKE '%A%'
OR EMP.LAST_NAME LIKE '%a%'
		
26 - For each employee, display the first name, salary, and job title (OEHR_Employees & OEHR_Jobs tables)
SELECT DISTINCT EMP.FIRST_NAME,
       EMP.SALARY,
       TIT.JOB_TITLE
FROM OEHR_EMPLOYEES EMP
INNER JOIN OEHR_JOBS TIT ON TIT.JOB_ID = EMP.JOB_ID 

27 - Display the first name, last name, department number and department name, 
for all employees including those without any department. (OEHR_Employees and OEHR_Departments table).
SELECT DISTINCT EMP.FIRST_NAME,
       EMP.LAST_NAME,
       EMP.DEPARTMENT_ID,
       DEP.DEPARTMENT_NAME	
FROM OEHR_EMPLOYEES EMP
LEFT JOIN OEHR_Departments DEP ON DEP.DEPARTMENT_ID = EMP.DEPARTMENT_ID

28 - Modify your query to display all departments including departments without any employees.(OEHR_Employees and OEHR_Departments table).
SELECT DISTINCT EMP.FIRST_NAME,
       EMP.LAST_NAME,
       EMP.DEPARTMENT_ID,
       DEP.DEPARTMENT_NAME	
FROM OEHR_EMPLOYEES EMP
FULL JOIN OEHR_Departments DEP ON DEP.DEPARTMENT_ID = EMP.DEPARTMENT_ID

29 - Display the first name, last name, and department number for all employees 
who work in the same department as employee whose last name is “King”.(OEHR_EMPLOYEES table)
SELECT DISTINCT EMP.FIRST_NAME,
       EMP.LAST_NAME,
       EMP.DEPARTMENT_ID,
       DEP.DEPARTMENT_NAME
FROM OEHR_EMPLOYEES EMP
JOIN OEHR_Departments DEP ON DEP.DEPARTMENT_ID = EMP.DEPARTMENT_ID
WHERE EMP.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM OEHR_EMPLOYEES WHERE LAST_NAME = 'King')

30 - Display the last name and salary for all employees who earn less than employee number 103.(OEHR_EMPLOYEES table)
SELECT FIRST_NAME,
       LAST_NAME,
       DEPARTMENT_ID
FROM OEHR_EMPLOYEES
WHERE SALARY < (SELECT SALARY FROM OEHR_EMPLOYEES WHERE EMPLOYEE_ID = '103')
