CREATE PROCEDURE [dbo].[usp_ClassificationLevelUpdatePost] (
	@ClassificationLevelId int
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
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
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ClassificationId int;
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence, @ClassificationId = ClassificationId FROM ClassificationLevels WHERE ClassificationLevelId = @ClassificationLevelID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ClassificationLevels SET Sequence = Sequence + 1 WHERE Sequence >= @Sequence AND Sequence < @OldSequence AND @ClassificationId = ClassificationId 
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
WHERE ClassificationLevelID= @ClassificationLevelID
	AND LanguageId = @LanguageId

COMMIT TRANSACTION

