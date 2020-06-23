CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeCreate] (
	 @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO ClassificationRelationTypes (
	 CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	 @User
	, getdate()
	, @User
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
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION