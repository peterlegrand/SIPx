CREATE PROCEDURE usp_BaseLanguageCreatePost (
	@BaseType varchar(50)
	, @BaseId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MouseOver nvarchar(50)
	, @MenuName nvarchar(50)
	, @UserId nvarchar(450))
AS
BEGIN
DECLARE @statement NVARCHAR(max);
SET @statement = 'INSERT INTO ' 
+ @BaseType 
+ 'Languages ( ' + @BaseType + 'ID , LanguageId, Name, Description, MouseOver, MenuName, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES(' + CAST(@BaseId as varchar(10)) + ', ' + + CAST(@LanguageId as varchar(10)) + ',''' + 
@Name + ''',''' + 
@Description + ''',''' + 
@MouseOver+ ''',''' + 
@MenuName+ ''',''' + 
@UserId+ ''',''' + 
@UserId+ ''',Getdate(), Getdate() )' 

--SELECT @statement
EXECUTE sp_executesql @statement
end

