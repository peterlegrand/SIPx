CREATE PROCEDURE [dbo].[usp_ProcessTypeFieldCreate] (
	@ProcessTypeId int
	, @ProcessTypeFieldTypeId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ProcessTypeFields (
	ProcessTypeID
	, ProcessTypeFieldTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTypeID
	, @ProcessTypeFieldTypeID
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTypeFieldId int	= scope_identity();

INSERT INTO ProcessTypeFieldLanguages (
	ProcessTypeFieldID
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
	@NewProcessTypeFieldId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION


