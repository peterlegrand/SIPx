CREATE PROCEDURE usp_CheckIfRecordExists (@TableName varchar(50), @IDField varchar(50), @Id int)
AS
BEGIN
DECLARE @statement NVARCHAR(max);
SET @statement = 'SELECT COUNT(*) NoOfRecords FROM ' + @TableName + ' WHERE ' + @IDField + ' =  ' + CAST(@Id as varchar(10)) 
EXECUTE sp_executesql @statement
END