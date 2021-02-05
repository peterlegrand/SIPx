CREATE PROCEDURE usp_ProcessUpdatePostCheck (
	@UserId nvarchar(450)
	, @ProcessId int
	, @ProcessTypeFlowId int
	, @ProcessFieldTable AS udt_ProcessFieldUpdate READONLY
	) 
	AS 

--PETER TODO What is unique about a person?
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM Processes WHERE ProcessId = @ProcessId) = 0 
BEGIN
insert into @ErrorIdsTable values(116)
END

IF (SELECT COUNT(*) FROM ProcessTypeFlows WHERE ProcessTypeFlowId = @ProcessTypeFlowId) = 0 
BEGIN
insert into @ErrorIdsTable values(83)
END


IF (SELECT COUNT(*) FROM @ProcessFieldTable a WHERE a.ProcessFieldId NOT IN (SELECT ProcessFields.ProcessFieldID FROM ProcessFields WHERE ProcessId = @ProcessId)) > 0 
BEGIN
insert into @ErrorIdsTable values(117)
END



--PETER TODO need to check the values



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