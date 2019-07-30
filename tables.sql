create table supplier(
supplier_id number(5),
name varchar2(20));

create table part(
name varchar2(20),
unit_cost number(5),
inventory_qty number(5),
supplier_id number(5));

create table inventory_class(
inv_class varchar2(20),
low_cost number(5),
high_cost number(5));

insert into supplier values(1, 'SMP');
insert into supplier values(2, 'CMD');
insert into supplier values(3, 'Echo');

insert into part values('Nuts', 100, 5,1);
insert into part values('Brush', 300, 10, 3);

insert into inventory_class values('Hardware', 50, 200);
insert into inventory_class values('Paint', 250, 450);

--EQUI
SELECT s.name supplier_name, p.name part_name
FROM supplier s JOIN part p
ON s.supplier_id = p.supplier_id;

--NON-EQUI JOINS
SELECT p.name part_name, c.inv_class inv_class, p.UNIT_COST, c.LOW_COST,
c.high_COST
FROM part p JOIN inventory_class c
ON p.unit_cost BETWEEN c.low_cost AND c.high_cost;


-- SELF JOIN
Create TABLE associate(
emp_id number(5) not null primary key,
fname varchar2(20),
lname varchar2(20),
dept_id number(5),
manager_emp_id number(5) references associate(emp_id),
salary number(5)
);

insert into associate values(1, 'Rajesh', 'Kumar', 21, null, 95000);
insert into associate values(2, 'Ram', 'Raj', 21, 1, 80000);

SELECT e.fname employee, m.fname manager
FROM associate e JOIN associate m
ON e.manager_emp_id = m.emp_id;

SELECT e.fname employee, m.fname manager
FROM associate e LEFT OUTER JOIN associate m
ON e.manager_emp_id = m.emp_id;



-- joint and subquery
select * from emp where dept_id = (
select dept_id from department
where dept_name = 'HR');

select *
from emp e, dept d
where e.dept_id = dept_id and dept_name = 'HR');

-- corelated subquery
SELECT supplier_id, name
FROM supplier s
WHERE EXISTS(SELECT *
    FROM part p
    WHERE p.Inventory_qty<10
    AND p.supplier_id = s.supplier_id);