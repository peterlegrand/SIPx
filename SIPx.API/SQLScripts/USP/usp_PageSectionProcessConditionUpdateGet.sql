CREATE PROCEDURE usp_PageSectionProcessConditionUpdateGet (@UserId nvarchar(450), @PageSectionProcessConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ClassifficationId int;
DECLARE @PageSectionProcessConditionTypeIdExtended varchar(30);
DECLARE @PageSectionProcessConditionTypeID int;
DECLARE @PageSectionProcessConditionInt int;
SELECT @PageSectionProcessConditionTypeID = PageSectionProcessConditionTypeID, @PageSectionProcessConditionInt = PageSectionProcessConditionInt FROM PageSectionProcessConditions WHERE PageSectionProcessConditionID= @PageSectionProcessConditionID;
IF @PageSectionProcessConditionTypeID= 11
BEGIN
SELECT @PageSectionProcessConditionTypeIdExtended = CONCAT('V',ClassificationId) FROM Classificationvalues where ClassificationValueID = @PageSectionProcessConditionInt
END
ELSE
BEGIN
SET @PageSectionProcessConditionTypeIdExtended = concat('T',@PageSectionProcessConditionTypeID )
End


SELECT PageSectionProcessConditions.PageSectionProcessConditionID
, PageSectionProcessConditions.PageSectionID
, PageSectionProcessConditions.PageID
	, ISNULL(UserPageSectionProcessConditionLanguage.Name,ISNULL(DefaultPageSectionProcessConditionLanguage.Name,'No name for this section')) Name
	, ISNULL(UserPageSectionProcessConditionLanguage.Description,ISNULL(DefaultPageSectionProcessConditionLanguage.Description,'No description for this section')) Description
	, ISNULL(UserPageSectionProcessConditionLanguage.MenuName,ISNULL(DefaultPageSectionProcessConditionLanguage.MenuName,'No menu name for this section')) MenuName
	, ISNULL(UserPageSectionProcessConditionLanguage.MouseOver,ISNULL(DefaultPageSectionProcessConditionLanguage.MouseOver,'No mouse over for this section')) MouseOver
	, ISNULL(UINameCustom.Customization ,UIName.Name) PageSectionProcessConditionTypeName
	, PageSectionProcessConditions.PageSectionProcessConditionTypeID
	, @PageSectionProcessConditionTypeIdExtended PageSectionProcessConditionTypeIdExtended
	, PageSectionProcessConditions.PageSectionProcessConditionInt
	, PageSectionProcessConditions.PageSectionProcessConditionDate
	, PageSectionProcessConditions.PageSectionProcessConditionString
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PageSectionProcessConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PageSectionProcessConditions.ModifiedDate
FROM PageSectionProcessConditions 
LEFT JOIN (SELECT PageSectionProcessConditionId, Name, Description, MenuName, MouseOver FROM PageSectionProcessConditionLanguages WHERE LanguageId = @LanguageID) UserPageSectionProcessConditionLanguage
	ON UserPageSectionProcessConditionLanguage.PageSectionProcessConditionId = PageSectionProcessConditions.PageSectionProcessConditionID
LEFT JOIN (SELECT PageSectionProcessConditionId, Name, Description, MenuName, MouseOver FROM PageSectionProcessConditionLanguages JOIN Settings ON PageSectionProcessConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageSectionProcessConditionLanguage
	ON DefaultPageSectionProcessConditionLanguage.PageSectionProcessConditionId = PageSectionProcessConditions.PageSectionProcessConditionID
JOIN PageSectionProcessConditionTypes
	ON PageSectionProcessConditionTypes.PageSectionProcessConditionTypeID = PageSectionProcessConditions.PageSectionProcessConditionTypeId
JOIN UITermLanguages UIName
	ON UIName.UITermID = PageSectionProcessConditionTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = PageSectionProcessConditionTypes.NameTermID

JOIN Persons Creator
	ON Creator.UserId = PageSectionProcessConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageSectionProcessConditions.ModifierID
WHERE PageSectionProcessConditions.PageSectionProcessConditionId = @PageSectionProcessConditionId 
	AND UIName.LanguageID = @LanguageID
ORDER BY ISNULL(UserPageSectionProcessConditionLanguage.Name,ISNULL(DefaultPageSectionProcessConditionLanguage.Name,'No name for this section'))


