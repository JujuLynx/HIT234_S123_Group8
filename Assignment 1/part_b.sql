-- This is how you write a comment.

/*
Keep all SQL queries and answers related to part B here.

How to show all table names in the database:

    SELECT table_name
    FROM   user_tables;

Get columns of a table

    SELECT column_name
    FROM   all_tab_columns
    WHERE  table_name = 'table_name';

Example to insert multiple rows at a time into a table:

    CREATE TABLE test (
        userID INT,
        userName VARCHAR(255)
    );
    INSERT INTO test
        WITH t AS (
            SELECT 1, 'Alpha' FROM dual UNION ALL
            SELECT 2, 'Bravo' FROM dual UNION ALL
            SELECT 3, 'Charlie' FROM dual
        )
        SELECT * FROM t;
    SELECT * FROM test;
    DROP TABLE test;

*/

/* Question 1
Question is too long to put here, refer to assignment for instructions.
I don't think Oracle likes it if you make foreign keys to tables that don't exist, so remove the comments if/when those tables are created.
*/

CREATE TABLE occurrence_exercise (
    occexid INT PRIMARY KEY,
    exerciseno VARCHAR(12), -- FOREIGN KEY REFERENCES Exercise(ExerciseNo),
    occurrenceID INT, -- FOREIGN KEY REFERENCES Occurence(OccurrenceID),
    rep INT,
    attempt1 INT,
    attempt2 INT,
    attempt3 INT,
    condition VARCHAR(6)
        CONSTRAINT check_Condition CHECK (Condition IN ('Heavy', 'Medium', 'Light'))
);

-- Question 2

INSERT INTO occurrence_exercise
    WITH t (occexid, exerciseno, occurrenceID, rep, attempt1, attempt2, attempt3, condition) AS (
        SELECT 9001, TO_NUMBER('001A', 'xxxx'), 1,  8,  15,  15,   15, 'Light'  FROM dual UNION ALL
        SELECT 9002, TO_NUMBER('002A', 'xxxx'), 1,  8,  70,  75,   70, 'Medium' FROM dual UNION ALL
        SELECT 9003, TO_NUMBER('003A', 'xxxx'), 2, 12,  90,  95,   90, 'Heavy'  FROM dual UNION ALL
        SELECT 9004, TO_NUMBER('004A', 'xxxx'), 3, 12, 200, 200,  200, 'Medium' FROM dual UNION ALL
        SELECT 9005, TO_NUMBER('006A', 'xxxx'), 3,  8, 110, 110,  115, 'Heavy'  FROM dual UNION ALL
        SELECT 9006, TO_NUMBER('005A', 'xxxx'), 4, 10,  20,  25,    0, 'Medium' FROM dual UNION ALL
        SELECT 9007, TO_NUMBER('001A', 'xxxx'), 4,  8,  10,  12,   10, 'Medium' FROM dual UNION ALL
        SELECT 9008, TO_NUMBER('002A', 'xxxx'), 5,  8,  85,  90,  115, 'Heavy'  FROM dual
    )
    SELECT * FROM t;
SELECT * FROM occurrence_exercise;
DROP TABLE occurrence_exercise; -- cleanup


/*
SELECT * FROM occurrence_exercise;
DROP TABLE occurrence_exercise;
*/

/*
INSERT INTO occurrence_exercise (OccExID, ExerciseNo, OccurrenceID, Rep, Attempt1, Attempt2, Attempt3, Condition)
VALUES (1, TO_NUMBER('001A', 'xxxx'), 1, 8, 15, 15, 15, 'Light');
*/


/* Question 3
Create the following query:
    Find the exercise which contains the maximum total weight lifted
    - Show: Exercise, Maximum weight
    - Ensure you show captions for each of the columns

    Hint: you would need to consider the number of times the weight is lifted and weight
    e.g. rep multiplied by attempt multiplied by the weight
*/

SELECT OCCEXID AS EXERCISE, REP*(ATTEMPT1 + ATTEMPT2 + ATTEMPT3) AS MAX_WEIGHT
FROM OCCURRENCE_EXERCISE
ORDER BY MAX_WEIGHT DESC;

/* Question 4
Create the following query:
    Find the exercise that the user was not able to complete 3 attempts in, or the exercise that the user has not attempted.
    - Show appropriate columns
    - List in ascending order exercise type
    - Do not show repeated names
    - Ensure you show captions for each of the columns
*/