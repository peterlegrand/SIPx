CREATE PROCEDURE [dbo].[usp_ClassificationValueUpdate] (
	@ClassificationValueLanguageId int
	, @ClassificationValueId int
	, @ParentValueId int
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
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION
UPDATE ClassificationValues SET 
	ParentValueId = @ParentValueID
	, DateFrom = @DateFrom
	, DateTo = @DateTo
	, Location = @Location
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationValueId = @ClassificationValueID

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
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationValueLanguageID= @ClassificationValueLanguageID

COMMIT TRANSACTION
