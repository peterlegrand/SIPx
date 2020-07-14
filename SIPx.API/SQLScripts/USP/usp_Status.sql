CREATE PROCEDURE [dbo].[usp_Status] (@UserId nvarchar(450), @StatusId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Statuses.StatusId 
	, ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) Name
	, ISNULL(UIGroupDescriptionCustom.Customization,UIGroupDescription.Name) Description
	, ISNULL(UIGroupMenuNameCustom.Customization,UIGroupMenuName.Name) MenuName
	, ISNULL(UIGroupMouseOverCustom.Customization,UIGroupMouseOver.Name) MouseOver
FROM Statuses
JOIN UITermLanguages UIGroupName
	ON UIGroupName.UITermId = Statuses.NameTermID
JOIN UITermLanguages UIGroupDescription
	ON UIGroupDescription.UITermId = Statuses.NameTermID
JOIN UITermLanguages UIGroupMenuName
	ON UIGroupMEnuName.UITermId = Statuses.NameTermID
JOIN UITermLanguages UIGroupMouseOver
	ON UIGroupMouseOver.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupNameCustom
	ON UIGroupNameCustom.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupDescriptionCustom
	ON UIGroupDescriptionCustom.UITermId = Statuses.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupMenuNameCustom
	ON UIGroupMenuNameCustom.UITermId = Statuses.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupMouseOverCustom
	ON UIGroupMouseOverCustom.UITermId = Statuses.MouseOverTermID
WHERE UIGroupName.LanguageId = @LanguageID
	AND UIGroupDescription.LanguageId = @LanguageID
	AND UIGroupMenuName.LanguageId = @LanguageID
	AND UIGroupMouseOver.LanguageId = @LanguageID
	AND Statuses.StatusId = @StatusID


