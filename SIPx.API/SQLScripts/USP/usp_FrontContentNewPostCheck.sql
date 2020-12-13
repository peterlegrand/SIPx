CREATE PROCEDURE usp_FrontContentNewPostCheck (
	@ContentTypeId int
	, @ContentStatusID int
	, @LanguageID int
	, @Title nvarchar(50)
	, @Description nvarchar(max)
	, @SecurityLevelID int
	, @ProjectID int
	, @OrganizationID int
	, @UserID nvarchar(450)
	, @ClassificationValueTable AS udt_ContentClassificationValueInsert READONLY
) 
	
AS 

DECLARE @LanguageOfUserId int;
SELECT @LanguageOfUserId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @UserSecurityLevelId int;
SELECT @UserSecurityLevelId = SecurityLevelID FROM AspNetUsers WHERE Id = @UserID;
BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ContentTypes WHERE ContentTypeId = @ContentTypeId) = 0
BEGIN
insert into @ErrorIdsTable values(41)
END

IF (SELECT COUNT(*) FROM ContentStatuses WHERE ContentStatusID = @ContentStatusID) = 0
BEGIN
insert into @ErrorIdsTable values(42)
END

IF (SELECT COUNT(*) FROM Languages WHERE LanguageID = @LanguageID AND Languages.StatusID = 1 ) = 0
BEGIN
insert into @ErrorIdsTable values(6)
END

IF @Title =''
BEGIN
insert into @ErrorIdsTable values(107)
END

IF @Description =''
BEGIN
insert into @ErrorIdsTable values(9)
END

IF (SELECT COUNT(*) FROM Projects WHERE ProjectID = @ProjectID OR @ProjectID IS NULL) = 0
BEGIN
insert into @ErrorIdsTable values(57)
END

IF (SELECT COUNT(*) FROM Organizations WHERE OrganizationID = @OrganizationID ) = 0
BEGIN
insert into @ErrorIdsTable values(48)
END

IF (SELECT COUNT(*) FROM SecurityLevels WHERE SecurityLevelID = @SecurityLevelID ) = 0
BEGIN
insert into @ErrorIdsTable values(45)
END

IF @UserSecurityLevelId < @SecurityLevelID
BEGIN
insert into @ErrorIdsTable values(108)
END

IF (SELECT COUNT(*) FROM ClassificationValues JOIN @ClassificationValueTable ClassificationValuesForContent ON ClassificationValuesForContent.ClassificationId = ClassificationValues.ClassificationID AND ClassificationValuesForContent.ClassificationValueId = ClassificationValues.ClassificationValueID ) = 0
BEGIN
insert into @ErrorIdsTable values(109)
END

IF (SELECT COUNT(*) FROM @ClassificationValueTable ClassificationValuesForContent GROUP BY ClassificationValuesForContent.ClassificationId HAVING COUNT(*)>1 ) > 0
BEGIN
insert into @ErrorIdsTable values(110)
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