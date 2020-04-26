CREATE PROCEDURE [dbo].[usp_AdminClassificationUpdate] (
	@StatusID int
	, @DefaultPageID int
	, @HasDropDown bit
	, @DropDownSequence int
	, @ModifierID NVARCHAR(450)
	, @ClassificationID int
	, @Name  NVARCHAR(50)
	, @Description NVARCHAR(MAX)
	, @MenuName NVARCHAR(50)
	, @MouseOver NVARCHAR(50)
	, @LanguageID int)
AS
BEGIN
BEGIN TRANSACTION
UPDATE Classifications 
SET StatusID = @StatusID
	, DefaultPageID = @DefaultPageID
	, HasDropDown = @HasDropDown
	, DropDownSequence = @DropDownSequence
	, ModifierID = @ModifierID
	, ModifiedDate = GETDATE()
WHERE ClassificationID = @ClassificationID;

UPDATE ClassificationLanguages 
SET Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @ModifierID
	, ModifiedDate = getdate()
WHERE ClassificationID = @ClassificationID
	AND LanguageID = @LanguageID
COMMIT TRANSACTION
END;
