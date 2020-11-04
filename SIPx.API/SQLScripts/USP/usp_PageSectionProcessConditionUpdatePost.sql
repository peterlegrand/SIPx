CREATE PROCEDURE usp_PageSectionProcessConditionUpdatePost (
	 @PageSectionProcessConditionId int
	, @PageSectionProcessConditionTypeId int
	, @PageSectionProcessConditionInt int
	, @PageSectionProcessConditionDate datetime
	, @PageSectionProcessConditionString nvarchar(max) = null
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
UPDATE PageSectionProcessConditions SET 
	PageSectionProcessConditionTypeId = @PageSectionProcessConditionTypeID
	, PageSectionProcessConditionInt = @PageSectionProcessConditionInt 
	, PageSectionProcessConditionDate = @PageSectionProcessConditionDate 
	, PageSectionProcessConditionString = @PageSectionProcessConditionString 
	, ModifierId = @UserId
	, ModifiedDate = GETDATE()
WHERE PageSectionProcessConditionId = @PageSectionProcessConditionID

UPDATE  PageSectionProcessConditionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserId
	, ModifiedDate = getdate()
WHERE PageSectionProcessConditionID= @PageSectionProcessConditionId
	AND LanguageID = @LanguageID
COMMIT TRANSACTION