CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageUpdatePost] (
	@ProcessTemplateStageId int
	, @ProcessTemplateStageTypeId int
	, @InToDo bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE ProcessTemplateStages SET
	ProcessTemplateStageTypeId = @ProcessTemplateStageTypeId 
	, InToDo = @InToDo
	, ModifierId = @UserID
	, ModifiedDate = Getdate()
WHERE ProcessTemplateStageId = @ProcessTemplateStageId 

UPDATE  ProcessTemplateStageLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateStageId= @ProcessTemplateStageId
	AND LanguageID = @LanguageId
	COMMIT TRANSACTION
