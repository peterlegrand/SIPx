CREATE PROCEDURE [dbo].[usp_PageLanguageCreate] (
	@PageID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
INSERT INTO PageLanguages (PageID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, CreatedDate, ModifierID, ModifiedDate)
VALUES (@PageID, @LanguageID, @Name, @Description, @MenuName, @MouseOver, @UserID, getdate(), @UserID, getdate())

