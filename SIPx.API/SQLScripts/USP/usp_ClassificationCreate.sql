CREATE PROCEDURE [dbo].[usp_ClassificationCreate] (
	@StatusID bit
	, @DefaultPageID int = 0
	, @HasDropDown bit
	, @DropDownSequence int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO Classifications (
	StatusID
	, DefaultPageID
	, HasDropDown
	, DropDownSequence
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@StatusID
	, @DefaultPageID
	, @HasDropDown
	, @DropDownSequence
	, @User
	, getdate()
	, @User
	, getdate())


DECLARE @NewClassificationId int	= scope_identity();

INSERT INTO ClassificationLanguages (
	ClassificationID
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
	@NewClassificationId 
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


