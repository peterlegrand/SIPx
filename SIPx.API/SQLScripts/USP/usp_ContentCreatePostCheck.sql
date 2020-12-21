CREATE PROCEDURE usp_ContentCreatePostCheck (
	@UserId nvarchar(450)
	, @ParentContentId int
	, @ContentTypeId int
	, @ContentStatusId int
	, @LanguageId int
	, @Title nvarchar(50)
	, @Description nvarchar(max)
	, @SecurityLevelId int
	, @OrganizationId int
	, @ProjectId int
	, @ProcessId int
	, @ClassificationValueTable AS udt_ContentClassificationValuesNew READONLY)
AS 

DECLARE @UserLanguageId int;
SELECT @UserLanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM Contents WHERE ContentID = @ParentContentId) = 0 AND @ParentContentId IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(40)
END


IF (SELECT COUNT(*) FROM ContentTypes WHERE ContentTypeID = @ContentTypeId) = 0
BEGIN
insert into @ErrorIdsTable values(41)
END

IF (SELECT COUNT(*) FROM ContentStatuses WHERE ContentStatusID = @ContentStatusId) = 0
BEGIN
insert into @ErrorIdsTable values(42)
END

IF  (SELECT COUNT(*) 
	FROM Languages 
	WHERE LanguageId = @LanguageId AND languages.StatusId = 1
) =0
BEGIN
	insert into @ErrorIdsTable values(6)
END

--PETER TODO check this. Even though the sp is not used.
--IF (SELECT COUNT(*) FROM ClassificationRelationTypes WHERE ClassificationRelationTypeId = @ClassificationRelationTypeId) = 0
--BEGIN
--insert into @ErrorIdsTable values(27)
--END

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