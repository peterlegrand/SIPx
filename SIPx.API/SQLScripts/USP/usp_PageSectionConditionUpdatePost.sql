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
	, @User nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @User
	AND UserPreferences.PreferenceTypeId = 1 ;
UPDATE PageSectionConditions SET 
	PageSectionConditionTypeId = @PageSectionConditionTypeID
	, PageSectionConditionInt = @PageSectionConditionInt 
	, PageSectionConditionDate = @PageSectionConditionDate 
	, PageSectionConditionString = @PageSectionConditionString 
	, ModifierId = @User
	, ModifiedDate = GETDATE()
WHERE PageSectionConditionId = @PageSectionConditionID

UPDATE  PageSectionConditionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @User
	, ModifiedDate = getdate()
WHERE PageSectionConditionID= @PageSectionConditionId
	AND LanguageID = @LanguageID
COMMIT TRANSACTION