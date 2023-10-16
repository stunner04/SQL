CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
SELECT * FROM Title;
SELECT * FROM Worker;
SELECT * FROM Bonus;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 # Q1
 select FIRST_NAME as WORKER_NAME from Worker;
 
 # Q2
 select upper(FIRST_NAME) from worker;
 
 #Q3
 select distinct DEPARTMENT from Worker;
 select DEPARTMENT from Worker group by DEPARTMENT;
 
 #Q4
 select FIRST_NAME from Worker where FIRST_NAME like "___%"; # why not working?
 select substring(FIRST_NAME,1,3) from Worker;
 
 #Q5
 select instr(FIRST_NAME ,'b') from Worker where FIRST_NAME = "Amitabh"; 
 
 #Q6
 select rtrim(FIRST_NAME) from Worker; 
 
 #Q7
 select ltrim(FIRST_NAME) from Worker; 
 
 #Q8
 select distinct DEPARTMENT, length(DEPARTMENT) from Worker;
 
 Q9
sQlect replace(FIRST_NAME,'a','A') from Worker; 

#Q0
sQlect concat(FIRST_NAME,' ',LAST_NAME) as COMPLETE_NAME from Worker;

#Q1
sQlect * from worker order by FIRST_NAME;

#Q2
select * from worker order by FIRST_NAME, DEPARTMENT desc; 

#Q13
select *from worker where FIRST_NAME = "Vipul" or FIRST_NAME = "Satish";
select *from worker where FIRST_NAME in ("Vipul", "Satish");

# Q14
select *from worker where FIRST_NAME not in ("Vipul", "Satish");

# Q15
select * from worker where department like "Admin%";
select * from worker where department = "Admin";

#Q16
select * from worker where first_name like "%a%";

#Q17
select * from worker where first_name like "%a";

#Q18
select * from worker where first_name like "%h" and length(first_name) = 6;
select * from worker where first_name like "_____h";

# Q19
select * from worker where salary between 100000 and 500000;

# Q20
select * from worker where year(joining_date) = 2014 and month(joining_date) = 02;

# Q21
select department, count(worker_id) as NumberOfWorkersInAdmin from worker where department = "Admin";
select department, count(*) as NumberOfWorkersInAdmin from worker where department = "Admin";

# Q22
select concat(first_name,' ',last_name) as FullName, salary  from worker where salary >= 50000 and salary <=100000;
select concat(first_name,' ',last_name) as FullName, salary  from worker where salary between 50000 and 100000;

# Q23
select department, count(worker_id) as Count from worker group by department order by Count desc; 

# Q24
select worker_id as ID,first_name,last_name,worker_title from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title = "Manager";
select w.* from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title = "Manager"; # manager at HR & Admin
 

 
 
 