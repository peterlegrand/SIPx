CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowCreatePost] (
	@ProcessTypeId int
	, @ProcessTypeFromStageId int
	, @ProcessTypeToStageId int
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

SET XACT_ABORT ON;
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
	, ProcessTypeID
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
	, @ProcessTypeID
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



