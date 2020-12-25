CREATE PROCEDURE usp_PageSectionProcessConditionUpdatePostCheck (
	 @PageSectionProcessConditionId int
	, @PageSectionProcessConditionTypeId int
	, @PageSectionProcessConditionInt int
	, @PageSectionProcessConditionDate datetime
	, @PageSectionProcessConditionString nvarchar(max) = null
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)
	) 
	
AS 

DECLARE @LanguageOfUserId int;
SELECT @LanguageOfUserId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM PageSectionProcessConditions WHERE PageSectionProcessConditionId = @PageSectionProcessConditionId) = 0
BEGIN
insert into @ErrorIdsTable values(41)
END

IF (SELECT COUNT(*) FROM PageSectionProcessConditionTypes WHERE PageSectionProcessConditionTypeId = @PageSectionProcessConditionTypeId) = 0
BEGIN
insert into @ErrorIdsTable values(42)
END

--PETER TODO This need to worked out more for each type, for each individual value of type separately)
IF  @PageSectionProcessConditionTypeId in (1,2,12,13, 16) AND (@PageSectionProcessConditionInt = 0 OR @PageSectionProcessConditionInt  IS NULL)
BEGIN
insert into @ErrorIdsTable values(42)
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
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageOfUserId) UINameCustom
	ON UINameCustom.UITermId = ErrorMessages.NameTermID
WHERE UIName.LanguageId = @LanguageOfUserId

END