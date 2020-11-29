CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowLanguageCreate] (
	@ProcessTemplateFlowId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
INSERT INTO ProcessTemplateFlowLanguages (ProcessTemplateFlowId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, CreatedDate, ModifierId, ModifiedDate)
VALUES (@ProcessTemplateFlowId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserId, getdate(), @UserId, getdate())

