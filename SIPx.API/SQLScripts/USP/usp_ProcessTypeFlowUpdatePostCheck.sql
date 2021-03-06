CREATE PROCEDURE usp_ProcessTypeFlowUpdatePostCheck (
	@ProcessTypeFlowId int
	, @ProcessTypeFromStageId int
	, @ProcessTypeToStageId int
	, @DateLevelId int
	, @Name nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ProcessTypeId int;
SELECT @ProcessTypeId = ProcessTypeId FROM ProcessTypeFlows WHERE ProcessTypeFlowId = @ProcessTypeFlowId;
BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ProcessTypeFlows WHERE ProcessTypeFlowId = @ProcessTypeFlowId) = 0 
BEGIN
insert into @ErrorIdsTable values(82)
END

IF (SELECT COUNT(*) FROM ProcessTypeStages WHERE ProcessTypeStageId = @ProcessTypeFromStageId) = 0 
BEGIN
insert into @ErrorIdsTable values(91)
END

IF (SELECT COUNT(*) FROM ProcessTypeStages WHERE ProcessTypeStageId = @ProcessTypeFromStageId) = 0 
BEGIN
insert into @ErrorIdsTable values(91)
END

IF (SELECT COUNT(*) FROM DateLevels WHERE DateLevelId = @DateLevelId) = 0 
BEGIN
insert into @ErrorIdsTable values(92)
END

IF  (SELECT COUNT(*) 
	FROM ProcessTypeFlowLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name AND ProcessTypeID = @ProcessTypeId AND ProcessTypeFlowID <> @ProcessTypeFlowId) > 0
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