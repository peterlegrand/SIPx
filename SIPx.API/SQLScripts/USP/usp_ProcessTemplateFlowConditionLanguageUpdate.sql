CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionLanguageUpdate] (
	@ProcessTemplateFlowConditionLanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
UPDATE  ProcessTemplateFlowConditionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateFlowConditionLanguageID= @ProcessTemplateFlowConditionLanguageID
