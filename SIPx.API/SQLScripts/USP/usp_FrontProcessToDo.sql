CREATE PROCEDURE usp_FrontProcessToDo (
	@SQLStatement nvarchar(max)
)
AS
--SELECT @SQLStatement
EXECUTE sp_executesql @SQLStatement
