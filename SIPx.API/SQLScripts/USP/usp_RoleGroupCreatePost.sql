CREATE PROCEDURE [dbo].[usp_RoleGroupCreatePost] (
	@Sequence int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CreatorId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE RoleGroups SET Sequence = Sequence + 1 
	WHERE Sequence >= @Sequence

INSERT INTO RoleGroups (
	Sequence
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Sequence
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


DECLARE @NewRoleGroupId int	= scope_identity();

INSERT INTO RoleGroupLanguages (
	RoleGroupId
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
	@NewRoleGroupId 
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
