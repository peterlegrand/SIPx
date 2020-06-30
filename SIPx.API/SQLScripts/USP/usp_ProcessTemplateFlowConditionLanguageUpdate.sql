CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionLanguageUpdate] (
	@ProcessTemplateFlowConditionLanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
UPDATE  ProcessTemplateFlowConditionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateFlowConditionLanguageID= @ProcessTemplateFlowConditionLanguageID
