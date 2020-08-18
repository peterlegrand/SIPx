CREATE PROCEDURE [dbo].[usp_ClassificationCreatePost] (
	@StatusId bit
	, @HasDropDown bit
	, @DropDownSequence int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @IconId int
	, @Color char(9)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO Classifications (
	StatusID
	, HasDropDown
	, DropDownSequence
	, IconId 
	, Color 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@StatusID
	, @HasDropDown
	, @DropDownSequence
	, @IconId 
	, @Color 
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


