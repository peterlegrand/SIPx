CREATE PROCEDURE [dbo].[usp_ProjectLanguageCreate] (
	@ProjectID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
INSERT INTO ProjectLanguages (ProjectID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, CreatedDate, ModifierID, ModifiedDate)
VALUES (@ProjectID, @LanguageID, @Name, @Description, @MenuName, @MouseOver, @UserID, getdate(), @UserID, getdate())

