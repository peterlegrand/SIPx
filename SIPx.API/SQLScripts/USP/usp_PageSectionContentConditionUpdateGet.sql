create PROCEDURE usp_PageSectionContentConditionUpdateGet (@UserId nvarchar(450), @PageSectionContentConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ClassifficationId int;
DECLARE @PageSectionContentConditionTypeIdExtended varchar(30);
DECLARE @PageSectionContentConditionTypeID int;
DECLARE @PageSectionContentConditionInt int;
SELECT @PageSectionContentConditionTypeID = PageSectionContentConditionTypeID, @PageSectionContentConditionInt = PageSectionContentConditionInt FROM PageSectionContentConditions WHERE PageSectionContentConditionID= @PageSectionContentConditionID;
IF @PageSectionContentConditionTypeID= 11
BEGIN
SELECT @PageSectionContentConditionTypeIdExtended = CONCAT('T',ClassificationId) FROM Classificationvalues where ClassificationValueID = @PageSectionContentConditionInt
END
ELSE
BEGIN
SET @PageSectionContentConditionTypeIdExtended = concat('V',@PageSectionContentConditionTypeID )
End


SELECT PageSectionContentConditions.PageSectionContentConditionID
, PageSectionContentConditions.PageSectionID
, PageSectionContentConditions.PageID
	, ISNULL(UserPageSectionContentConditionLanguage.Name,ISNULL(DefaultPageSectionContentConditionLanguage.Name,'No name for this section')) Name
	, ISNULL(UserPageSectionContentConditionLanguage.Description,ISNULL(DefaultPageSectionContentConditionLanguage.Description,'No description for this section')) Description
	, ISNULL(UserPageSectionContentConditionLanguage.MenuName,ISNULL(DefaultPageSectionContentConditionLanguage.MenuName,'No menu name for this section')) MenuName
	, ISNULL(UserPageSectionContentConditionLanguage.MouseOver,ISNULL(DefaultPageSectionContentConditionLanguage.MouseOver,'No mouse over for this section')) MouseOver
	, ISNULL(UINameCustom.Customization ,UIName.Name) PageSectionContenConditionTypeName
	, PageSectionContentConditions.PageSectionContentConditionTypeID
	, @PageSectionContentConditionTypeIdExtended
	, PageSectionContentConditions.PageSectionContentConditionInt
	, PageSectionContentConditions.PageSectionContentConditionDate
	, PageSectionContentConditions.PageSectionContentConditionString
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PageSectionContentConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PageSectionContentConditions.ModifiedDate
FROM PageSectionContentConditions 
LEFT JOIN (SELECT PageSectionContentConditionId, Name, Description, MenuName, MouseOver FROM PageSectionContentConditionLanguages WHERE LanguageId = @LanguageID) UserPageSectionContentConditionLanguage
	ON UserPageSectionContentConditionLanguage.PageSectionContentConditionId = PageSectionContentConditions.PageSectionContentConditionID
LEFT JOIN (SELECT PageSectionContentConditionId, Name, Description, MenuName, MouseOver FROM PageSectionContentConditionLanguages JOIN Settings ON PageSectionContentConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageSectionContentConditionLanguage
	ON DefaultPageSectionContentConditionLanguage.PageSectionContentConditionId = PageSectionContentConditions.PageSectionContentConditionID
JOIN PageSectionContentConditionTypes
	ON PageSectionContentConditionTypes.PageSectionContentConditionTypeID = PageSectionContentConditions.PageSectionContentConditionTypeId
JOIN UITermLanguages UIName
	ON UIName.UITermID = PageSectionContentConditionTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = PageSectionContentConditionTypes.NameTermID

JOIN Persons Creator
	ON Creator.UserId = PageSectionContentConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageSectionContentConditions.ModifierID
WHERE PageSectionContentConditions.PageSectionContentConditionId = @PageSectionContentConditionId 
	AND UIName.LanguageID = @LanguageID
ORDER BY ISNULL(UserPageSectionContentConditionLanguage.Name,ISNULL(DefaultPageSectionContentConditionLanguage.Name,'No name for this section'))


