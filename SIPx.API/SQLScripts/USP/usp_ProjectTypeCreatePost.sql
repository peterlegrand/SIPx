CREATE PROCEDURE [dbo].[usp_ProjectTypeCreatePost] (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @Color char(9)
	, @IconID int
	, @CreatorId nvarchar(450)) 
AS 
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
