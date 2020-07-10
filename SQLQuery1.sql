--creating table Minion

create table Minions(
Id int primary key identity,
Name varchar(50) not null,
Age numeric(3) );

----creating table Towns
create table Towns(
Id int primary key identity,
Name varchar(50) not null,);


-- Adding new column naming as Twonid
Alter table Minions 
Add TownId int

-- Adding Constraint Foreign Key  on Newly Added column TownId
Alter table dbo.Minions 
Add constraint FK_TownId 
Foreign Key (TownId) references Towns(Id);



--SET IDENTITY_INSERT [TABLE NAME] ON FOR INSERTING DATA INTO THE TABLE
SET IDENTITY_INSERT Minions ON
INSERT INTO Minions(Id, Name,Age) VALUES
(1, 'Kevin',22),
(2,'bobr',15),
(3,'Steward', null);

select *from Minions;

-- TURN OF THE SET IDENTITY_INSERT [TABLE NAME] OFF    -- so that we can add value into the table, no clue why it is necessary to turn off
SET IDENTITY_INSERT Minions off

SET IDENTITY_INSERT Towns ON
INSERT INTO Towns(Id, Name) VALUES
(1, 'Sofia'),
(2,'Peter'),
(3,'Victoria')




-- Deleteing data from tables 
-- there are certain ways to delete the data
--1) delete the whole row
--2) delete the whole column
--3) delete the specific Entry i.g Sofia or 1 

ALTER TABLE Minions DROP COLUMN Id;
--	Msg 5074, Level 16, State 1, Line 52
--	The object 'PK__Minions__3214EC072E8671BE' is dependent on column 'Id'.
---	Msg 4922, Level 16, State 9, Line 52
--	ALTER TABLE DROP COLUMN Id failed because one or more objects access this column.


ALTER TABLE Minions DROP COLUMN Age;

ALTER TABLE Minions DROP COLUMN Name;


-- droping columns from the Towns table
ALTER TABLE Towns DROP COLUMN Name;

ALTER TABLE Towns DROP COLUMN Id;
--	Msg 5074, Level 16, State 1, Line 52
--	The object 'PK__Minions__3214EC072E8671BE' is dependent on column 'Id'.
---	Msg 4922, Level 16, State 9, Line 52
--	ALTER TABLE DROP COLUMN Id failed because one or more objects access this column.


-- Deleting data with condition
DELETE FROM MINIONS 
WHERE
Id=1;

DELETE FROM MINIONS 
WHERE
Id=2;

DELETE FROM MINIONS 
WHERE
Id=3;

-- Deleting all data from Minions
delete from Minions;

select *from Minions;

-- Deleting all data from Towns
delete from Towns;



select *from Towns;


-- Deleting whole tables from the database
--Droping table Minions

drop table Minions;

--Droping table Towns.

drop table Towns;







Task 7
create table People(
Id int Primary Key identity(1,1),  
Name Varchar (200) not null,
Picture varbinary (Max),
Height Numeric (15,2),
Weight Numeric (15,2),
Gender varchar (15),
Birthdate Date not Null);

select *from people;

ALTER TABLE People DROP COLUMN Biography;

ALTER TABLE People 
ADD  Biography VARCHAR (200);


ADD CONSTRAINT CHK_People_Picture__2MB CHECK (DATALENGTH(Picture) <= 2000)

set identity_insert People on

insert into People(Id, Name, Picture, Height, Weight, Gender, Birthdate)
values
(2,'Umar',null, 76.00, 72.00, 'Male', '1984-03-13');

insert into People(Id, Name, Picture, Height, Weight, Gender, Birthdate, Biography)
values
(3,'Haris',null, 76.00, 72.00, 'Male', '1985-07-18', 'h');

insert into People(Id, Name, Picture, Height, Weight, Gender, Birthdate, Biography)
values
(4,'Johan',null, 80.00, 92.00, 'Male', '1985-09-19', 'Say no to Drugs');

