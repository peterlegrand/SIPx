CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionLanguageCreate] (
	@ProcessTemplateFlowConditionId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
INSERT INTO ProcessTemplateFlowConditionLanguages (ProcessTemplateFlowConditionId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, CreatedDate, ModifierId, ModifiedDate)
VALUES (@ProcessTemplateFlowConditionId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserId, getdate(), @UserId, getdate())

