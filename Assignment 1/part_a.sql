/*
    This is how you write a multi-line comment.
    Keep all SQL queries and answers related to part A here.
*/

-- Create the database

CREATE TABLE borrower AS SELECT * FROM jtutty.Borrower;
CREATE TABLE book AS SELECT * FROM jtutty.book ;
CREATE TABLE branch AS SELECT * FROM jtutty.branch;
CREATE TABLE loan AS SELECT * FROM jtutty.loan;

/* Columns
borrower:   cardno, lname, fname, suburb, postcode;
book:       isbn, title, yearpublished, publishername;
branch:     branchid, branchname;
loan:       isbn, branchid, cardno, dateout, datein;
*/

-- Question 1

SELECT lname
FROM borrower
WHERE cardno < 150
ORDER BY lname ASC;

-- Question 2

SELECT lname, fname, isbn, dateout
FROM loan
INNER JOIN borrower ON loan.cardno = borrower.cardno
WHERE dateout
BETWEEN '03/JUN/14' AND '08/MAR/18'
ORDER BY lname ASC;

-- Question 3

-- Question 4

SELECT (fname || ' '|| lname)
FROM loan
INNER JOIN borrower ON loan.cardno = borrower.cardno
WHERE borrower.cardno BETWEEN 100 AND 300
    AND loan.datein < '15/MAR/15'
    AND (suburb = 'KARAMA' OR suburb = 'DARWIN');

-- Question 5

-- Question 6