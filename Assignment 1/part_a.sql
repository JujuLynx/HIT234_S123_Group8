/*
This is how you write a multi-line comment.
Keep all SQL queries and answers related to part A here.

https://www.w3schools.com/sql/
*/

-- Create the database (remember to run as a 'script', not as a 'statement')

CREATE TABLE borrower AS SELECT * FROM jtutty.Borrower;
CREATE TABLE book AS SELECT * FROM jtutty.book;
CREATE TABLE branch AS SELECT * FROM jtutty.branch;
CREATE TABLE loan AS SELECT * FROM jtutty.loan;

/* Columns
borrower:   cardno, lname, fname, suburb, postcode;
book:       isbn, title, yearpublished, publishername;
branch:     branchid, branchname;
loan:       isbn, branchid, cardno, dateout, datein;
*/

/* Question 1
List in ascending order the Last Names of all borrowers with Card Number less than 150.
*/

SELECT lname
FROM borrower
WHERE cardno < 150
ORDER BY lname ASC;


/* Question 2
What are the records of those loans between 3 June 2014 and 8 Mar 2018?

- The output should include the name of the cardholder, and title of the book.
- List in ascending order by last name and first name
*/

SELECT lname, fname, isbn, dateout
FROM loan
INNER JOIN borrower ON loan.cardno = borrower.cardno
WHERE dateout
BETWEEN '03/JUN/14' AND '08/MAR/18'
ORDER BY lname ASC;


/* Question 3
Find the total numbers of loans with last name beginning with D through E (including E);include last name beginning with Q as well as Z also.

- The output of the above question should be a column containing the sum of all the loanbased on the condition in the query, alternatively the output could be a table with columnsthat has the last name as per the condition in the query condition, also the table containsthe list of loans.
*/

SELECT COUNT(B.CARDNO)
FROM BORROWER B, LOAN L
WHERE B.CARDNO = L.CARDNO
AND (UPPER(B.LNAME) LIKE 'D%'
OR UPPER(B.LNAME) LIKE 'E%'
OR UPPER(B.LNAME) LIKE 'Q%'
OR UPPER(B.LNAME) LIKE 'Z%');

/* Question 4
Find all borrowers for a loan that have the Date-in before 15-March-15 and the Card numberbetween 100 and 300 in Karama or Darwin.

- The output for the above question is a list of all borrowers (first name and last name)based on the condition in the query.
*/

SELECT (fname || ' '|| lname)
FROM loan
INNER JOIN borrower ON loan.cardno = borrower.cardno
WHERE borrower.cardno BETWEEN 100 AND 300
    AND loan.datein < '15/MAR/15'
    AND (suburb = 'KARAMA' OR suburb = 'DARWIN');


/* Question 5
Find the number of loans, which have been made from each branch?

- Note all branches need to be included even those with no loans
- The output of the above question is a table containing the list of loans only as per thecondition in the query
*/

/*ATTEMPT 1 */
SELECT B.BRANCHNAME, COUNT(L.ISBN)
FROM BRANCH B, LOAN L
WHERE B.BRANCHID = L.BRANCHID
GROUP BY B.BRANCHNAME;

/*ATTEMPT */
SELECT BRANCH.BRANCHNAME, COUNT(LOAN.ISBN)
FROM BRANCH
JOIN LOAN ON BRANCH.BRANCHID = LOAN.BRANCHID
GROUP BY BRANCH.BRANCHNAME;

/* Question 6
Create your own question based on the library database, and also provide a SQLStatement to answer your question.
*/