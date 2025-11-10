/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
Create or Alter procedure bronze.load_bronze as
BEGIN
	Declare @start_time Datetime , @end_time Datetime;
	Begin Try
	print'=========================================';
	print'Loading Bronze Layer';
	print'========================================='; 

	print'------------------------------------------';
	print'Loading CRM Tables';
	print'------------------------------------------';
	Set @start_time = Getdate();
	print'>>Truncating Table: bronze.crm_cust_info';
	Truncate Table bronze.crm_cust_info;

	print'>>Inserting Data into: bronze.crm_cust_info';
	Bulk insert bronze.crm_cust_info
	from 'C:\Users\LENOVO\Desktop\sql project folder\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	Set @end_time = Getdate();
	print '>>Load Duration: ' + Cast (Datediff(second,@start_time,@end_time)as Nvarchar) +'seconds';
	print'-----------------------------';
    
	print'>>Truncating Table: bronze.crm_prd_info';
	Truncate Table bronze.crm_prd_info;
	print'>>Inserting Data into: bronze.crm_prd_info';
	Bulk insert bronze.crm_prd_info
	from 'C:\Users\LENOVO\Desktop\sql project folder\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with (
		FIRSTROW = 2,
		Fieldterminator = ',',
		tablock
	);
	Set @end_time = Getdate();
	print '>>Load Duration: ' + Cast( Datediff(second,@start_time,@end_time)as Nvarchar) +'seconds';
	print'-----------------------------';
	Set @start_time = Getdate();
	print'>>Truncating Table: bronze.crm_sales_details';
	Truncate Table bronze.crm_sales_details;
	print'>>Inserting Data into: bronze.crm_sales_details';
	Bulk insert bronze.crm_sales_details
	from 'C:\Users\LENOVO\Desktop\sql project folder\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with (
		FIRSTROW = 2,
		Fieldterminator = ',',
		tablock
	);
	Set @end_time = Getdate();
	print '>>Load Duration: ' + Cast( Datediff(second,@start_time,@end_time)as Nvarchar) +'seconds';
	print'-----------------------------';
	print'------------------------------------------';
	print'Loading ERP Tables';
	print'------------------------------------------';
	Set @start_time = Getdate();
	print'>>Truncating Table: bronze.erp_cust_az12';
	Truncate Table bronze.erp_cust_az12;
	print'>>Inserting Data into: bronze.erp_cust_az12';
	Bulk insert bronze.erp_cust_az12
	from 'C:\Users\LENOVO\Desktop\sql project folder\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	with (
		FIRSTROW = 2,
		Fieldterminator = ',',
		tablock
	);
	Set @end_time = Getdate();
	print '>>Load Duration: ' + Cast( Datediff(second,@start_time,@end_time)as Nvarchar) +'seconds';
	print'-----------------------------';
	Set @start_time = Getdate();
	print'>>Truncating Table: bronze.erp_loc_101';
	Truncate Table bronze.erp_loc_101;
	print'>>Inserting Data into: bronze.erp_loc_101';
	Bulk insert bronze.erp_loc_101
	from 'C:\Users\LENOVO\Desktop\sql project folder\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	with (
		FIRSTROW = 2,
		Fieldterminator = ',',
		tablock
	);
	Set @end_time = Getdate();
	print '>>Load Duration: ' + Cast( Datediff(second,@start_time,@end_time)as Nvarchar) +'seconds';
	print'-----------------------------';
	Set @start_time = Getdate();
	print'>>Truncating Table: bronze.erp_px_cat_g1v2';
	Truncate Table bronze.erp_px_cat_g1v2;
	print'>>Inserting Data into: bronze.erp_px_cat_g1v2';
	Bulk insert bronze.erp_px_cat_g1v2
	from 'C:\Users\LENOVO\Desktop\sql project folder\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	with (
		FIRSTROW = 2,
		Fieldterminator = ',',
		tablock 
	);
	Set @end_time = Getdate();
	print '>>Load Duration: ' + Cast( Datediff(second,@start_time,@end_time)as Nvarchar) +'seconds';
	print'-----------------------------';
	End try
	Begin Catch
	End catch
	print'====================================='
	print 'Error message'+Error_message();
	print 'Error message'+ Cast (error_number() as nvarchar);
	print 'Error message'+ Cast (error_state() as nvarchar); 
END
