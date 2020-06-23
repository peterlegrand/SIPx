CREATE PROCEDURE [dbo].[usp_OrganizationTypeLanguageUpdate] (
	@OrganizationTypeLanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
UPDATE  OrganizationTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE OrganizationTypeLanguageID= @OrganizationTypeLanguageID