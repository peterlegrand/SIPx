CREATE PROCEDURE [dbo].[usp_ProcessTypeFieldUpdatePost] (
	 @ProcessTypeFieldId int
	, @ProcessTypeFieldTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @MissingValueText nvarchar(max)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE ProcessTypeFields SET 
	ProcessTypeFieldTypeId = @ProcessTypeFieldTypeID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTypeFieldId = @ProcessTypeFieldID

UPDATE  ProcessTypeFieldLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, MissingValueText = @MissingValueText
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTypeFieldID= @ProcessTypeFieldID
	AND LanguageID = @LanguageId
COMMIT TRANSACTION


