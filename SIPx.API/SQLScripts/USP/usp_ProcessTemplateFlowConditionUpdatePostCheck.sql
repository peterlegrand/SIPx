CREATE PROCEDURE usp_ProcessTemplateFlowConditionUpdatePostCheck (
	@ProcessTemplateFlowConditionId int
	, @Sequence int
	, @ProcessTemplateFlowConditionTypeId int
	, @ProcessTemplateFieldId int
	, @ProcessTemplateFieldIDRole int
	, @ComparisonOperatorId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
	AS 

--PETER TODO What is unique about a person?
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ProcessTemplateID int;
SELECT @ProcessTemplateID = ProcessTemplateId FROM ProcessTemplateFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldId;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ProcessTemplateFlowConditions WHERE ProcessTemplateFlowConditionId = @ProcessTemplateFlowConditionId) = 0 
BEGIN
insert into @ErrorIdsTable values(90)
END

IF (SELECT MAX(Sequence) 
	FROM ProcessTemplateFlowConditions ) < @Sequence + 1
BEGIN
	insert into @ErrorIdsTable values(3)
END

IF @Sequence < 1
BEGIN
	insert into @ErrorIdsTable values(4)

END

IF (SELECT COUNT(*) FROM ProcessTemplateFlowConditionTypes WHERE ProcessTemplateFlowConditionTypeId = @ProcessTemplateFlowConditionTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(88)
END

IF (SELECT COUNT(*) FROM ProcessTemplateFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldId) = 0 OR @ProcessTemplateFieldId IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(84)
END

IF (SELECT COUNT(*) FROM ProcessTemplateFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldIDRole) = 0 OR @ProcessTemplateFieldIDRole IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(84)
END

IF (SELECT COUNT(*) FROM ProcessTemplateFlowConditionComparisonOperators WHERE ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorID = @ComparisonOperatorId) = 0 OR @ComparisonOperatorId IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(89)
END


IF @Name ='' 
BEGIN
insert into @ErrorIdsTable values(104)
END

IF @Description ='' 
BEGIN
insert into @ErrorIdsTable values(9)
END

IF @MenuName ='' 
BEGIN
insert into @ErrorIdsTable values(10)
END

IF @MouseOver ='' 
BEGIN
insert into @ErrorIdsTable values(11)
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