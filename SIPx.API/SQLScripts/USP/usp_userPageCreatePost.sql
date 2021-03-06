CREATE PROCEDURE usp_userPageCreatePost (
	@ShowTitleName bit
	, @ShowTitleDescription bit
	, @UserId nvarchar(450)
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	)
AS

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE UserId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO Pages (StatusId, ShowTitleName, ShowTitleDescription, UserId, CreatorId, ModifierId, CreatedDate, ModifiedDate)
VALUES (1,@ShowTitleName, @ShowTitleDescription, @UserId, @UserId, @UserId, getdate(), Getdate())


DECLARE @NewPageId int	= scope_identity();

INSERT INTO PageLanguages (PageId, LanguageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorId, ModifierId, CreatedDate, ModifiedDate )
VALUES (@NewPageId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @UserId, @UserId, getdate(), Getdate() )

COMMIT TRANSACTION