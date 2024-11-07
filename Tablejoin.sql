create table dept(did number(3) primary key, dname varchar(20), location varchar(10));

create table emp(eid number(3) primary key, ename varchar(20) not null, salary number(10, 2), doj date ,did number(3) references dept(did));

insert into dept values(10, 'HR', 'Pune');
insert into dept values(20, 'IT', 'Mumbai');
insert into dept values(30, 'SALES', 'Delhi');
insert into dept values(40, 'MARKETING', 'Gujrat');

insert into emp values(101, 'John', 10000, '01-JAN-2010', 10);
insert into emp values(102, 'Smith', 20000, '01-FEB-2010', 20);
insert into emp values(103, 'Peter', 30000, '01-MAR-2010', 30);
insert into emp values(104, 'David', 40000, '01-APR-2010', 40);
insert into emp values(105, 'Anna', 50000, '01-MAY-2010', 10);
insert into emp values(106, 'Sussane', 60000, '01-JUN-2010', 20);
insert into emp values(107, 'Jimmy', 70000, '01-JUL-2010', 30);

SELECT * FROM dept;
SELECT * FROM emp;

SELECT ename, dname FROM dept d, emp e WHERE d.did = e.did;

SELECT did FROM dept UNION SELECT did FROM emp;

SELECT did FROM dept UNION ALL SELECT did FROM emp;

SELECT did FROM dept INTERSECT SELECT did FROM emp;

SELECT did FROM dept MINUS SELECT did FROM emp;

SELECT emp.ename, dept.dname from emp LEFT JOIN dept on emp.did = dept.did;

SELECT emp.ename, dept.dname from emp RIGHT JOIN dept on emp.did = dept.did;

SELECT emp.ename, dept.dname from emp FULL JOIN dept on emp.did = dept.did;

SELECT emp.ename from emp, dept where emp.did = dept.did and dept.dname = 'HR'

SELECT ename from emp where did=(select did from dept where dname='HR');

-- Find the highest salary and name of the employee who is getting maximum salary 
SELECT ENAME, SALARY FROM EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP);

-- Find the 2nd maximum salary from employee 
SELECT MAX(SALARY) FROM EMP WHERE SALARY <> (SELECT MAX(SALARY) FROM EMP);
SELECT MAX(SALARY) FROM EMP WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM EMP);

-- Find the name of the employee who is getting the 2nd maximum salary 
SELECT ENAME FROM EMP WHERE SALARY=(SELECT MAX(SALARY) FROM EMP WHERE SALARY <> (SELECT MAX(SALARY) FROM EMP));

-- Find the count of the employee in each department
SELECT DNAME, COUNT(*) AS COUNT_EMP FROM EMP, DEPT WHERE EMP.DID = DEPT.DID GROUP BY DNAME  

-- Find the department which has less than 2 employees in it 
SELECT DNAME FROM EMP, DEPT WHERE EMP.DID = DEPT.DID GROUP BY DNAME HAVING  COUNT(*) < 2

-- Find the highest salary and name of that employee for each department in the EMP and DEPT table 
SELECT d.dname, e.ename, e.salary
FROM emp e
JOIN dept d ON e.did = d.did
WHERE (e.did, e.salary) IN (
	SELECT did, MAX(salary)
	FROM emp
	GROUP BY did
);
-- Find the name of that employee for each department in the EMP and DEPT table whose salary is maximum in the department
SELECT ENAME FROM EMP WHERE SALARY IN (SELECT MAX(SALARY) FROM EMP, DEPT WHERE EMP.DID = DEPT.DID GROUP BY DEPT.DID)