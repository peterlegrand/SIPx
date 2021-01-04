CREATE PROCEDURE [dbo].[usp_PageSectionContentConditionTypeListExtended] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT * FROM (SELECT Concat('T',PageSectionContentConditionTypes.PageSectionContentConditionTypeId) ExtendedId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, Concat('ControlT',PageSectionContentConditionTypes.PageSectionContentConditionTypeId) ControlA
	, Concat( CHAR(36) ,'("#ControlT',PageSectionContentConditionTypes.PageSectionContentConditionTypeId,'").hide();') ControlHide
	, Concat( CHAR(36) ,'("#ControlT',PageSectionContentConditionTypes.PageSectionContentConditionTypeId,'").show();') ControlShow
FROM PageSectionContentConditionTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = PageSectionContentConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PageSectionContentConditionTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID AND PageSectionContentConditionTypeID <> 11 AND Active = 1

UNION ALL

SELECT CONCAT('V',Classifications.ClassificationID)
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
	, CONCAT('ControlV',Classifications.ClassificationID)
	, CONCAT( CHAR(36) ,'("#ControlV',Classifications.ClassificationID,'").hide();') 
	, CONCAT( CHAR(36) ,'("#ControlV',Classifications.ClassificationID,'").show();') 
FROM Classifications 
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationId = Classifications.ClassificationID
	) plop ORDER BY left(ExtendedId,1), Name
