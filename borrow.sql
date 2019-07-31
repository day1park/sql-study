create table book (
Book_Id varchar2(4) not null,
Book_Name varchar2(50) not null,
Book_Type varchar2(20),
Author varchar2(50),
Price Number(10),
constraints Book_Pk primary key (Book_Id)
);

create table student(
Student_Id varchar2(4) not null,
Student_Name varchar2(50)not null,
Age number(3),
Book_Id varchar2(4),
constraints Student_Pk primary key (Student_Id),
constraints Fk_Book foreign key (Book_Id) references book(Book_Id)
);

insert into book values('B100', 'Chaturanga', 'Novel', 'Tagore', 300);
insert into book values('B150', 'Daffodils', 'Poem', 'WordsWorth', 200 );
insert into book values('B200', 'Last Leaf', 'Short story', 'O Henry', 250 );
insert into book values('B250', 'My Experiments With Truth', 'Autobiography', 'M.K. Ghandi',600 );
insert into book values('B300', 'Stopping by woods on Snowy evng', 'Poem', 'Robert Frost', 300);
insert into book values('B350', 'A Sketch', 'Poem', 'WordsWorth', 175 );
insert into book values('B450', 'Malgudy Days', 'Short story', 'RK Narayan', 275);
insert into book values('B500', 'Gitanjali', 'Poem', 'Tagore', 500);

select * from book 

insert into student values('ST11','Jyoti', 18 , 'B300');
insert into student values('ST22','Ram', 23 , 'B100');
insert into student values('ST33','Raj', 20 , '' );
insert into student values('ST44','Swapna', 22 , 'B150');
insert into student values('ST55','Avanit', 19 , 'B200');
insert into student values('ST66','Anubhav', 21 , 'B250');
insert into student values('ST77','Veena', 25, '' );
insert into student values('ST88','Nitya', 17 , 'B500');


select * from student;

-- 1. list students reading 'WordsWorth'
select s.Student_Name, b.author
from student s JOIN book b
on s.Book_Id = b.Book_Id
where b.author='WordsWorth';

-- 2. list student names with age who read books priced between 230 and 550
select s.Student_Name, s.Age
from student s JOIN book b
on s.Book_Id = b.Book_Id
where b.Price between 230 and 550;

-- 3. count number of books under poem count() aggregation 
select COUNT(Book_Type)
from book b
where b.Book_type = 'Poem';

-- 4. display all book names with name of student names who borrowed it
select b.Book_Name, s.Student_Name
from book b LEFT OUTER JOIN student s
on b.Book_Id = s.Book_Id;

-- 5. list all student names with book names age less than 20 reading poems
select s.Student_Name, b.Book_Name
from student s JOIN book b
on s.Book_Id = b.Book_Id
where s.Age < 20 and Book_Type = 'Poem';

-- 6. display average price of books under poem
select AVG(Price)
from book;

-- 7. list student names with book category that are reading Tagore
select s.Student_Name, b.Book_Type, b.Author
from student s JOIN book b
on s.Book_Id = b.Book_Id
where b.author='Tagore';

-- 8. list all students with name of book borrowed
select s.Student_Name, b.Book_Name
from student s LEFT OUTER JOIN book b
on s.Book_Id = b.Book_Id;