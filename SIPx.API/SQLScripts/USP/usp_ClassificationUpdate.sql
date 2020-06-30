CREATE PROCEDURE [dbo].[usp_ClassificationUpdate] (
	@ClassificationLanguageId int
	, @StatusId int
	, @DefaultPageId int
	, @HasDropDown bit
	, @DropDownSequence int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @OldSequence int;
DECLARE @ClassificationId int;
SELECT @OldSequence = DropDownSequence, @ClassificationId = Classifications.ClassificationId FROM ClassificationLanguages JOIN Classifications ON ClassificationLanguages.ClassificationId = Classifications.ClassificationId  WHERE ClassificationLanguageID= @ClassificationLanguageID;
BEGIN TRANSACTION
IF @OldSequence > @DropDownSequence
BEGIN
UPDATE Classifications SET DropDownSequence = DropDownSequence + 1 WHERE DropDownSequence < @DropDownSequence AND DropDownSequence >= @OldSequence
END
ELSE
BEGIN
UPDATE Classifications SET DropDownSequence = DropDownSequence - 1 WHERE DropDownSequence <= @DropDownSequence AND DropDownSequence > @OldSequence
END

UPDATE Classifications SET 
	StatusId = @StatusID
	, DefaultPageId = @DefaultPageID
	, HasDropDown = @HasDropDown
	, DropDownSequence = @DropDownSequence
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationId = @ClassificationID

UPDATE  ClassificationLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationLanguageID= @ClassificationLanguageID

COMMIT TRANSACTION


