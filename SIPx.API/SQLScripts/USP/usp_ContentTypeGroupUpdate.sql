CREATE PROCEDURE [dbo].[usp_ContentTypeGroupUpdate] (
	@ContentTypeGroupID int 
	, @ContentTypeGroupLanguageID int 
	, @Sequence int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ContentTypeGroups WHERE ContentTypeGroupID = @ContentTypeGroupID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ContentTypeGroups SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence
END
ELSE
BEGIN
UPDATE ContentTypeGroups SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE ContentTypeGroups SET 
	Sequence = @Sequence
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ContentTypeGroupID = @ContentTypeGroupID

UPDATE  ContentTypeGroupLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ContentTypeGroupLanguageID= @ContentTypeGroupLanguageID
COMMIT TRANSACTION

