CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowCreate] (
	@ProcessTypeId int
	, @ProcessTypeFromStageId int
	, @ProcessTypeToStageId int
	, @DateLevelId int
	, @OnTheFly bit
	, @Alhpabetically bit
	, @CanLink bit
	, @InDropDown bit
	, @InMenu bit
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO ProcessTypeFlows (
	ProcessTypeID
	, ProcessTypeFromStageID
	, ProcessTypeToStageID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTypeID
	, @ProcessTypeFromStageID
	, @ProcessTypeToStageID
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTypeFlowId int	= scope_identity();

INSERT INTO ProcessTypeFlowLanguages (
	ProcessTypeFlowID
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
	@NewProcessTypeFlowId 
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



