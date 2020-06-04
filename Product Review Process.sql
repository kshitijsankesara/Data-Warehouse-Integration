/****** Object:  Database ist722_srramach_dw    Script Date: 11/26/2019 5:37:27 PM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
/*
DROP DATABASE ist722_srramach_dw
GO
CREATE DATABASE ist722_srramach_dw
GO
ALTER DATABASE ist722_srramach_dw
SET RECOVERY SIMPLE
GO
*/

/*
Drop table dbo.FactReviews
Drop table dbo.DimFMCustomers
Drop table dbo.DimFMProducts
Drop table dbo.DimFMVendor
*/


USE ist722_srramach_dw
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;

/* Drop table dbo.DimFMCustomers */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimFMCustomers') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimFMCustomers 
;

/* Create table dbo.DimFMCustomers */
CREATE TABLE dbo.DimFMCustomers (
   [CustomerKey]  int IDENTITY  NOT NULL
,  [customer_id]  int   NOT NULL
,  [customer_firstname]  varchar(50)   NOT NULL
,  [customer_lastname]  varchar(50)   NOT NULL
,  [customer_city]  varchar(50)   NOT NULL
,  [customer_state]  char(2)   NOT NULL
,  [customer_zip]  varchar(20)   NOT NULL
,  [RowIsCurrent]  bit   NOT NULL
,  [RowStartDate]  datetime   NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NOT NULL
, CONSTRAINT [PK_dbo.DimFMCustomers] PRIMARY KEY CLUSTERED 
( [CustomerKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimFMCustomers
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimFMCustomers', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimFMCustomers
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Customer Dimensions', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimFMCustomers
;

SET IDENTITY_INSERT dbo.DimFMCustomers ON
;
INSERT INTO dbo.DimFMCustomers (CustomerKey, customer_id, customer_firstname, customer_lastname, customer_city, customer_state, customer_zip, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unknown', 'Unknown', 'Unknown', 'Un', 'Unknown', '1', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimFMCustomers OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Customer ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Customer FirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_firstname'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Customer LastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_lastname'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Customer City', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Customer State', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Customer Zip', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_zip'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer Firstname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_firstname'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer Lastname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_lastname'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer City', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer State', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer Zip', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_zip'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_firstname'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_lastname'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_zip'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_firstname'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_lastname'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_zip'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_firstname'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_lastname'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_zip'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_firstname'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_lastname'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_zip'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_firstname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_firstname'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_lastname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_lastname'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'cutomer_city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_state', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_zip', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_zip'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_firstname'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_lastname'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'char', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMCustomers', @level2type=N'COLUMN', @level2name=N'customer_zip'; 
;





/* Drop table dbo.DimFMProducts */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimFMProducts') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimFMProducts 
;

/* Create table dbo.DimFMProducts */
CREATE TABLE dbo.DimFMProducts (
   [ProductKey]  int IDENTITY  NOT NULL
,  [product_id]  int   NOT NULL
,  [product_department]  varchar(20)   NOT NULL
,  [product_name]  varchar(50)   NOT NULL
,  [product_retail_price]  money   NOT NULL
,  [product_wholesale_price]  money   NOT NULL
,  [product_vendor_id]  int   NOT NULL
,  [product_description]  varchar(1000)   NULL
,  [RowIsCurrent]  bit   NOT NULL
,  [RowStartDate]  datetime   NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NOT NULL
, CONSTRAINT [PK_dbo.DimFMProducts] PRIMARY KEY CLUSTERED 
( [ProductKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimFMProducts
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimFMProducts', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimFMProducts
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Products', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimFMProducts
;

SET IDENTITY_INSERT dbo.DimFMProducts ON
;
INSERT INTO dbo.DimFMProducts (ProductKey, product_id, product_department, product_name, product_retail_price, product_wholesale_price, product_vendor_id, product_description, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unknown', 'Unknown', -1, -1, -1, 'Unknown', '1', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimFMProducts OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_department', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_department'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_retail_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_retail_price'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_wholesale_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_wholesale_price'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_vendor_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_description', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_description'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_department'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_retail_price'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_wholesale_price'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_description'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_department'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_retail_price'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_wholesale_price'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_vendor_id'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_description'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_department'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_retail_price'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_wholesale_price'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_description'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_department'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_name'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_retail_price'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_wholesale_price'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_description'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_department'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_retail_price'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_wholesale_price'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_description'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_department', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_department'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_retail_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_retail_price'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_wholesale_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_wholesale_price'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_vendor_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_description', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_description'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_department'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_retail_price'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_wholesale_price'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMProducts', @level2type=N'COLUMN', @level2name=N'product_description'; 
;





/* Drop table dbo.DimFMVendor */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimFMVendor') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimFMVendor 
;

/* Create table dbo.DimFMVendor */
CREATE TABLE dbo.DimFMVendor (
   [VendorKey]  int IDENTITY  NOT NULL
,  [vendor_id]  int   NOT NULL
,  [vendor_name]  varchar(50)   NOT NULL
,  [RowIsCurrent]  bit   NOT NULL
,  [RowStartDate]  datetime   NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NOT NULL
, CONSTRAINT [PK_dbo.DimFMVendor] PRIMARY KEY CLUSTERED 
( [VendorKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimFMVendor
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimFMVendor', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimFMVendor
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Vendor Details', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimFMVendor
;

SET IDENTITY_INSERT dbo.DimFMVendor ON
;
INSERT INTO dbo.DimFMVendor (VendorKey, vendor_id, vendor_name, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unknown', '1', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimFMVendor OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'VendorKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'VendorKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'vendor_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'vendor_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'VendorKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Always describe your columns', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'VendorKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'VendorKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_id'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'VendorKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_vendors', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_vendors', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'vendor_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'vendor_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimFMVendor', @level2type=N'COLUMN', @level2name=N'vendor_name'; 
;





/* Drop table dbo.FactReviews */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactReviews') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactReviews 
;

/* Create table dbo.FactReviews */
CREATE TABLE dbo.FactReviews (
   [CustomerKey]  int  NOT NULL
,  [ProductKey]  int  NOT NULL
,  [VendorKey]     int  NOT NULL
,  [review_stars]  int   NOT NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactReviews
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactReviews', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactReviews
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Reviews of Product', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactReviews
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'review_stars', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'review_stars'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'FK to DimFMCustomers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'FK to DimFMProducts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Review ratings', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'review_stars'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimFMCustomers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimFMProducts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactReviews', @level2type=N'COLUMN', @level2name=N'product_id'; 
;
ALTER TABLE dbo.FactReviews ADD CONSTRAINT
   FK_dbo_FactReviews_customer_id FOREIGN KEY
   (
   CustomerKey
   ) REFERENCES dbo.DimFMCustomers
   ( CustomerKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactReviews ADD CONSTRAINT
   FK_dbo_FactReviews_product_id FOREIGN KEY
   (
   ProductKey
   ) REFERENCES dbo.DimFMProducts
   ( ProductKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactReviews ADD CONSTRAINT
   FK_dbo_FactReviews_vendor_id FOREIGN KEY
   (
   VendorKey
   ) REFERENCES dbo.DimFMVendor
   ( VendorKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
