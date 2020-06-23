CREATE PROCEDURE [dbo].[usp_PageCreate] (
	@ShowTitleName bit
	, @ShowTitleDescription bit
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @User nvarchar(450)) 
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
	, @User
	, getdate()
	, @User
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
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION
