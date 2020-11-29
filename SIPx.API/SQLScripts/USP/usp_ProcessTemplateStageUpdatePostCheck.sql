CREATE PROCEDURE usp_ProcessTemplateStageUpdatePostCheck (
	@ProcessTemplateStageId int
	, @ProcessTemplateStageTypeId int
	, @Name nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ProcessTemplateId int;
SELECT @ProcessTemplateId = ProcessTemplateId FROM ProcessTemplateStages WHERE ProcessTemplateStageId = @ProcessTemplateStageId;

BEGIN



DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ProcessTemplateStages WHERE ProcessTemplateStageId = @ProcessTemplateStageId) = 0 
BEGIN
insert into @ErrorIdsTable values(91)
END

IF (SELECT COUNT(*) FROM ProcessTemplateStageTypes WHERE ProcessTemplateStageTypeId = @ProcessTemplateStageTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(94)
END

IF  (SELECT COUNT(*) 
	FROM ProcessTemplateStageLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name AND ProcessTemplateID = @ProcessTemplateId AND ProcessTemplateStageID <> @ProcessTemplateStageId) > 0
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