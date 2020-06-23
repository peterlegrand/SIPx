CREATE PROCEDURE [dbo].[usp_ClassificationValueLanguageUpdate] (
	@ClassificationValueLanguageID int
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
	, @User nvarchar(450)) 
AS 
UPDATE  ClassificationValueLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, DropDownName = @DropDownName
	, PageName = @PageName
	, PageDescription = @PageDescription
	, HeaderName = @HeaderName
	, HeaderDescription = @HeaderDescription
	, TopicName = @TopicName
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE ClassificationValueLanguageID= @ClassificationValueLanguageID
