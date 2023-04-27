-- 1A: Write an SQL statement to show the name of managers.

SELECT FirstName, LastName
FROM employee_table
WHERE Department = 'Manager';

-- 1B: Find the rego numbers of cars that were taken before 2/09/2011.

SELECT reg_no
FROM employee_vehicle_table
WHERE date_taken < '2/09/2011';

-- 1C: Find the cars that were used by Employees in the administration department on 3-9-2011.

SELECT *
FROM employee_vehicle_table V
LEFT JOIN (
    SELECT *
    FROM employee_table
    WHERE department = 'Administration'
) E ON V.employee_no = E.employee_no
WHERE date_taken <= '3/09/2011'
    AND date_returned >= '3/09/2011';

-- 1D: Find the number of cars used by employees whose number is above 120, excluding those employees who are part of the Information tech department.

SELECT COUNT(*)
FROM employee_vehicle_table V
LEFT JOIN (
    SELECT *
    FROM employee_table
    WHERE department <> 'Information Tech'
) E ON V.employee_no = E.employee_no
WHERE V.employee_no > 120;

-- 1E: Find the name and department of the employees, who have taken a Mitsubishi car between 11/08/2011 and 11/09/2011.

SELECT LastName, FirstName, Department
FROM employee_table E
LEFT JOIN (
    SELECT *
    FROM employee_vehicle_table V
    LEFT JOIN (
        SELECT *
        FROM vehicle_table
        WHERE Make = 'Mitsubishi'
    ) M ON M.reg_no = V.reg_no
    WHERE date_taken
    BETWEEN '11/08/2011' AND '11/09/2011'
) V ON V.employee_no = E.employee_no;

-- 1F: Find the employee names who used the least cars.

SELECT LastName, FirstName, V.Bookings as Bookings
FROM employee_table E
LEFT JOIN (
    SELECT employee_no, COUNT(employee_no) AS Bookings
    FROM employee_vehicle_table
    GROUP BY employee_no
) V on E.employee_no = V.employee_no
ORDER BY bookings ASC;


-- 1G: Find the employee/s who returned a vehicle on 15/11/2011.

SELECT LastName, FirstName
FROM employee_table E
LEFT JOIN (
    SELECT *
    FROM employee_vehicle_table
    WHERE date_returned = '15/11/2011'
) V on E.employee_no = V.employee_no;

-- 1H: Find the employee/s who taken a vehicle on 02/09/2011 and 12/09/2011.

SELECT LastName, FirstName
FROM employee_table E
LEFT JOIN (
    SELECT employee_no
    FROM employee_vehicle_table
    WHERE date_taken = '02/09/2011'
    INNER JOIN (
        SELECT employee_no
        FROM employee_vehicle_table
        WHERE date_taken = '12/09/2011'
    ) B on A.employee_no = B.employee_no
    GROUP BY employee_no
) V ON E.employee_no = V.employee_no;