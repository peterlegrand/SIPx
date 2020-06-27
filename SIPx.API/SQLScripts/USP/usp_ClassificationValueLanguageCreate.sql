CREATE PROCEDURE [dbo].[usp_ClassificationValueLanguageCreate] (
	@ClassificationValueID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @DropDownName nvarchar(50)
	, @PageName nvarchar(50)
	, @PageDescription nvarchar(max)
	, @HeaderName nvarchar(50)
	, @HeaderDescription nvarchar(max)
	, @TopicName nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
INSERT INTO ClassificationValueLanguages (
	ClassificationValueID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, PageName
	, PageDescription
	, HeaderName
	, HeaderDescription
	, TopicName
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ClassificationValueID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @PageName
	, @PageDescription
	, @HeaderName
	, @HeaderName
	, @TopicName
	, @UserID
	, getdate()
	, @UserID
	, getdate())


