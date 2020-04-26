CREATE PROCEDURE [dbo].[usp_ClassificationCreatePost] (
	@CreatorId nvarchar(450)
	, @DefaultPageId int = 0
	, @Name nvarchar(50)
	, @Description nvarchar(MAX)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @DropDownSequence int
	, @HasDropDown bit
	, @LanguageId int
	, @StatusId int
	)
AS
BEGIN
BEGIN TRANSACTION

UPDATE Classifications SET DropDownSequence = DropDownSequence + 1 WHERE DropDownSequence >= @DropDownSequence 

INSERT INTO Classifications (
	StatusID
	, DefaultPageID
	, HasDropDown
	, DropDownSequence
	, CreatorID
	, ModifierID
	, ModifiedDate
	, CreatedDate)
VALUES (
	@StatusId
	, @DefaultPageId
	, @HasDropDown
	, @DropDownSequence
	, @CreatorId
	, @CreatorId
	, getdate()
	, getdate()
	);

DECLARE @NewClassificationID int	= scope_identity();

INSERT INTO ClassificationLanguages (
	ClassificationID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, ModifierID
	, ModifiedDate
	, CreatedDate)
VALUES (
	@NewClassificationID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @CreatorID
	, @CreatorId
	, getdate()
	, getdate()
)
COMMIT TRANSACTION
END
