CREATE PROCEDURE usp_CheckIfRecordExists (@TableName varchar(20), @IDField varchar(20), @Id int)
AS
BEGIN
DECLARE @statement NVARCHAR(200);
SET @statement = 'SELECT COUNT(*) NoOfRecords FROM ' + @TableName + ' WHERE ' + @IDField + ' =  ' + CAST(@Id as varchar(10)) 
EXECUTE sp_executesql @statement
END