CREATE PROCEDURE usp_ProcessTypeUpdatePostCheck (
	@ProcessTypeId int
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @ObjectTypeStatusId int
	, @ProcessTypeGroupId int
	, @ShowInPersonalCalendar bit
	, @ShowInOrganizationCalendar bit
	, @ShowInProjectCalendar bit
	, @ShowInEventCalendar bit
	, @ProcessMultiMax int
	, @Sequence int
	, @IsPersonal bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @Color char(9)
	, @IconID int
	, @UserId nvarchar(450)) 
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

IF (SELECT COUNT(*) FROM ProcessTypeGroups WHERE ProcessTypeGroupId = @ProcessTypeGroupId) = 0 
BEGIN
insert into @ErrorIdsTable values(86)
END

IF (SELECT COUNT(*) FROM Icons WHERE IconID = @IconID) = 0 
BEGIN
insert into @ErrorIdsTable values(83)
END


IF (SELECT MAX(Sequence) 
	FROM ProcessTypes ) < @Sequence + 1
BEGIN
	insert into @ErrorIdsTable values(13)
END

IF @Sequence < 1
BEGIN
	insert into @ErrorIdsTable values(4)

END

IF  (SELECT COUNT(*) 
	FROM ProcessTypeLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name AND ProcessTypeID <> @ProcessTypeId) > 0
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