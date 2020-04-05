

--###################################################################################
--1.Details of each employee: employee number, last name, first name, gender, and salary.
--###################################################################################
select e.first_name,e.last_name,e.gender,--e.hire_date,
		(select s.salary from salary as s where s.emp_no = e.emp_no)
from employee as e

--###################################################################################
--2.List employees who were hired in 1986.
--###################################################################################

select e.first_name,e.last_name,EXTRACT (YEAR FROM hire_date)as YEAR
from employee as e
Where 
	e.hire_date >= '1986-01-01' 
AND e.hire_date < '1987-01-01'

--###################################################################################
--3.List the manager of each department with 
--department number, department name, the manager's employee number,
--last name, first name, and start and end employment dates.
--###################################################################################

select d.dept_no,d.dept_name,dm.emp_no,dm.from_date,dm.to_date,
		e.last_name,e.first_name		
from dept_manager as dm
Join employee as e
on e.emp_no = dm.emp_no
Join departments as d
on d.dept_no = dm.dept_no

--###################################################################################
--4.List the department of each employee with : employee number, last name, first name, 
--and department name.
--###################################################################################

select e.emp_no,e.last_name,e.first_name,
		(select d.dept_name from departments as d where ed.dept_no = d.dept_no)
From employee as e ,dept_emp as ed 
where
e.emp_no=ed.emp_no

--###################################################################################
--5.List all employees whose first name is "Hercules" and last names begin with "B."
--###################################################################################

select emp_no,first_name,last_name from employee
Where first_name = 'Hercules' 
and last_name like 'B%'

--###################################################################################
--6.List all employees in the Sales department, including their
--employee number, last name, first name, and department name.
--###################################################################################

select e.emp_no,e.last_name,e.first_name,d.dept_name
from employee as e
join dept_emp as de
on e.emp_no=de.emp_no
join departments as d
on d.dept_no=de.dept_no
where d.dept_name ='Sales'
--###################################################################################
--7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
--###################################################################################

select e.emp_no,e.last_name,e.first_name,d.dept_name
from employee as e
join dept_emp as de
on e.emp_no=de.emp_no
join departments as d
on d.dept_no=de.dept_no
where d.dept_name ='Sales'
or d.dept_name ='Development'
order by d.dept_name   
  
--###################################################################################
--8.In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
--###################################################################################

select last_name, count(last_name)as frequency from employee
  group by last_name
  order by frequency desc