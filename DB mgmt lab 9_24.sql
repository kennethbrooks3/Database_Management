create table departments(
    Did varchar*(1) not null primary key,
    Name varchar(20) not null,
    dateFormed date
);


Create Table people(
    pid int not null,
    firstname varchar(20),
    lastname varchar(20),
    hiredate date, 
    Did varchar(1), not null references Departments(Did),
   primary key(pid)
)
    