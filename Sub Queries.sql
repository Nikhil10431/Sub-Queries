-- Write a SQL query to find all employees who earn a salary greater than the average salary of their department.

SELECT name, department, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);


-- Use a subquery to find the department with the highest average salary and list all employees working in that department.
SELECT name, department, salary
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    GROUP BY department
    ORDER BY AVG(salary) DESC
    LIMIT 1
);


-- Create a query to find all employees whose salary is above the average salary of the company, using a subquery to calculate the average company salary

SELECT name, department, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- Write a query that finds the top 3 departments with the highest total salaries, using a subquery to calculate the total salary for each department.

SELECT department, total_salary
FROM (
    SELECT department,SUM(salary) AS total_salary
    FROM employees
    GROUP BY department
) AS department_salaries
ORDER BY total_salary DESC
LIMIT 3;