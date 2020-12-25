CREATE PROCEDURE usp_ProcessTemplateFlowPassCreatePostCheck (
	@ProcessTemplateFlowId int
	, @Sequence int
	, @ProcessTemplateFlowPassTypeId int
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

IF (SELECT COUNT(*) FROM ProcessTemplateFlows WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId) = 0 
BEGIN
insert into @ErrorIdsTable values(83)
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

IF (SELECT COUNT(*) FROM ProcessTemplateFlowPassTypes WHERE ProcessTemplateFlowPassTypeId = @ProcessTemplateFlowPassTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(111)
END

IF (SELECT COUNT(*) FROM ProcessTemplateFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldId) = 0 OR @ProcessTemplateFieldId IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(84)
END

IF (SELECT COUNT(*) FROM ProcessTemplateFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldIDRole) = 0 OR @ProcessTemplateFieldIDRole IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(84)
END

IF (SELECT COUNT(*) FROM ProcessTemplateFlowPassComparisonOperators WHERE ProcessTemplateFlowPassComparisonOperators.ProcessTemplateFlowPassComparisonOperatorID = @ComparisonOperatorId) = 0 OR @ComparisonOperatorId IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(112)
END

IF @Name ='' OR @Name IS NULL
BEGIN
insert into @ErrorIdsTable values(104)
END

IF @Description =''  OR @Description IS NULL
BEGIN
insert into @ErrorIdsTable values(9)
END

IF @MenuName =''  OR @MenuName IS NULL
BEGIN
insert into @ErrorIdsTable values(10)
END

IF @MouseOver =''  OR @MouseOver IS NULL
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