CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageUpdate] (
	@ProcessTemplateStageID int
	, @ProcessTemplateStageLanguageID int
	, @ProcessTemplateStageTypeID int
	, @IsEndStage bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE ProcessTemplateStages SET
	ProcessTemplateStageTypeID = @ProcessTemplateStageTypeID 
	, IsEndStage = @IsEndStage
	, ModifierID = @User
	, ModifiedDate = Getdate()
WHERE ProcessTemplateStageID = @ProcessTemplateStageID 

UPDATE  ProcessTemplateStageLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE ProcessTemplateStageLanguageID= @ProcessTemplateStageLanguageID
	COMMIT TRANSACTION
