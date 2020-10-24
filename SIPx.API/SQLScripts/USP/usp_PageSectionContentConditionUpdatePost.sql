CREATE PROCEDURE usp_PageSectionContentConditionUpdatePost (
	 @PageSectionContentConditionId int
	, @PageSectionContentConditionTypeId int
	, @PageSectionContentConditionInt int
	, @PageSectionContentConditionDate datetime
	, @PageSectionContentConditionString nvarchar(max)
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
UPDATE PageSectionContentConditions SET 
	PageSectionContentConditionTypeId = @PageSectionContentConditionTypeID
	, PageSectionContentConditionInt = @PageSectionContentConditionInt 
	, PageSectionContentConditionDate = @PageSectionContentConditionDate 
	, PageSectionContentConditionString = @PageSectionContentConditionString 
	, ModifierId = @UserId
	, ModifiedDate = GETDATE()
WHERE PageSectionContentConditionId = @PageSectionContentConditionID

UPDATE  PageSectionContentConditionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserId
	, ModifiedDate = getdate()
WHERE PageSectionContentConditionID= @PageSectionContentConditionId
	AND LanguageID = @LanguageID
COMMIT TRANSACTION