CREATE PROCEDURE usp_ProcessTemplateGroupUpdatePost (
	
	 @ProcessTemplateGroupId int
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
SELECT @OldSequence = Sequence FROM ProcessTemplateGroups WHERE ProcessTemplateGroupId = @ProcessTemplateGroupID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTemplateGroups SET Sequence = Sequence + 1 WHERE Sequence >= @Sequence AND Sequence < @OldSequence
END
ELSE
BEGIN
UPDATE ProcessTemplateGroups SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE ProcessTemplateGroups SET 
	 Sequence = @Sequence
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateGroupId = @ProcessTemplateGroupID

UPDATE  ProcessTemplateGroupLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateGroupId= @ProcessTemplateGroupId
	AND LanguageID = @LanguageId
COMMIT TRANSACTION

