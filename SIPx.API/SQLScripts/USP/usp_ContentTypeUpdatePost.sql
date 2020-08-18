CREATE PROCEDURE [dbo].[usp_ContentTypeUpdatePost] (
	 @ContentTypeId int
	, @ContentTypeGroupId int
	, @ProcessTemplateId int
	, @SecurityLevelId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)
)

AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN TRANSACTION
UPDATE ContentTypes SET 
	ContentTypeGroupID= @ContentTypeGroupID
	, ProcessTemplateId = @ProcessTemplateID
	, SecurityLevelId = @SecurityLevelID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ContentTypeId = @ContentTypeID

UPDATE  ContentTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ContentTypeID= @ContentTypeID	
	AND LanguageID = @LanguageID


COMMIT TRANSACTION




