CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupUpdate] (
	@ProcessTemplateGroupLanguageID int
	, @ProcessTemplateGroupID int
	, @Sequence int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ProcessTemplateGroups WHERE ProcessTemplateGroupID = @ProcessTemplateGroupID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTemplateGroups SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence
END
ELSE
BEGIN
UPDATE ProcessTemplateGroups SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE ProcessTemplateGroups SET 
	 Sequence = @Sequence
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateGroupID = @ProcessTemplateGroupID

UPDATE  ProcessTemplateGroupLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateGroupLanguageID= @ProcessTemplateGroupLanguageID

COMMIT TRANSACTION

