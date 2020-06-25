CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowLanguageUpdate] (
	@ProcessTemplateFlowLanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
UPDATE  ProcessTemplateFlowLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE ProcessTemplateFlowLanguageID= @ProcessTemplateFlowLanguageID
