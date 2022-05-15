--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.salary
FROM employees E
JOIN emp_salary S
ON E.emp_no = S.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT E.first_name, E.last_name, E.hire_date
FROM employees E
WHERE EXTRACT(ISOYEAR FROM  hire_date) = 1986

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_manager dm
ON d.dept_no = dm.dept_no
JOIN employees e
on dm.emp_no = e.emp_no
ORDER BY 2

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN emp_dept ed
ON d.dept_no = ed.dept_no
JOIN employees e
on ed.emp_no = e.emp_no
ORDER BY 2, 3

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN emp_dept ed
ON d.dept_no = ed.dept_no
JOIN employees e
on ed.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY 2, 3

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN emp_dept ed
ON d.dept_no = ed.dept_no
JOIN employees e
on ed.emp_no = e.emp_no
WHERE d.dept_name IN('Sales', 'Development')
ORDER BY 2, 3

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) "Count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY 2 DESC