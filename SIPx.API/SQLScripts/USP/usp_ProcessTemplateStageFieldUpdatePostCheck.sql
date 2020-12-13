CREATE PROCEDURE usp_ProcessTemplateStageFieldUpdatePostCheck (
	@ProcessTemplateStageFieldId int
	, @ProcessTemplateStageFieldStatusId int
	, @ValueUpdateTypeId int
	, @Sequence int
	, @StringValue nvarchar(max)
	, @IntValue int
	, @DateTimeValue DateTime
	, @UserId nvarchar(450)
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

IF (SELECT COUNT(*) FROM ProcessTemplateStageFields WHERE ProcessTemplateStageFieldId = @ProcessTemplateStageFieldId) = 0 
BEGIN
insert into @ErrorIdsTable values(113)
END

IF (SELECT COUNT(*) FROM ProcessTemplateStageFieldStatuses WHERE ProcessTemplateStageFieldStatusId = @ProcessTemplateStageFieldStatusId) = 0 
BEGIN
insert into @ErrorIdsTable values(114)
END

--PETER TODO need to check the type of field in order to check if int string date is filled.

IF (SELECT COUNT(*) FROM ValueUpdateTypes WHERE ValueUpdateTypeId = @ValueUpdateTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(115)
END

IF (SELECT MAX(Sequence) 
	FROM ProcessTemplateFlowPasses ) < @Sequence + 1
BEGIN
	insert into @ErrorIdsTable values(3)
END

IF @Sequence < 1
BEGIN
	insert into @ErrorIdsTable values(4)

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