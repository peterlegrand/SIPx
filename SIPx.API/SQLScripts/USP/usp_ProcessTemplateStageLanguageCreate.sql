CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageLanguageCreate] (
	@ProcessTemplateStageId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
INSERT INTO ProcessTemplateStageLanguages (ProcessTemplateStageId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, CreatedDate, ModifierId, ModifiedDate)
VALUES (@ProcessTemplateStageId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserId, getdate(), @UserId, getdate())

