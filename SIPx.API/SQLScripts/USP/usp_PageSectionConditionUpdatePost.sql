CREATE PROCEDURE usp_PageSectionConditionUpdatePost (
	 @PageSectionConditionId int
	, @PageSectionConditionTypeId int
	, @PageSectionConditionInt int
	, @PageSectionConditionDate datetime
	, @PageSectionConditionString nvarchar(max)
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;
BEGIN TRANSACTION
UPDATE PageSectionConditions SET 
	PageSectionConditionTypeId = @PageSectionConditionTypeID
	, PageSectionConditionInt = @PageSectionConditionInt 
	, PageSectionConditionDate = @PageSectionConditionDate 
	, PageSectionConditionString = @PageSectionConditionString 
	, ModifierId = @UserId
	, ModifiedDate = GETDATE()
WHERE PageSectionConditionId = @PageSectionConditionID

UPDATE  PageSectionConditionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserId
	, ModifiedDate = getdate()
WHERE PageSectionConditionID= @PageSectionConditionId
	AND LanguageID = @LanguageID
COMMIT TRANSACTION