CREATE PROCEDURE [dbo].[usp_ClassificationLevelCreate] (
	@ClassificationId int
	, @Sequence int
	, @DateLevelId int
	, @OnTheFly bit
	, @Alhpabetically bit
	, @CanLink bit
	, @InDropDown bit
	, @InMenu bit
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE ClassificationLevels SET Sequence = Sequence + 1 
WHERE ClassificationId = @ClassificationId 
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
	, @UserID
	, getdate()
	, @UserID
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
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION