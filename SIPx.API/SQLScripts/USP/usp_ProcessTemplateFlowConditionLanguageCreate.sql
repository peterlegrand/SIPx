CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionLanguageCreate] (
	@ProcessTemplateFlowConditionID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
INSERT INTO ProcessTemplateFlowConditionLanguages (ProcessTemplateFlowConditionID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, CreatedDate, ModifierID, ModifiedDate)
VALUES (@ProcessTemplateFlowConditionID, @LanguageID, @Name, @Description, @MenuName, @MouseOver, @UserID, getdate(), @UserID, getdate())

