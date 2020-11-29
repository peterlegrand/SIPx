CREATE PROCEDURE [dbo].[usp_PageSectionLanguageCreate] (
	@PageSectionId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
INSERT INTO PageSectionLanguages (PageSectionId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, CreatedDate, ModifierId, ModifiedDate)
VALUES (@PageSectionId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserId, getdate(), @UserId, getdate())

