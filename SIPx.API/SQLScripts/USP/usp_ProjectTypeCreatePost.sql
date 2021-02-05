CREATE PROCEDURE [dbo].[usp_ProjectTypeCreatePost] (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CodePrefix nvarchar(25)=''
	, @CodeSuffix nvarchar(25)=''
	, @CodeTypeId int
	, @ObjectTypeStatusId int
	, @HasAnyChildProject bit
	, @HasAnyMatrixProject bit
	, @Color char(9)
	, @IconID int
	, @UserId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

INSERT INTO ProjectTypes (
	Color 
	, IconID 
	, CodePrefix
	, CodeSuffix
	, CodeTypeId
	, ObjectTypeStatusId 
	, HasAnyChildProject
	, HasAnyMatrixProject
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Color 
	, @IconID 
	, @CodePrefix
	, @CodeSuffix
	, @CodeTypeId
	, @ObjectTypeStatusId 
	, @HasAnyChildProject
	, @HasAnyMatrixProject
	, @UserId
	, getdate()
	, @UserId
	, getdate())


DECLARE @NewProjectTypeId int	= scope_identity();

INSERT INTO ProjectTypeLanguages (
	ProjectTypeID
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
	@NewProjectTypeID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserId
	, getdate()
	, @UserId
	, getdate())

	INSERT INTO ProjectTypeClassifications (ProjectTypeId, ClassificationID, ObjectTypeClassificationStatusID, ModifierID, ModifiedDate)
SELECT @NewProjectTypeID, ClassificationID, 2, @UserId, getDate() FROM Classifications
	

	COMMIT TRANSACTION