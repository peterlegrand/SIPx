CREATE PROCEDURE usp_contentForPanel (@UserId nvarchar(450), @ContentConditionSQLFrom nvarchar(max)
	, @ContentConditionSQLWhere nvarchar(max)
	, @ContentConditionSQLContains nvarchar(max)) 
 
AS

DECLARE @statement NVARCHAR(2200);

SET @statement = TRIM(@ContentConditionSQLFrom) +  
'  ' + TRIM(@ContentConditionSQLWhere) 

EXECUTE sp_executesql @statement

-- ORDER BY Contents.CreatedDate

