CREATE PROCEDURE [dbo].[usp_RoleGroupLanguageUpdate] (
	@RoleGroupLanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
UPDATE  RoleGroupLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE RoleGroupLanguageID= @RoleGroupLanguageID
