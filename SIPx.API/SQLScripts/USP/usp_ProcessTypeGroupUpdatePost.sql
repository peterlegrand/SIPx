CREATE PROCEDURE usp_ProcessTypeGroupUpdatePost (
	
	 @ProcessTypeGroupId int
	, @Sequence int
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


DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ProcessTypeGroups WHERE ProcessTypeGroupId = @ProcessTypeGroupID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTypeGroups SET Sequence = Sequence + 1 WHERE Sequence >= @Sequence AND Sequence < @OldSequence
END
ELSE
BEGIN
UPDATE ProcessTypeGroups SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE ProcessTypeGroups SET 
	 Sequence = @Sequence
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTypeGroupId = @ProcessTypeGroupID

UPDATE  ProcessTypeGroupLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTypeGroupId= @ProcessTypeGroupId
	AND LanguageID = @LanguageId
COMMIT TRANSACTION

