CREATE PROCEDURE usp_ProcessCreatePostCheck (
	@UserId nvarchar(450)
	, @ProcessTemplateId int
	, @ProcessTemplateFlowId int
	, @ProcessFieldValueTable AS udt_ProcessFieldsNew READONLY)
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

IF (SELECT COUNT(*) FROM ProcessTemplateFlows WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId) = 0 
BEGIN
insert into @ErrorIdsTable values(83)
END

IF (SELECT COUNT(*) FROM @ProcessFieldValueTable TempTable WHERE TempTable.ProcessTemplateId NOT IN (SELECT ProcessTemplateId FROM ProcessTemplates )) > 0 
BEGIN
insert into @ErrorIdsTable values(82)
END

--PETER TODO, check the values based  on the field type
IF (SELECT COUNT(*) FROM @ProcessFieldValueTable TempTable WHERE TempTable.ProcessTemplateFieldId NOT IN (SELECT ProcessTemplateFieldId FROM ProcessTemplateFields )) > 0 
BEGIN
insert into @ErrorIdsTable values(84)
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