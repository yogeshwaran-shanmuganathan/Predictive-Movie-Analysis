CREATE DATABASE Movie_database
use Movie_database;

ALTER TABLE Movie add foreign key (LocationID ) references Location (LocationID);

ALTER TABLE Movie add foreign key (CastID ) references Cast(CastID);

ALTER TABLE Cast add foreign key (DirectorID ) references Director(DirectorID);

ALTER TABLE Cast add foreign key (ActorId ) references Actor(ActorId);

ALTER TABLE Sales add foreign key (LocationId ) references Location(locationId);



CREATE DATABASE MovieSales_DW

USE MovieSales_DW;

CREATE TABLE CastDim
(
CastKey int identity Primary key not null,
CastID Varchar(50),
ActorID int,
AFirstName varchar(50),
ALastName varchar(50),
AGender varchar(50),
DirectorId varchar(50),
DFirstName varchar(50),
DLastName varchar(50),
Dgender varchar(50)
);


CREATE TABLE MovieDim
(
MovieKey int identity Primary key not null,
MovieId INT ,
MName varchar(50),
Mrating float,
Mgenre varchar(50),
Date date,
CastID varchar(50),
LocationID varchar(50)
);



CREATE TABLE LocationDim
(
LocationKey int identity Primary key not null,
LocationId INT ,
Region varchar(50),
Country varchar(50),
Continent varchar(50)
);


CREATE TABLE DateDim
(
DateKey int identity Primary key not null,
Date DATE,
Day INT,
Week INT,
Month INT,
Year INT,
);

Create Table SalesDim
(
SalesKey int identity Primary key not null,
SalesId int,
NoTicketsSold int,
PriceofTicket int,
LocationID varchar(50)
);


CREATE TABLE Movie_fact
(
MovieKey INT FOREIGN KEY REFERENCES MovieDim(MovieKey),
CastKey int foreign key references CastDim(CastKey),
LocationKey int foreign key references LocationDim(LocationKey),
DateKey int foreign key references DateDim(DateKey),
SalesKey int foreign key references SalesDim(SalesKey),
TotalTicketsSold int,
TotalSales int
)









