IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'nservicebus')
  BEGIN
    CREATE DATABASE [nservicebus]
  END
  GO

IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'nservicebus1')
  BEGIN
    CREATE DATABASE [nservicebus1]
  END
  GO

IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'nservicebus2')
  BEGIN
    CREATE DATABASE [nservicebus2]
  END
  GO

USE nservicebus;
go

CREATE SCHEMA receiver AUTHORIZATION db_owner;
go

CREATE SCHEMA sender AUTHORIZATION db_owner;
go

CREATE SCHEMA db@ AUTHORIZATION db_owner;
go
