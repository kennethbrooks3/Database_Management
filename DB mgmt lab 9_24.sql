create table departments(
    Did varchar(1) not null primary key,
    Name varchar(20) not null,
    dateFormed date
);

--People
Create Table people(
    pid int not null,
    firstname varchar(20),
    lastname varchar(20),
    hiredate date, 
    Did varchar(1) not null references Departments(Did),
   primary key(pid)
);

--FY
Create table FY(
    year int not null, 
    start date,
    enddate date,
   Primary key(year)
);
    
    
--Insert Departments
INSERT INTO Departments(Did, name, dateFormed)
  VALUES('A', 'CS', '6/30/2010');
  
INSERT INTO Departments(Did, name, dateFormed)
  VALUES('B', 'IT', '1/1/2013');
  
INSERT INTO Departments(Did, name, dateFormed)
  VALUES('c', 'IS', '7/4/2014');
  
  
--Insert People
INSERT INTO People(Pid, Firstname, Lastname, Hiredate, Did)
  VALUES('1', 'Kenneth', 'Brooks', '1/23/2008', 'A');
  
INSERT INTO People(Pid, Firstname, Lastname, Hiredate, Did)
  VALUES('2', 'Cole', 'Roseman', '9/28/2006', 'A');
  
INSERT INTO People(Pid, Firstname, Lastname, Hiredate, Did)
  VALUES('3', 'Victor', 'Firman', '4/4/2012', 'B');
  
INSERT INTO People(Pid, Firstname, Lastname, Hiredate, Did)
  VALUES('4', 'Melanie', 'Savitsky', '11/11/2013', 'B');
  
INSERT INTO People(Pid, Firstname, Lastname, Hiredate, Did)
  VALUES('5', 'Matt', 'Brooks', '11/11/2014', 'B');
  
  
--Insert Fiscal Year
INSERT INTO FY(year, start, enddate)
  VALUES('2012', '7/1/11', '6/30/12');
  
INSERT INTO FY(year, start, enddate)
  VALUES('2013', '7/1/12', '6/30/13');
  
INSERT INTO FY(year, start, enddate)
  VALUES('2014', '7/1/13', '6/30/14');
  
INSERT INTO FY(year, start, enddate)
  VALUES('2015', '7/1/14', '6/30/15');
  
--List all people, the date they were hired, and their department.
Select people.firstname, people.lastname, people.hiredate, departments.name
From people, departments
Where people.Did = departments.did

--List all people, the fiscal year in which they were hired, and their department.
Select people.firstname, people.lastname, FY.year, departments.name
From people, departments, FY
Where people.did = departments.did
  AND FY.enddate >= people.hiredate
  AND fy.start <= people.hiredate
  
--List all department names and the neumber of people in each. 
Select departments.name, count(people.*)
FROM departments, people
Where people.Did = Departments.Did
Group by Departments.name
--List all fiscal years and the number of people hired in each time span. 
--List all fiscal years and the number of departments founded in that time span. 
--List all departments with no people.
--List all people with no department.
--List all people hired before their department was founded.