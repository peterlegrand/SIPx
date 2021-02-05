CREATE PROCEDURE usp_ProcessCreatePostCheck (
	@UserId nvarchar(450)
	, @ProcessTypeId int
	, @ProcessTypeFlowId int
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

IF (SELECT COUNT(*) FROM ProcessTypes WHERE ProcessTypeId = @ProcessTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(82)
END

IF (SELECT COUNT(*) FROM ProcessTypeFlows WHERE ProcessTypeFlowId = @ProcessTypeFlowId) = 0 
BEGIN
insert into @ErrorIdsTable values(83)
END

IF (SELECT COUNT(*) FROM @ProcessFieldValueTable TempTable WHERE TempTable.ProcessTypeId NOT IN (SELECT ProcessTypeId FROM ProcessTypes )) > 0 
BEGIN
insert into @ErrorIdsTable values(82)
END

--PETER TODO, check the values based  on the field type
IF (SELECT COUNT(*) FROM @ProcessFieldValueTable TempTable WHERE TempTable.ProcessTypeFieldId NOT IN (SELECT ProcessTypeFieldId FROM ProcessTypeFields )) > 0 
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