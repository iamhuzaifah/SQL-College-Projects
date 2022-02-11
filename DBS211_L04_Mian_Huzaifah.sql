--1.	Create a query that shows employee number, first name, last name, city, phone number and postal code for all employees in France.
--a.	    Answer this question using an ANSI-89 Join
SELECT employeenumber, firstname, lastname, city, phone, postalcode
FROM employees E, offices O
WHERE E.officecode = O.officecode
and UPPER(O.country) = 'FRANCE';

--b.	    Answer this question using an ANSI-92 Join
SELECT E.employeenumber, E.firstname, E.lastname, O.city, O.phone, O,postalcode
FROM employees E INNER JOIN offices O
ON E.officecode = O.officecode
WHERE UPPER(O.country) = 'FRANCE';

--2.	Create a query that displays all payments made by customers from Canada.  
--a.	    Sort the output by Customer Number.  
SELECT * FROM customers C INNER JOIN payments P
ON C.customernumber = P.customernumber
WHERE P.amount > 0
AND UPPER(C.country) = 'CANADA'
ORDER BY C.customernumber;

--b.	    Only display the Customer Number, Customer Name, Payment Date and Amount.  
SELECT C.customernumber, C.customername, P.paymentdate, P.amount
FROM customers C INNER JOIN payments P
ON C.customernumber = P.customernumber
WHERE P.amount > 0
AND UPPER(C.country) = 'CANADA';

--c.	    Make sure the date is displayed clearly to know what date it is. (i.e. what date is 02-04-19??? – Feb 4, 2019, April 2, 2019, April 19, 2002, ….)
SELECT * FROM customers C INNER JOIN payments P
ON C.customernumber = P.customernumber
WHERE P.amount > 0
AND UPPER(C.country) = 'Canada';

--3.	Create a query that shows all USA customers who have not made a payment.  Display only the customer number and customer name sorted by customer number.
SELECT DISTINCT customers.customerNumber,customerName,country
FROM customers, payments
WHERE customers.customernumber != payments.customernumber
AND UPPER(customers.country) = 'USA'
ORDER BY customerNumber DESC;

--4.a)     Create a view (vwCustomerOrder) to list all orders with the following data for all customers:  
--         Customer Number, Order number, order date, product name, quantity ordered, and price for each product in every order. 
CREATE VIEW vwCustomerOrder AS SELECT
o.orderNumber,o.orderDate,p.productName,d.quantityOrdered,d.priceEach,o.customerNumber,d.orderlineNumber
FROM orders o, products p, orderdetails d 
WHERE o.ordernumber = d.ordernumber;

--b)       Write a statement to view the results of the view just created.
SELECT *FROM vwCustomerOrder;

--5.	Using the vwCustomerOrder  view, display the order information for customer number 124. Sort the output based on order number and then order line number. (Yes, I know orderLineNumber is not in the view)
SELECT vwCustomerOrder FROM customers 
WHERE customerNumber = '124' 
ORDER BY orderNumber,orderLineNumber;
 
--6.	Create a query that displays the customer number, first name, last name, phone, and credit limits for all customers who do not have any orders.
SELECT customernumber,contactfirstname,phone,creditlimit FROM customers 
WHERE customers.customernumber NOT IN (SELECT customernumber FROM orders);

--7.	Create a view (vwEmployeeManager) to display all information of all employees and the name and the last name of their managers if there is any manager that the employee reports to.  Include all employees, including those who do not report to anyone.
CREATE VIEW  vmEmployeeManager 
AS SELECT e.* ,m.firstName as managerFirstName,m.lastName as managerLastName 
FROM employees e, employees m 
WHERE e.reportsTo=m.employeeNumber;

--8     Modify the employee_manager view so the view returns only employee information for employees who have a manager. Do not DROP and recreate the view – modify it. (Google is your friend).
CREATE OR REPLACE VIEW vmEmployeeManager  
AS SELECT *FROM employees
WHERE reportsto IS NULL;

--9.	Drop both customer_order and employee_manager views. 
DROP VIEW vwCustomerOrder;
DROP VIEW vmEmployeeManager;