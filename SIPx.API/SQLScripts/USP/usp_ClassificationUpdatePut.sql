CREATE PROCEDURE [dbo].[usp_ClassificationUpdatePut] (
	@ClassificationID int
	, @DefaultPageId int = 0
	, @Name nvarchar(50)
	, @Description nvarchar(MAX)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @DropDownSequence int
	, @HasDropDown bit
	, @LanguageId int
	, @StatusId int
	, @ModifierID nvarchar(45)
	)
AS
BEGIN
BEGIN TRANSACTION
DECLARE @OldDropDownSequence int
SELECT @OldDropDownSequence = DropDownSequence FROM Classifications WHERE ClassificationID = @ClassificationID
IF @OldDropDownSequence > @DropDownSequence
BEGIN
UPDATE Classifications SET DropDownSequence = DropDownSequence + 1 WHERE DropDownSequence < @DropDownSequence AND DropDownSequence >= @DropDownSequence
END
ELSE
BEGIN
UPDATE Classifications SET DropDownSequence = DropDownSequence - 1 WHERE DropDownSequence <= @DropDownSequence AND DropDownSequence > @DropDownSequence
END


UPDATE Classifications SET
	DefaultPageID = @DefaultPageID
	, HasDropDown = @HasDropDown
	, StatusID = @StatusId
	, DropDownSequence = @DropDownSequence
	, ModifierID = @ModifierID
	, ModifiedDate = getdate()
WHERE ClassificationID = @ClassificationID

UPDATE ClassificationLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @ModifierID
	, ModifiedDate = getdate()
WHERE ClassificationID = @ClassificationID
	AND LanguageID = @LanguageId

COMMIT TRANSACTION
END