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
	, @User nvarchar(450)) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ClassificationLevels WHERE ClassificationLevelID = @ClassificationLevelID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ClassificationLevels SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence
END
ELSE
BEGIN
UPDATE ClassificationLevels SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE ClassificationLevels SET 
	Sequence = @Sequence
	, DateLevelID = @DateLevelID
	, OnTheFly = @OnTheFly
	, Alphabetically = @Alphabetically
	, CanLink = @CanLink
	, InDropDown = @InDropDown
	, InMenu = @InMenu
	, ModifierID = @User
	, ModifiedDate = GETDATE()
WHERE ClassificationLevelID = @ClassificationLevelID

UPDATE  ClassificationLevelLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE ClassificationLevelLanguageID= @ClassificationLevelLanguageID

COMMIT TRANSACTION