insert into People(Id, Name, Picture, Height, Weight, Gender, Birthdate, Biography)
values
(5,'Jany',null, 60.00, 70.00, 'FeMale', '1990-08-19', 'Love Drugs');




Task – 8
create table Users(
Id int Primary key identity,
UserName Varchar (30)Unique not null,
Password Varchar (26) not null,
ProfilePicture Varbinary(MAX) CHECK (DATALENGTH(ProfilePicture) <= 2000), 
LastLoginTime Datetime,
IsDeleted bit
);




-- inserting Records

set Identity_Insert Users on
insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(1,'Ehtisham', 'Hello123',null, '2020-07-08 20:30:15',1)


--	TASK 9
-- drp primary key
--Primary Key will not be deleted with traditional query 'drop Primary Key' 
--need to go to (Key Folder) and Copy the name of the Primary Key name and put it as Constraint name and drop it

Alter table Users
DROP CONSTRAINT PK__Users__3214EC07A4C26FB7


-- Creating  a New PRIMARY KEY WITH THE COMBINATION OF TWO COLUMNS

ALTER TABLE Users
ADD PRIMARY KEY (Id, UserName)



insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(1,'Ryan', 'Jlldfo123',null, '2020-03-08 20:30:15',0)

insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(1,'Janny', 'Helfdlo123',null, '2020-07-28 20:30:15',1)

insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(1,'Rasmus', 'Hesdfsllo123',null, '2020-07-18 20:30:15',0)





create table Users(
Id int Primary key identity,
UserName Varchar (30)Unique not null,
Password Varchar (26) not null,
ProfilePicture Varbinary(MAX) CHECK (DATALENGTH(ProfilePicture) <= 2000), 
LastLoginTime Datetime,
IsDeleted bit
);

-- inserting Records

set Identity_Insert Users on
insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(1,'Ehtisham', 'Hello123',null, '2020-07-08 20:30:15',1)


--	TASK 9
-- drp primary key
--Primary Key will not be deleted with traditional query 'drop Primary Key' 
--need to go to (Key Folder) and Copy the name of the Primary Key name and put it as Constraint name and drop it

Alter table Users
DROP CONSTRAINT PK__Users__3214EC07A4C26FB7


-- Creating  a New PRIMARY KEY WITH THE COMBINATION OF TWO COLUMNS

ALTER TABLE Users
ADD PRIMARY KEY (Id, UserName)


--TASK 10
--Password field are at least 5 symbols long. 


ALTER TABLE Users
ADD CONSTRAINT PASSWORD_Length_CK CHECK (DATALENGTH(Password) >=5)  

-- inserting data
set Identity_Insert Users on
insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(1,'Janny', 'Hello',null, '2020-07-08 20:30:15',0)


-- insertign data with lesser length of symbols/character in the password column

insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(1,'Ryno', '1234',null, '2020-06-08 20:30:15',1)

--Error Msg--
--Msg 547, Level 16, State 0, Line 48
--The INSERT statement conflicted with the CHECK constraint "PASSWORD_Length_CK". The conflict occurred in database "Minions",
--table "dbo.Users", column 'Password'.
--The statement has been terminated.
--Completion time: 2020-07-09T14:17:10.2045970+02:00



--TASK 11
Alter table Users
ADD CONSTRAINT Current_Time_UsersTable DEFAULT GETDATE() FOR LastLoginTime

Alter table Users
ADD  DEFAULT GETDATE() FOR LastLoginTime

ALTER TABLE Users
drop CONSTRAINT Current_Time_UsersTable


--inserting Data

--for current time and date

insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(5,'Sady', '1238465',null,getdate(),1)

insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(6,'Tiny', '12345',null,getdate(),1)



select *from users
delete from Users 
where Id=2;




create table Users(
Id int Primary key identity,
UserName Varchar (30)Unique not null,
Password Varchar (26) not null,
ProfilePicture Varbinary(MAX) CHECK (DATALENGTH(ProfilePicture) <= 2000), 
LastLoginTime Datetime,
IsDeleted bit
);

