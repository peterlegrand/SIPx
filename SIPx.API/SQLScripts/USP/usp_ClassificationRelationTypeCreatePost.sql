CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeCreatePost] (
	 @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO ClassificationRelationTypes (
	 CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	 @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewClassificationRelationTypeId int	= scope_identity();

INSERT INTO ClassificationRelationTypeLanguages (
	ClassificationRelationTypeID
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
	@NewClassificationRelationTypeId 
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