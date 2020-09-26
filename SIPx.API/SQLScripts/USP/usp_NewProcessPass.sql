ALTER PROCEDURE usp_NewProcessPass (
	@UserId nvarchar(450)
	, @SQLStatement varchar(max)
)
AS
SELECT @SQLStatement
--EXECUTE sp_executesql @statement
