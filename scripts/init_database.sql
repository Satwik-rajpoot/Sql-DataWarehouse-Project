/*
=========================================================================
Create Database and Schemas
=========================================================================
Script Purpose:
		This Script Creates a new Database named 'DataWarehouse' after checking if it already exist.
		if the database exists, it is dropped and recreated.Additionally, the script sets up three schemas 
		within the database : 'bronze' , 'silver' , 'gold'.

Warning:
		Running this script will drop the entire 'DataWarehouse' database if it exists.
		All data in the database will be permanently deleted. Proceed with caution and
		ensure you have proper backups before running this script.
*/
use master;
Go

-- Drop and Recreate the 'DataWarehouse' database
IF exists(select 1 From sys.databases where name = 'DataWarehouse')
Begin
	Alter DATABASE DataWarehouse Set Single_user with rollback immediate;
	drop DATABASE DataWarehouse;
End;
Go

-- Create the DataWarehouse database

Create Database DataWarehouse;
Go

use DataWarehouse;
Go

-- Create Schemas

CREATE SCHEMA bronze;
go
CREATE SCHEMA silver;
go
CREATE SCHEMA gold;
go
