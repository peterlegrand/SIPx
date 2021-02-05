CREATE PROCEDURE [dbo].[usp_ProcessTypeGroupUpdate] (
	@ProcessTypeGroupLanguageId int
	, @ProcessTypeGroupId int
	, @Sequence int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ProcessTypeGroups WHERE ProcessTypeGroupId = @ProcessTypeGroupID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTypeGroups SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence
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
WHERE ProcessTypeGroupLanguageID= @ProcessTypeGroupLanguageID

COMMIT TRANSACTION

