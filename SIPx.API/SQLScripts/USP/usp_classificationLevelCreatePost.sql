CREATE PROCEDURE [dbo].[usp_classificationLevelCreatePost] (
	@ClassificationId int
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

SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE ClassificationLevels SET Sequence = Sequence + 1 
WHERE ClassificationId = @ClassificationId 
	AND Sequence >= @Sequence

INSERT INTO ClassificationLevels (
	ClassificationId 
	, Sequence 
	, DateLevelId 
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
	@ClassificationId 
	, @Sequence 
	, @DateLevelId 
	, @OnTheFly 
	, @Alphabetically 
	, @CanLink 
	, @InDropDown 
	, @InMenu 
	, @UserId  
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewClassificationLevelId int	= scope_identity();

INSERT INTO ClassificationLevelLanguages (
	ClassificationLevelID
	, ClassificationID
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
	, @ClassificationId
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


