CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowCreatePost] (
	@ProcessTemplateId int
	, @ProcessTemplateFromStageId int
	, @ProcessTemplateToStageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN TRANSACTION

INSERT INTO ProcessTemplateFlows (
	ProcessTemplateID
	, ProcessTemplateFromStageID
	, ProcessTemplateToStageID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTemplateID
	, @ProcessTemplateFromStageID
	, @ProcessTemplateToStageID
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTemplateFlowId int	= scope_identity();

INSERT INTO ProcessTemplateFlowLanguages (
	ProcessTemplateFlowID
	, ProcessTemplateID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewProcessTemplateFlowId 
	, @ProcessTemplateID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserId
	, getdate()
	, @UserId
	, getdate())

	COMMIT TRANSACTION



