ALTER PROCEDURE [dbo].[usp_PageSectionConditionTypeListExtended] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT * FROM (SELECT Concat('T',PageSectionConditionTypes.PageSectionConditionTypeId) ExtendedId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, Concat('ControlT',PageSectionConditionTypes.PageSectionConditionTypeId) ControlA
	, Concat('$("#ControlT',PageSectionConditionTypes.PageSectionConditionTypeId,'").hide();') ControlHide
	, Concat('$("#ControlT',PageSectionConditionTypes.PageSectionConditionTypeId,'").show();') ControlShow
FROM PageSectionConditionTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = PageSectionConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PageSectionConditionTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID AND PageSectionConditionTypeID <> 11

UNION ALL

SELECT CONCAT('V',Classifications.ClassificationID)
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
	, CONCAT('ControlV',Classifications.ClassificationID)
	, CONCAT('$("#ControlV',Classifications.ClassificationID,'").hide();') 
	, CONCAT('$("#ControlV',Classifications.ClassificationID,'").show();') 
FROM Classifications 
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationId = Classifications.ClassificationID
	) plop ORDER BY left(ExtendedId,1), Name
