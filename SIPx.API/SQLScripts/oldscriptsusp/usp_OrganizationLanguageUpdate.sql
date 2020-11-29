CREATE PROCEDURE [dbo].[usp_OrganizationLanguageUpdate] (
	@OrganizationLanguageId int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

UPDATE  OrganizationLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE OrganizationLanguageID= @OrganizationLanguageID

