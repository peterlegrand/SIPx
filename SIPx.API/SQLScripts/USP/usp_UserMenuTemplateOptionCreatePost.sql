CREATE PROCEDURE [dbo].[usp_UserMenuTemplateOptionCreatePost] (
	@UserMenuTemplateId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserPageIdLeft int
	, @UserPageIdRight int
	, @UserMenuTypeIDLeft int
	, @UserMenuTypeIDRight int
	, @IconId int
	, @Sequence int
	, @CreatorId nvarchar(450)) 

AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorID
	AND UserPreferences.PreferenceTypeId = 1 ;
SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE UserMenuTemplateOptions SET Sequence = Sequence + 1 
WHERE UserMenuTemplateId = @UserMenuTemplateId
	AND Sequence >= @Sequence


INSERT INTO UserMenuTemplateOptions (
	UserMenuTemplateId
	, UserPageIdLeft
	, UserPageIdRight
	, UserMenuTypeIDLeft
	, UserMenuTypeIDRight
	, IconId
	, Sequence
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@UserMenuTemplateId
	, @UserPageIdLeft
	, @UserPageIdRight
	, @UserMenuTypeIDLeft
	, @UserMenuTypeIDRight
	, @IconId
	, @Sequence
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


DECLARE @NewUserMenuTemplateOptionId int	= scope_identity();

INSERT INTO UserMenuTemplateOptionLanguages (
	UserMenuTemplateOptionID
	, UserMenuTemplateId
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
	@NewUserMenuTemplateOptionId 
	, @UserMenuTemplateId
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


