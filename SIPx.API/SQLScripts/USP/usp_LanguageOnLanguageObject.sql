CREATE PROCEDURE usp_BaseCreatePostCheck (@TableName varchar(50), @LanguageId int, @BaseId int)
AS
BEGIN
DECLARE @statement NVARCHAR(max);
SET @statement = 'SELECT COUNT(*) NoOfRecords FROM ' 
+ @TableName 
+ 'Languages WHERE ' + @TableName + 'ID =  ' + CAST(@BaseId as varchar(10)) + ' AND LanguageID = ' + + CAST(@LanguageId as varchar(10))
EXECUTE sp_executesql @statement
END