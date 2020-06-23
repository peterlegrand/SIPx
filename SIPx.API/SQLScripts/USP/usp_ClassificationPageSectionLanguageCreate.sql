CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionLanguageCreate] (
	@ClassificationPageSectionID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @User nvarchar(450)) 
AS 
INSERT INTO ClassificationPageSectionLanguages (
	ClassificationPageSectionID
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
	@ClassificationPageSectionID
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

