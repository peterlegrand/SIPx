CREATE PROCEDURE usp_ObjectLanguageCreate (
	@TableName varchar(50)
	, @ObjecTId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450))
AS
BEGIN
DECLARE @statement NVARCHAR(max);
SET @statement = 'INSERT INTO ' + @TableName + 'Languages ( ' + @TableName + 'ID , LanguageID, Name, Description, MenuName, MouseOver, CreatorId, CreatedDate, ModifierId, ModifiedDate)' +
' Values(' + CAST(@ObjectId as varchar(10))+ ', '+ CAST(@LanguageId as varchar(10))
+ ', '''+ @Name
+ ''', '''+ @Description
+ ''', '''+ @MenuName
+ ''', '''+ @MouseOver
+ ''', '''+ @UserId
+ ''', '''+ CAST(getdate() as varchar(20))
+ ''', '''+ @UserId
+ ''', '''+ CAST(getdate() as varchar(20))
+ ''') '
--SELECT @statement
EXECUTE sp_executesql @statement
END