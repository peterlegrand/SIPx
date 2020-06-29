CREATE PROCEDURE [dbo].[usp_ClassificationCreate] (
	@StatusID bit
	, @HasDropDown bit
	, @DropDownSequence int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO Classifications (
	StatusID
	, HasDropDown
	, DropDownSequence
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@StatusID
	, @HasDropDown
	, @DropDownSequence
	, @UserID
	, getdate()
	, @UserID
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
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION


