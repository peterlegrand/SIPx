CREATE PROCEDURE usp_PageSectionConditionCreatePost (
	@PageSectionId int
	, @PageSectionConditionTypeId int
	, @PageSectionConditionInt int = null
	, @PageSectionConditionString nvarchar(max)
	, @PageSectionConditionDate datetime
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
DECLARE @PageId int;
SELECT @PageId = PageId FROM PageSections WHERE PageSectionId = @PageSectionId;
BEGIN TRANSACTION

INSERT INTO PageSectionConditions (
	PageSectionID
	, PageID
	, PageSectionConditionTypeID
	, PageSectionConditionInt 
	, PageSectionConditionString 
	, PageSectionConditionDate 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@PageSectionID
	, @PageID
	, @PageSectionConditionTypeID
	, @PageSectionConditionInt 
	, @PageSectionConditionString 
	, @PageSectionConditionDate 
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewPageSectionConditionId int	= scope_identity();

INSERT INTO PageSectionConditionLanguages (
	PageSectionConditionID
	, PageID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewPageSectionConditionId 
	, @PageID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION