CREATE PROCEDURE [dbo].[usp_ClassificationLevelUpdate] (
	@ClassificationLevelLanguageID int
	, @ClassificationLevelID int
	, @Sequence int
	, @DateLevelID int
	, @OnTheFly bit
	, @Alphabetically bit
	, @CanLink bit
	, @InDropDown bit
	, @InMenu bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
DECLARE @OldSequence int;
DECLARE @ClassificationID int;
SELECT @OldSequence = Sequence, @ClassificationID = ClassificationID FROM ClassificationLevels WHERE ClassificationLevelID = @ClassificationLevelID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ClassificationLevels SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND @ClassificationID = ClassificationID 
END
ELSE
BEGIN
UPDATE ClassificationLevels SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence AND @ClassificationID = ClassificationID 
END

UPDATE ClassificationLevels SET 
	Sequence = @Sequence
	, DateLevelID = @DateLevelID
	, OnTheFly = @OnTheFly
	, Alphabetically = @Alphabetically
	, CanLink = @CanLink
	, InDropDown = @InDropDown
	, InMenu = @InMenu
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationLevelID = @ClassificationLevelID

UPDATE  ClassificationLevelLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationLevelLanguageID= @ClassificationLevelLanguageID

COMMIT TRANSACTION

