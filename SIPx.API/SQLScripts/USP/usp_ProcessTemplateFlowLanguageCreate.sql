CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowLanguageCreate] (
	@ProcessTemplateFlowID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
INSERT INTO ProcessTemplateFlowLanguages (ProcessTemplateFlowID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, CreatedDate, ModifierID, ModifiedDate)
VALUES (@ProcessTemplateFlowID, @LanguageID, @Name, @Description, @MenuName, @MouseOver, @UserID, getdate(), @UserID, getdate())

