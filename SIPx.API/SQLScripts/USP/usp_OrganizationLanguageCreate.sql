CREATE PROCEDURE [dbo].[usp_OrganizationLanguageCreate] (
	@OrganizationID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
INSERT INTO OrganizationLanguages (OrganizationID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, CreatedDate, ModifierID, ModifiedDate)
VALUES (@OrganizationID, @LanguageID, @Name, @Description, @MenuName, @MouseOver, @User, getdate(), @User, getdate())


