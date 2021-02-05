CREATE PROCEDURE usp_ProcessTypeStageUpdatePostCheck (
	@ProcessTypeStageId int
	, @ProcessTypeStageTypeId int
	, @Name nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ProcessTypeId int;
SELECT @ProcessTypeId = ProcessTypeId FROM ProcessTypeStages WHERE ProcessTypeStageId = @ProcessTypeStageId;

BEGIN



DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ProcessTypeStages WHERE ProcessTypeStageId = @ProcessTypeStageId) = 0 
BEGIN
insert into @ErrorIdsTable values(91)
END

IF (SELECT COUNT(*) FROM ProcessTypeStageTypes WHERE ProcessTypeStageTypeId = @ProcessTypeStageTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(94)
END

IF  (SELECT COUNT(*) 
	FROM ProcessTypeStageLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name AND ProcessTypeID = @ProcessTypeId AND ProcessTypeStageID <> @ProcessTypeStageId) > 0
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