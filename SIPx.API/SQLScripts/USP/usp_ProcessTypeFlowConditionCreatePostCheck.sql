CREATE PROCEDURE usp_ProcessTypeFlowConditionCreatePostCheck (
	@ProcessTypeFlowId int
	, @Sequence int
	, @ProcessTypeFlowConditionTypeId int
	, @ProcessTypeFieldId int
	, @ProcessTypeFieldIDRole int
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

DECLARE @ProcessTypeID int;
SELECT @ProcessTypeID = ProcessTypeId FROM ProcessTypeFields WHERE ProcessTypeFieldId = @ProcessTypeFieldId;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ProcessTypeFlows WHERE ProcessTypeFlowId = @ProcessTypeFlowId) = 0 
BEGIN
insert into @ErrorIdsTable values(83)
END

IF (SELECT MAX(Sequence) 
	FROM ProcessTypeFlowConditions ) < @Sequence + 1
BEGIN
	insert into @ErrorIdsTable values(3)
END

IF @Sequence < 1
BEGIN
	insert into @ErrorIdsTable values(4)

END

IF (SELECT COUNT(*) FROM ProcessTypeFlowConditionTypes WHERE ProcessTypeFlowConditionTypeId = @ProcessTypeFlowConditionTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(88)
END

IF (SELECT COUNT(*) FROM ProcessTypeFields WHERE ProcessTypeFieldId = @ProcessTypeFieldId) = 0 OR @ProcessTypeFieldId IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(84)
END

IF (SELECT COUNT(*) FROM ProcessTypeFields WHERE ProcessTypeFieldId = @ProcessTypeFieldIDRole) = 0 OR @ProcessTypeFieldIDRole IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(84)
END

IF (SELECT COUNT(*) FROM ProcessTypeFlowConditionComparisonOperators WHERE ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorID = @ComparisonOperatorId) = 0 OR @ComparisonOperatorId IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(89)
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