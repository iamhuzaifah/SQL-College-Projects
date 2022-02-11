/*Lab 01
Objectives:
The purpose of the first lab of DBS211 is to familiarize yourself with the User Interface, SQL Developer, that we will be using throughout the course to communicate with the Oracle server.  By the end of this lab you should be able to:
•	Successfully establish a connection with and login to the Oracle database server using SQL Developer
•	Run the sample database creation script 
•	Navigate SQL Developer to view the tables created, their structure and the data contained within them.
Preface:
If you have not already done so, you will need to download the sample database creation script from blackboard and run it.  These instructions are included in the W01 - Getting Started with SQL Developer document.
SUBMISSION
Answer the following questions in the SQL Developer Worksheet area saving the file as “DBS211_Lab01_<yourlastname>.sql” where you put your actual last name in the file name.
Make sure that your file has an appropriate comment header that includes your name, the date, the title of the document, and a description of the contents.  Use comment blocks for answers that are not running code and ensure that all answers are clearly labelled for which question or step they referring to.  I have provided a starter file that you may use or use as an example to go by. 
Save the file as Submit ONLY the .sql file you saved to Blackboard.
Tasks – Explore the Database and the Development Environment
In the connections window, expand Tables.
1)	How many tables have been created? List the names of the created tables.
    8 have been created, Customers, Employees, Offices, Order Details, Orders, Payments, Product lines and products
    
2)	Click on table customers. Click on the Data tab near the top of the worksheet. How many rows are there in the table customers?
    122 rows
    
3)	What SQL statement would return the same results. Write the statement in the .sql file and execute it.  
    SELECT * FROM CUSTOMERS
    
    You will learn how to select rows and columns from a table by writing SQL select statements later in this course.

4)	How many columns does the customers table have? List the column names.
    13
    CUSTOMERNUMBER
    CUSTOMERNAME
    CONTACTLASTNAME
    CONTACTFIRSTNAME
    PHONE
    ADDRESSLINE1
    ADDRESSLINE2
    CITY
    STATE
    POSTALCODE
    COUNTRY
    SALESREPEMPLOYEENUMBER
    CREDITLIMIT
    
5)	What is the value of each column in the first row in table customers? Write the column name and the column data type in addition to the value.
    CUSTOMERNUMBER - NUMBER(38) - 103
    CUSTOMERNAME - VARCHAR2(50) - Atelier graphique
    CONTACTLASTNAME - VARCHAR2(50) - Schmitt
    CONTACTFIRSTNAME - VARCHAR2(50) - Carine 
    PHONE - VARCHAR2(50) - 40.32.2555
    ADDRESSLINE1 - VARCHAR2(50) - 54, rue Royale
    ADDRESSLINE2 - VARCHAR2(50) - (NULL)
    CITY - VARCHAR2(50) - Nantes
    STATE - VARCHAR2(50) - (NULL) 
    POSTALCODE - VARCHAR2(15) - 44000
    COUNTRY - VARCHAR2(50) - France
    SALESREPEMPLOYEENUMBER - NUMBER(38) - 1370
    CREDITLIMIT - NUMBER(10,2) - 21000
?
6)	Write the number of rows and columns for the rest of the tables in your schema.  Format it something like the following.
    Table Name		  Rows			Columns
    Customers		  122             13
    Employees          23              8
    Offices             7              9
    Order Details    2996              6
    Orders            326              6
    Payments          273              4
    ProductLines        7              2
    Products          110              6

7)	Right Click on the orderdetails table and choose tables/count rows.  How many rows does the order details table include?
    Order Details    2996
    
8)	Write the following SQL statement in the new tab.
    desc offices; 
	You can also write
    describe offices;
	What is the result of the statement execution?
    Name         Null?    Type         
    ------------ -------- ------------ 
    OFFICECODE   NOT NULL VARCHAR2(10) 
    CITY         NOT NULL VARCHAR2(50) 
    PHONE        NOT NULL VARCHAR2(50) 
    ADDRESSLINE1 NOT NULL VARCHAR2(50) 
    ADDRESSLINE2          VARCHAR2(50) 
    STATE                 VARCHAR2(50) 
    COUNTRY      NOT NULL VARCHAR2(50)  
    POSTALCODE   NOT NULL VARCHAR2(15) 
    TERRITORY    NOT NULL VARCHAR2(10) 
    
9)	Type the following statements in, execute them, then briefly describe what the statement is doing!
    SELECT * FROM employees;
    This statement is returning all the rows in the table that is named employees
    
    SELECT * FROM customers ORDER BY ContactLastName;
    This is returning all the rows from the table that is named customers but also ordering them by the ContactLastName
    
10)	How many constraints does the products table have?
    11 constraints

11)	Find a way to turn on line numbers in the gutter.  Where is the gutter? Describe its location in your solution file.
    on Windows I went to the tools, then preferences, and then turned them on from there. The location is on the left
    
12)	Set the font size in the worksheet editor to a size that is best for you.  (Hint: Tools/Preferences
    Done
*/