-- inserting Records

set Identity_Insert Users on
insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(1,'Ehtisham', 'Hello123',null, '2020-07-08 20:30:15',1)


--	TASK 9
-- drp primary key
--Primary Key will not be deleted with traditional query 'drop Primary Key' 
--need to go to (Key Folder) and Copy the name of the Primary Key name and put it as Constraint name and drop it

Alter table Users
DROP CONSTRAINT PK__Users__3214EC07A4C26FB7


-- Creating  a New PRIMARY KEY WITH THE COMBINATION OF TWO COLUMNS

ALTER TABLE Users
ADD PRIMARY KEY (Id, UserName)


--TASK 10
--Password field are at least 5 symbols long. 


ALTER TABLE Users
ADD CONSTRAINT PASSWORD_Length_CK CHECK (DATALENGTH(Password) >=5)  

-- inserting data
set Identity_Insert Users on
insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(1,'Janny', 'Hello',null, '2020-07-08 20:30:15',0)


-- insertign data with lesser length of symbols/character in the password column

insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(1,'Ryno', '1234',null, '2020-06-08 20:30:15',1)

--Error Msg--
--Msg 547, Level 16, State 0, Line 48
--The INSERT statement conflicted with the CHECK constraint "PASSWORD_Length_CK". The conflict occurred in database "Minions",
--table "dbo.Users", column 'Password'.
--The statement has been terminated.
--Completion time: 2020-07-09T14:17:10.2045970+02:00



--TASK 11
Alter table Users
ADD CONSTRAINT Current_Time_UsersTable DEFAULT GETDATE() FOR LastLoginTime

Alter table Users
ADD  DEFAULT GETDATE() FOR LastLoginTime

ALTER TABLE Users
drop CONSTRAINT Current_Time_UsersTable


--inserting Data

--for current time and date

insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(5,'Sady', '1238465',null,getdate(),1)

insert into Users (Id, UserName, Password, ProfilePicture, LastLoginTime, IsDeleted)
values
(6,'Tiny', '12345',null,getdate(),1)



select *from users
delete from Users 
where Id=2;




--Task 12
-- Using SQL queries modify table Users. Make the default value of LastLoginTime field to be the current time.

Alter table Users
drop constraint PK__Users__5E8BC442B8F7EFDB


Alter Table Users
Add  usersId int

select *from Users

UPDATE Users SET usersId = Id;


drop Column Id

Alter table Users
Add Id int Primary Key Identity


set identity_insert Users on 

UPDATE Users SET Id = usersId;

Alter table Users
drop  constraint PK__Users__3214EC07A04EDC32

Alter table Users
drop Column Id

Alter table Users
Add Id int

update Users set Id=usersId;


Alter table Users
drop column usersId;

Alter Table Users
Add Primary Key (Id ) null

select *from Users
CONSTRAINT chk_10000 CHECK (DATALENGTH([Col1]) <= 10000)





select *from Users

Alter table Users
add primary key (UserName, Id)

drop table users
select *from Users





create table Users(
Id int Primary key identity,
UserName Varchar (30)Unique not null,
Password Varchar (26) not null,
ProfilePicture Varbinary(MAX) CHECK (DATALENGTH(ProfilePicture) <= 2000), 
LastLoginTime Datetime,
IsDeleted bit
);

Alter table Users
drop constraint PK__Users__3214EC071D3F962E

ALTER TABLE Users
ADD CONSTRAINT PK_Id_Username
PRIMARY KEY (Id, Username)

ALTER TABLE Users
DROP CONSTRAINT PK_Id_Username

ALTER TABLE Users
ADD CONSTRAINT PK_Id
PRIMARY KEY (Id)

ALTER TABLE Users
ADD CONSTRAINT UsernameLength CHECK (LEN(Username) >= 3)

