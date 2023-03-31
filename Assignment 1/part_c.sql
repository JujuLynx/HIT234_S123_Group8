-- This is how you write a comment.

/*
Keep all SQL queries and answers related to part C here.
*/

-- Question 1
/* What are the 5 most popular books?
◦	Show ASBN, Title.
◦	HINT: To limit results use ROWNUM.
*/

SELECT B.TITLE, COUNT(L.ISBN) AS BOOK_COUNT
FROM LOAN L
JOIN BOOK B
ON L.ISBN = B.ISBN
GROUP BY B.TITLE
ORDER BY BOOK_COUNT DESC
FETCH FIRST 5 ROWS ONLY;

-- Question 2

-- Question 3

-- Question 4
/*Find the borrower that has returned a book on the dated 16 December 2010 and 8 May 2012
◦	Show two different methods.
*/

--METHOD 1

SELECT (B.FNAME ||' '|| B.LNAME) AS BORROWER_NAME
FROM BORROWER B, LOAN L1, LOAN L2
WHERE B.CARDNO = L1.CARDNO
AND L1.CARDNO = L2.CARDNO
AND L1.DATEIN = '16-DEC-2010'
AND L2.DATEIN = '8-MAY-2012';

-- Question 5