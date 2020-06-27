CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeLanguageCreate] (
	@ProcessTemplateStageTypeID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
INSERT INTO ProcessTemplateStageTypeLanguages (ProcessTemplateStageTypeID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, CreatedDate, ModifierID, ModifiedDate)
VALUES (@ProcessTemplateStageTypeID, @LanguageID, @Name, @Description, @MenuName, @MouseOver, @UserID, getdate(), @UserID, getdate())

