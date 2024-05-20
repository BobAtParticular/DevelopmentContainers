CREATE DATABASE nservicebus1;
go

CREATE DATABASE nservicebus2;
go

CREATE DATABASE nservicebus;
go

USE nservicebus;
go

CREATE SCHEMA receiver AUTHORIZATION db_owner;
go

CREATE SCHEMA sender AUTHORIZATION db_owner;
go

CREATE SCHEMA db@ AUTHORIZATION db_owner;
go
