CREATE PROCEDURE [dbo].[usp_ClassificationValueUpdatePost] (
	@ClassificationValueId int
	, @DateFrom Datetime
	, @DateTo Datetime
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
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;


BEGIN TRANSACTION
UPDATE ClassificationValues SET 
	 DateFrom = @DateFrom
	, DateTo = @DateTo
	, ModifierId = @UserId
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
	, ModifierId = @UserId
	, ModifiedDate = getdate()
WHERE ClassificationValueID= @ClassificationValueID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION
