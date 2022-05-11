-- In task 2 you will need GROUP BY, ORDER BY ja COUNT commands.

-- Find out which Northwind company's employees have sold products and how many. 
-- Include the count of sold orders, employee's name and title in the company to
-- the result. Order the result according the number of sales in descending order. 
-- Don't include employees that have not sold anything in the result.

SELECT COUNT(orders.id) as sales, emp.first_name, emp.last_name, emp.job_title
FROM orders
INNER JOIN employees AS emp ON emp.id = orders.employee_id
GROUP BY(emp.id)
ORDER BY sales DESC;