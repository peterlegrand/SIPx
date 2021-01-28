CREATE PROCEDURE usp_BaseTypeToTable (@BaseType varchar(100))
AS
SELECT TableName FROM DataDictionaryTables WHERE BaseType = @BaseType