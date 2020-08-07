CREATE PROCEDURE [dbo].[usp_UserMenuTemplateCreatePost] (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CreatorId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorID
	AND UserPreferences.PreferenceTypeId = 1 ;
BEGIN TRANSACTION

INSERT INTO UserMenuTemplates (
 CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
 @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


DECLARE @NewUserMenuTemplateId int	= scope_identity();

INSERT INTO UserMenuTemplateLanguages (
	UserMenuTemplateID
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
	@NewUserMenuTemplateId 
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


