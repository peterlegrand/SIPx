CREATE PROCEDURE [dbo].[usp_RoleLanguageUpdate] (
	@RoleLanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
UPDATE  RoleLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE RoleLanguageID= @RoleLanguageID