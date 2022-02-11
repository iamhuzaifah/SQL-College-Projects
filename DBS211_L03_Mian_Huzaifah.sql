-- Display the data for all offices.
Select * FROM offices;

-- Display the employee number for all employees whose office code is 1.
SELECT employeeNumber FROM employees WHERE officeCode = 1;

-- Display customer number, customer name, contact first name and contact last name, and phone for all customers in Paris. (hint: be wary of case sensitivity)
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone FROM customers WHERE UPPER(city) = 'PARIS';

-- Repeat the previous Query with a couple small changes:	
-- The contact’s first and last name should be in a single column in the format “lastname, firstname”.
SELECT customerNumber, customerName, CONCAT(CONCAT(contactFirstName, ', '), contactLastName), phone FROM customers WHERE UPPER(city) = 'PARIS';

-- Show customers who are in Canada
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone FROM customers WHERE UPPER(country) = 'CANADA';

-- Display customer number for customers who have payments.  Do not included any repeated 
-- values. (hints: how do you know a customer has made a payment? You will need to access only one table for this query)
SELECT DISTINCT customerNumber FROM payments ORDER by customerNumber; 

-- List customer numbers, check number, and amount for customers whose payment amount is not in the range of $30,000 to $65,000. Sort the output by top payments amount first.
SELECT customerNumber, checkNumber, amount FROM payments WHERE amount NOT BETWEEN 30000 AND 65000 ORDER BY amount DESC;

-- Display the order information for all orders that are cancelled. 
SELECT * FROM orders WHERE UPPER(status) = 'CANCELLED';

-- The company needs to know the percentage markup for each product sold.  Produce a query that outputs the ProductCode, ProductName, BuyPrice, MSRP in addition to
-- The difference between MSRP and BuyPrice (i.e. MSRP-BuyPrice) called markup
-- The percentage markup (100 * calculated by difference / BuyPrice) called percmarkup
-- rounded to 1 decimal place.
SELECT productCode, productname, buyprice, MSRP, MSRP - BuyPrice AS markup, ROUND(100 * (MSRP - BuyPrice)/BuyPrice, 1) AS permarkup FROM products;

-- Display the information of all products with string ‘co’ in their product name. (c and o can be lower or upper case).
SELECT * FROM products WHERE UPPER (productname) LIKE '%CO%';

-- Display all customers whose contact first name starts with letter s (both lowercase and uppercase) and includes letter e (both lowercase and uppercase).
SELECT * FROM customers WHERE UPPER(contactFirstName) LIKE 'S%E%';

-- Create a statement that will insert yourself as an employee of the company.  
-- Use a unique employee number of your choice
-- Use your school email address
-- Your job title will be “Cashier”
-- Office code will be 4
-- You will report to employee 1088
INSERT INTO employees VALUES(1010, 'Mian', 'Huzaifah', 'x1357', 'hmian5@myseneca.ca', 4, 1088, 'Cashier');

-- Create a query that displays your, and only your, employee data
SELECT * FROM employees WHERE employeenumber = 1010;

-- Create a statement to update your job title to “Head Cashier”
UPDATE employees SET jobTitle = 'Head Cashier' WHERE employeenumber = 1800;

-- Create a statement to insert another fictional employee into the database.  This employee will be a “Cashier” and will report to you.  Make up fake data for the other fields.
INSERT INTO employees VALUES (1021, 'Ripley', 'John', 'x1290', 'JohnRipley@gmail,com', 4, 1088, 'Cashier');

-- Create a statement to Delete yourself from the database.  Did it work?  If not, why?
DELETE FROM employees WHERE employeeNumber = 1010;
-- Did not work because the system prevented it from being deleted due to referential integrity

-- Create a statement to delete the fake employee from the database and then rerun the statement to delete yourself.  Did it work?
DELETE FROM employees WHERE employeenumber = 1021;

-- Create a single statement that will insert both yourself and the fake employee at the same time.  This time the fake employee will report to 1088 as well.
INSERT ALL 
INTO employees VALUES(1010, 'Mian', 'Huzaifah', 'x1357', 'hmian5@myseneca.ca', 4, 1088, 'Cashier')
INTO employees VALUES(1021, 'Ripley', 'John', 'x1290', 'JohnRipley@gmail,com', 4, 1088, 'Cashier')
SELECT * FROM DUAL;
-- Create a single statement to delete both yourself and the fake employee.
DELETE FROM employees WHERE employeenumber = 1010 OR employeenumber = 1021;
