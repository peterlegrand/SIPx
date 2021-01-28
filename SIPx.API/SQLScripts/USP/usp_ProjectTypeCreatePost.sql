CREATE PROCEDURE [dbo].[usp_ProjectTypeCreatePost] (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @Color char(9)
	, @IconID int
	, @UserId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorId
	AND UserPreferences.PreferenceTypeId = 1 ;

INSERT INTO ProjectTypes (
	Color 
	, IconID 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Color 
	, @IconID 
	, @CreatorId
	, getdate()
	, @CreatorId
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
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())

	COMMIT TRANSACTION
