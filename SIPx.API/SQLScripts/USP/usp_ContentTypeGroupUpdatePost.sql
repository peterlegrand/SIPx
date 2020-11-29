CREATE PROCEDURE usp_ContentTypeGroupUpdatePost (
	@ContentTypeGroupId int 
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
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ContentTypeGroups WHERE ContentTypeGroupId = @ContentTypeGroupID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ContentTypeGroups SET Sequence = Sequence + 1 WHERE Sequence >= @Sequence AND Sequence < @OldSequence
END
ELSE
BEGIN
UPDATE ContentTypeGroups SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE ContentTypeGroups SET 
	Sequence = @Sequence
	, ModifierId = @UserId
	, ModifiedDate = GETDATE()
WHERE ContentTypeGroupId = @ContentTypeGroupID

UPDATE  ContentTypeGroupLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserId
	, ModifiedDate = getdate()
WHERE ContentTypeGroupID= @ContentTypeGroupID
	AND LanguageID = @LanguageID
COMMIT TRANSACTION

