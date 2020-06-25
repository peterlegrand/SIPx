CREATE PROCEDURE [dbo].[usp_ProcessTemplateLanguageCreate] (
	@ProcessTemplateID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
INSERT INTO ProcessTemplateLanguages (ProcessTemplateID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, CreatedDate, ModifierID, ModifiedDate)
VALUES (@ProcessTemplateID, @LanguageID, @Name, @Description, @MenuName, @MouseOver, @User, getdate(), @User, getdate())

