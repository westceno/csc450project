
-- if tables already exist, drop them

drop table Brand;
drop table BodyStyle;
drop table Model;
drop table Transmission;
drop table Vehicle;
drop table Engine;
drop table Dealer;
drop table Sale;
drop table Customer;

--create tables and insert tuples for Problem 1

create table Brand
(BrandId	numeric(3) not null,
 Name		varchar2(20) not null,
 Logo		varchar2(15),
 constraint Brand_pk primary key (BrandId));
 
create table BodyStyleId
(BodyStyleId	numeric(3) not null,
 Name		varchar2(20) not null,
 Passengers		numeric(2),
 constraint BodyStyleId_pk primary key (BodyStyleId));
 
create table Transmission
(TransmissonId	numeric(3) not null,
 Name		varchar2(20),
 TranType	varchar2(10) not null,
 constraint Transmission_pk primary key (TransmissionId));

create table Engine
(EngineId	numeric(3) not null,
 Name		varchar2(20),
 Cylinders	numeric(2) not null,
 Horsepower	numeric(3) not null,
 constraint Engine_pk primary key (EngineId));
 
create table Dealer
(DealerId	numeric(3) not null,
 Name		varchar2(20) not null,
 Address	varchar2(30),
 constraint Dealer_pk primary key (DealerId));
 
create table Customer
(CustomerId	numeric(4) not null,
 Name		varchar2(20) not null,
 Address	varchar2(30),
 Phone		numeric(10) not null,
 Gender		varchar2(1),
 Income		numeric(7),
 constraint Customer_pk primary key (CustomerId));

create table Model
(ModelId	numeric(4) not null,
 BrandId	numeric(3) not null,
 Modelname	varchar2(10),
 BodyStyleId numeric(3) not null,
 constraint Model_pk primary key (ModelId),
 constraint Brand_fk foreign key (BrandId) refrences Brand(BrandId) ON UPDATE CASCADE ON DELETE RESTRICT,
 constraint BodyStyle_fk foreign key (BodyStyleId) refrences BodyStyle(BodyStyleId) ON UPDATE CASCADE ON DELETE RESTRICT);

create table Vehicle
(VIN		varchar2(17) not null,
 ModelId	numeric(4) not null,
 DealerId	numeric(3) not null,
 EngineId	numeric(3) not null,
 TransmissonId	numeric(3) not null,
 ProductionDate	date not null,
 Color		varchar2(10),
 constraint Vehicle_pk primary key (VIN),
 constraint Model_fk foreign key (ModelId) refrences Model(ModelId) ON UPDATE CASCADE ON DELETE RESTRICT,
 constraint Dealer_fk foreign key (DealerId) refrences Dealer(DealerId) ON UPDATE CASCADE ON DELETE RESTRICT,
 constraint Engine_fk foreign key (EngineId) refrences Engine(EngineId) ON UPDATE CASCADE ON DELETE RESTRICT,
 constraint Transmission_fk foreign key (TransmissionId) refrences Transmission(TransmissionId) ON UPDATE CASCADE ON DELETE RESTRICT);
 
create table Sale
(SaleId		numeric(4) not null,
 CustomerId	numeric(4) not null,
 DealerId	numeric(3) not null,
 VIN		varchar2(17) not null,
 SalePrice	numeric(6) not null,
 TagPrice	numeric(6) not null,
 SaleDate	date not null,
 constraint Sale_pk primary key (SaleId),
 constraint Customer_fk foreign key (CustomerId) refrences Customer(CustomerId) ON UPDATE CASCADE ON DELETE RESTRICT,
 constraint Vehicle_fk foreign key (VIN) refrences Vehicle(VIN) ON UPDATE CASCADE ON DELETE RESTRICT);

COMMIT;
