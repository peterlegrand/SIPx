CREATE PROCEDURE [dbo].[usp_ProcessTypeStageUpdate] (
	@ProcessTypeStageId int
	, @ProcessTypeStageLanguageId int
	, @ProcessTypeStageTypeId int
	, @InToDo bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE ProcessTypeStages SET
	ProcessTypeStageTypeId = @ProcessTypeStageTypeId 
	, InToDo = @InToDo
	, ModifierId = @UserID
	, ModifiedDate = Getdate()
WHERE ProcessTypeStageId = @ProcessTypeStageId 

UPDATE  ProcessTypeStageLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTypeStageLanguageID= @ProcessTypeStageLanguageID
	COMMIT TRANSACTION
