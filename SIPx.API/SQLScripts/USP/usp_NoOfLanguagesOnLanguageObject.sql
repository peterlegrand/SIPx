CREATE PROCEDURE usp_NoOfLanguagesOnLanguageObject (@TableName varchar(50), @LanguageId int, @Id int)
AS
BEGIN
DECLARE @statement NVARCHAR(200);
SET @statement = 'SELECT COUNT(*) NoOfRecords FROM ' + @TableName + 'Languages WHERE ' + @TableName + 'ID =  ' + CAST(@Id as varchar(10)) + ' AND LanguageID = ' + + CAST(@LanguageId as varchar(10))
EXECUTE sp_executesql @statement
END