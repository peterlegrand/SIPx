CREATE PROCEDURE [dbo].[usp_PageCreate] (
	@ShowTitleName bit
	, @ShowTitleDescription bit
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO Pages (
	ShowTitleName
	, ShowTitleDescription
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ShowTitleName
	, @ShowTitleDescription
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
