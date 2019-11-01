-- List: employee number, last name, first name, gender, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e, salaries as s
WHERE e.emp_no =  s.emp_no;


-- List employees who were hired in 1986
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date between '1986-01-01'  AND '1986-12-31';


-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number,
-- last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, de.from_date, de.to_date
FROM	departments as d,
		dept_manager as dm,
		employees as e,
		dept_emp as de
WHERE 	e.emp_no = dm.emp_no AND
		d.dept_no = dm.dept_no;
		

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
	INNER JOIN departments as d ON (d.dept_no = de.dept_no)
	INNER JOIN employees as e ON (e.emp_no = de.emp_no)


-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name 
FROM employees 
WHERE first_name = 'Hercules' and left(last_name,1)='B';


-- List all employees in the Sales department, including their employee number,
-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
	INNER JOIN departments as d ON (d.dept_no = de.dept_no)
	INNER JOIN employees as e ON (e.emp_no = de.emp_no)
WHERE d.dept_name =  'Sales';


-- List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
	INNER JOIN departments as d ON (d.dept_no = de.dept_no)
	INNER JOIN employees as e ON (e.emp_no = de.emp_no)
WHERE d.dept_name = 'Development' OR d.dept_name =  'Sales';


-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT last_name, --initial,
    COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

-- Searching my ID number
SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no = 499942;