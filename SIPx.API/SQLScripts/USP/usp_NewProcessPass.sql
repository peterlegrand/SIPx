CREATE PROCEDURE usp_NewProcessPass (
	@SQLStatement nvarchar(max)
)
AS
--SELECT @SQLStatement
EXECUTE sp_executesql @SQLStatement
