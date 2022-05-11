-- Create a new database called Shop. Create following tables to the database:
-- Employees
-- - id: int
-- - name: varchar
-- - email: varchar

-- Customers
-- - id: int,
-- - name: varchar
-- - email: varchar

-- Orders
-- - id: int
-- - sold_by: int
-- - buyer: int

-- Define the following foreign key restrictions to the Orders table:
-- When the employee or customer is updated, the updated value is reflected to Employees 
-- and Customers tables. When a customer is deleted, the delete operation is blocked if the 
-- customer who made the order exists. When an employee is deleted, the employee in the Orders 
-- table is set to NULL.