CREATE PROCEDURE usp_PageSectionContentConditionCreatePost (
	@PageSectionId int
	, @PageSectionContentConditionTypeId int
	, @PageSectionContentConditionInt int = null
	, @PageSectionContentConditionString nvarchar(max)
	, @PageSectionContentConditionDate datetime
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

INSERT INTO PageSectionContentConditions (
	PageSectionID
	, PageID
	, PageSectionContentConditionTypeID
	, PageSectionContentConditionInt 
	, PageSectionContentConditionString 
	, PageSectionContentConditionDate 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@PageSectionID
	, @PageID
	, @PageSectionContentConditionTypeID
	, @PageSectionContentConditionInt 
	, @PageSectionContentConditionString 
	, @PageSectionContentConditionDate 
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewPageSectionContentConditionId int	= scope_identity();

INSERT INTO PageSectionContentConditionLanguages (
	PageSectionContentConditionID
	, PageSectionID
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
	@NewPageSectionContentConditionId 
	, @PageSectionID
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