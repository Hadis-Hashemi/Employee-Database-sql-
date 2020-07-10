-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT E.emp_no AS "employee number", E.last_name AS "last name", E.first_name AS "first name", E.gender, S.salary
from employees AS E
JOIN salaries As S
On S.emp_no = E.emp_no;

-- 2. List employees who were hired in 1986.

SELECT * 
from employees
Where hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number,
--last name, first name, and start and end employment dates.

SELECT D.dept_no, D.dept_name, DM.emp_no,  E.last_name, E.first_name, DM.from_date, DM.to_date
FROM DEPARTMENTS AS D
JOIN dept_manager AS DM 
on DM.dept_no=D.dept_no
JOIN employees AS E
on E.emp_no=DM.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

CREATE VIEW EMPLOYEES_DEP_NAME AS(
SELECT E.emp_no AS "employee number", E.last_name AS "last name", E.first_name AS "first name", D.dept_name AS "department name"
FROM employees AS E
JOIN dept_emp AS DE 
ON E.emp_no=DE.emp_no
JOIN DEPARTMENTS As D
On D.dept_no=DE.dept_no
);

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name  FROM employees
WHERE
first_name = 'Hercules'   AND last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT * FROM EMPLOYEES_DEP_NAME WHERE
"department name" = 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT * FROM EMPLOYEES_DEP_NAME WHERE
"department name" = 'Sales' OR "department name"='Development'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, count(last_name) 
From employees 
GROUP BY last_name
ORDER BY last_name DESC;

