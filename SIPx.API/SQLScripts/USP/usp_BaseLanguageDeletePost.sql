CREATE PROCEDURE usp_BaseLanguageDeletePost (
	@BaseType varchar(50)
	, @BaseLanguageId int
	, @UserId nvarchar(450))
AS

BEGIN
DECLARE @statement NVARCHAR(max);
SET @statement = 'DELETE FROM ' +
@BaseType + 'Languages ' +
' WHERE ' +@BaseType + 'LanguageId = ' + 
CAST(@BaseLanguageId as varchar(10)) 
--select @statement
EXECUTE sp_executesql @statement
end

