--1
select distinct e.lname from employee e, works_on w, project p
where
e.ssn=w.essn
and
w.pno in p.pnumber;

--2

select employee.dno,department.dname,avg(employee.salary)
from employee,department
where employee.dno=department.dnumber
group by employee.dno,department.dname
order by employee.dno; 


--3
select employee.lname
from employee,department
where
employee.ssn=department.mgr_ssn
minus
select employee.lname
from employee,dependent
where
employee.ssn=dependent.essn;



--4
select e1.fname,e1.lname
from employee e1
where
e1.dno=
(select dno
from employee
where 
salary = (select min(salary) from employee));


--5


select count(*)  as empcount from employee;






--6
select distinct e1.fname,e1.lname
from employee e1,employee e2
where
e1.salary>((select max(employee.salary) from employee)-20000);























