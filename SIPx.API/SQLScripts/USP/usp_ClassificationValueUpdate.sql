CREATE PROCEDURE [dbo].[usp_ClassificationValueUpdate] (
	@ClassificationValueLanguageID int
	, @ClassificationValueID int
	, @ParentValueID int
	, @DateFrom Datetime
	, @DateTo Datetime
	, @Location Geography
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
BEGIN TRANSACTION
UPDATE ClassificationValues SET 
	ParentValueID = @ParentValueID
	, DateFrom = @DateFrom
	, DateTo = @DateTo
	, Location = @Location
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationValueID = @ClassificationValueID

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
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationValueLanguageID= @ClassificationValueLanguageID

COMMIT TRANSACTION
