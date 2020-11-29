CREATE PROCEDURE usp_ProcessTemplateFieldCreatePostCheck (
	@ProcessTemplateId int
	, @ProcessTemplateFieldTypeId int
	, @Name nvarchar(50)
	, @UserId nvarchar(450)) 
	AS 

--PETER TODO What is unique about a person?
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ProcessTemplates WHERE ProcessTemplateId = @ProcessTemplateId) = 0 
BEGIN
insert into @ErrorIdsTable values(82)
END

IF (SELECT COUNT(*) FROM ProcessTemplateFieldTypes WHERE ProcessTemplateFieldTypeId = @ProcessTemplateFieldTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(87)
END

IF  (SELECT COUNT(*) 
	FROM ProcessTemplateFieldLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name AND ProcessTemplateID = @ProcessTemplateId) > 0
BEGIN
	insert into @ErrorIdsTable values(85)
END


SELECT ErrorMessages.ErrorMessageID
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM @ErrorIdsTable Errors 
JOIN ErrorMessages 
	ON Errors.id = ErrorMessages.ErrorMessageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = ErrorMessages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ErrorMessages.NameTermID
WHERE UIName.LanguageId = @LanguageID

END