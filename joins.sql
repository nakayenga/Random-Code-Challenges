/* Joins
 find the employees that are earning more than their managers
*/
select emp.name as employee_name
from employees emp
join employees managers on emp.manager_id = mgr.id
where emp.salary > mgr.salary
