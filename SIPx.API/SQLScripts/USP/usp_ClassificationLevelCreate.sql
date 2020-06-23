CREATE PROCEDURE [dbo].[usp_ClassificationLevelCreate] (
	@ClassificationID int
	, @Sequence int
	, @DateLevelID int
	, @OnTheFly bit
	, @Alhpabetically bit
	, @CanLink bit
	, @InDropDown bit
	, @InMenu bit
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE ClassificationLevels SET Sequence = Sequence + 1 
WHERE ClassificationID = @ClassificationID 
	AND Sequence >= @Sequence

INSERT INTO ClassificationLevels (
	ClassificationID
	, Sequence
	, DateLevelID
	, OnTheFly
	, Alphabetically
	, CanLink
	, InDropDown
	, InMenu
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ClassificationID
	, @Sequence
	, @DateLevelID
	, @OnTheFly
	, @Alhpabetically
	, @CanLink
	, @InDropDown
	, @InMenu
	, @User
	, getdate()
	, @User
	, getdate())


DECLARE @NewClassificationLevelId int	= scope_identity();

INSERT INTO ClassificationLevelLanguages (
	ClassificationLevelID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewClassificationLevelId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION