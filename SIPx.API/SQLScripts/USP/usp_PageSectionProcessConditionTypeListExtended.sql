CREATE PROCEDURE usp_PageSectionProcessConditionTypeListExtended (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT * FROM (SELECT Concat('T',PageSectionProcessConditionTypes.PageSectionProcessConditionTypeId) ExtendedId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, Concat('ControlT',PageSectionProcessConditionTypes.PageSectionProcessConditionTypeId) ControlA
	, Concat( CHAR(36) ,'("#ControlT',PageSectionProcessConditionTypes.PageSectionProcessConditionTypeId,'").hide();') ControlHide
	, Concat(CHAR(36) ,'("#ControlT',PageSectionProcessConditionTypes.PageSectionProcessConditionTypeId,'").show();') ControlShow
FROM PageSectionProcessConditionTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = PageSectionProcessConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PageSectionProcessConditionTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID AND PageSectionProcessConditionTypeID <> 11 and active = 1

UNION ALL

SELECT CONCAT('V',Classifications.ClassificationID)
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
	, CONCAT('ControlV',Classifications.ClassificationID)
	, CONCAT(CHAR(36) ,'("#ControlV',Classifications.ClassificationID,'").hide();') 
	, CONCAT(CHAR(36) ,'("#ControlV',Classifications.ClassificationID,'").show();') 
FROM Classifications 
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationId = Classifications.ClassificationID
	) plop ORDER BY left(ExtendedId,1), Name
