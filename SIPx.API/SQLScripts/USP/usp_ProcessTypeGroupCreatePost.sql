CREATE PROCEDURE [dbo].[usp_ProcessTypeGroupCreatePost] (
	@Sequence int	
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE ProcessTypeGroups SET Sequence = Sequence + 1 
WHERE Sequence >= @Sequence

INSERT INTO ProcessTypeGroups (
	Sequence
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Sequence
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTypeGroupId int	= scope_identity();

INSERT INTO ProcessTypeGroupLanguages (
	ProcessTypeGroupID
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
	@NewProcessTypeGroupId 
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


