CREATE PROCEDURE usp_CheckIfRecordExistsString (@TableName varchar(50), @IDField varchar(50), @Id nvarchar(max))
AS
BEGIN
DECLARE @statement NVARCHAR(200);
SET @statement = 'SELECT COUNT(*) NoOfRecords FROM ' + @TableName + ' WHERE ' + @IDField + ' =  ''' + @Id  +'''' 
EXECUTE sp_executesql @statement
END