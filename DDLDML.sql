SELECT * FROM STUDENTS;

UPDATE STUDENTS SET MARKS=90.5 WHERE ROLL=1;

SELECT NAME, MARKS, MARKS+10 NEW_MARKS FROM STUDENTS;

SELECT NAME || ' HAS GOT ' || MARKS || ' MARKS' AS "MARKS_INFO" FROM STUDENTS;

SELECT NAME, AGE FROM STUDENTS WHERE AGE IN (20, 29, 35);

SELECT NAME, AGE FROM STUDENTS WHERE AGE NOT IN (20, 29, 35);

SELECT NAME, AGE FROM STUDENTS WHERE AGE BETWEEN 20 AND 30;

SELECT NAME, AGE FROM STUDENTS WHERE PHONE IS NULL;

SELECT NAME FROM STUDENTS WHERE NAME LIKE 'J%';

SELECT NAME FROM STUDENTS WHERE NAME LIKE '%n';

SELECT NAME FROM STUDENTS WHERE NAME LIKE '_a%';

SELECT NAME FROM STUDENTS WHERE NAME LIKE '%c%';

