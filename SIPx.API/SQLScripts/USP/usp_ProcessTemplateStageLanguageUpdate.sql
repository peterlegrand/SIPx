CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageLanguageUpdate] (
	@ProcessTemplateStageLanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
UPDATE  ProcessTemplateStageLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateStageLanguageID= @ProcessTemplateStageLanguageID
