CREATE PROCEDURE [dbo].[usp_PageCreatePost] (
	@ShowTitleName bit
	, @ShowTitleDescription bit
	, @StatusId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN TRANSACTION

INSERT INTO Pages (
	ShowTitleName
	, ShowTitleDescription
	, StatusId
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ShowTitleName
	, @ShowTitleDescription
	, @StatusId
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewPageId int	= scope_identity();

INSERT INTO PageLanguages (
	PageID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, TitleName
	, TitleDescription
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewPageId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @TitleName
	, @TitleDescription
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION
