CREATE PROCEDURE [dbo].[usp_ClassificationLevelUpdate] (
	@ClassificationLevelLanguageId int
	, @ClassificationLevelId int
	, @Sequence int
	, @DateLevelId int
	, @OnTheFly bit
	, @Alphabetically bit
	, @CanLink bit
	, @InDropDown bit
	, @InMenu bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @OldSequence int;
DECLARE @ClassificationId int;
SELECT @OldSequence = Sequence, @ClassificationId = ClassificationId FROM ClassificationLevels WHERE ClassificationLevelId = @ClassificationLevelID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ClassificationLevels SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND @ClassificationId = ClassificationId 
END
ELSE
BEGIN
UPDATE ClassificationLevels SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence AND @ClassificationId = ClassificationId 
END

UPDATE ClassificationLevels SET 
	Sequence = @Sequence
	, DateLevelId = @DateLevelID
	, OnTheFly = @OnTheFly
	, Alphabetically = @Alphabetically
	, CanLink = @CanLink
	, InDropDown = @InDropDown
	, InMenu = @InMenu
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationLevelId = @ClassificationLevelID

UPDATE  ClassificationLevelLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationLevelLanguageID= @ClassificationLevelLanguageID

COMMIT TRANSACTION

