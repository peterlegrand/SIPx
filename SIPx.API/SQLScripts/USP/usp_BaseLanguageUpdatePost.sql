CREATE PROCEDURE usp_BaseLanguageUpdatePost (
	@BaseType varchar(50)
	, @BaseLanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MouseOver nvarchar(50)
	, @MenuName nvarchar(50)
	, @UserId nvarchar(450))
AS
BEGIN
DECLARE @statement NVARCHAR(200);
SET @statement = 'UPDATE ' 
+ @BaseType 
+ 'Languages SET Name = '''+
@Name + ''',Description =''' + 
@Description + ''', MouseOver =''' + 
@MouseOver+ ''', MenuName =''' + 
@MenuName+ ''',ModifierId = ''' + 
@UserId+ ''',ModifiedDate = Getdate() WHERE ' + @BaseType + 'LanguageId = ' +CAST(@BaseLanguageId as varchar(10))

EXECUTE sp_executesql @statement
end

