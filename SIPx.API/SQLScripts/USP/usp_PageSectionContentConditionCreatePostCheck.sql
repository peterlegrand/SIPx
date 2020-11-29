CREATE PROCEDURE usp_PageSectionContentConditionCreatePostCheck (
	@PageSectionId int
	, @PageSectionContentConditionTypeId int
	, @PageSectionContentConditionInt int = null
	, @PageSectionContentConditionString nvarchar(max)
	, @PageSectionContentConditionDate datetime
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

--PETER No need to check with other records as it is at the moment AND AND
--PETER TODO Proper checking on string and date and int.
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM PageSections WHERE PageSectionId = @PageSectionId) = 0 
BEGIN
insert into @ErrorIdsTable values(60)
END

IF (SELECT COUNT(*) FROM PageSectionContentConditionTypes WHERE PageSectionContentConditionTypeId = @PageSectionContentConditionTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(61)
END

IF (@PageSectionContentConditionString  IS NOT NULL AND @PageSectionContentConditionString <> '' AND @PageSectionContentConditionTypeId = 1) 
BEGIN
insert into @ErrorIdsTable values(62)
END

IF (SELECT COUNT(*) FROM Organizations WHERE OrganizationId = @PageSectionContentConditionInt) = 0 AND  @PageSectionContentConditionTypeId = 3
BEGIN
insert into @ErrorIdsTable values(63)
END

IF (SELECT COUNT(*) FROM Projects WHERE ProjectId = @PageSectionContentConditionInt) = 0 AND  @PageSectionContentConditionTypeId = 4
BEGIN
insert into @ErrorIdsTable values(64)
END


IF (SELECT COUNT(*) FROM ContentTypes WHERE ContentTypeId = @PageSectionContentConditionInt) = 0 AND  @PageSectionContentConditionTypeId = 5
BEGIN
insert into @ErrorIdsTable values(65)
END

IF (SELECT COUNT(*) FROM ContentStatuses WHERE ContentStatusId = @PageSectionContentConditionInt) = 0 AND  @PageSectionContentConditionTypeId =6
BEGIN
insert into @ErrorIdsTable values(66)
END

IF (SELECT COUNT(*) FROM Languages WHERE StatusID = 1 AND  LanguageId = @PageSectionContentConditionInt) = 0 AND  @PageSectionContentConditionTypeId = 7
BEGIN
insert into @ErrorIdsTable values(67)
END

IF (SELECT COUNT(*) FROM SecurityLevels WHERE SecurityLevelId = @PageSectionContentConditionInt) = 0 AND  @PageSectionContentConditionTypeId = 8
BEGIN
insert into @ErrorIdsTable values(68)
END

IF (SELECT COUNT(*) FROM AspNetUsers WHERE ID = @PageSectionContentConditionString) = 0 AND  (@PageSectionContentConditionTypeId = 9 OR @PageSectionContentConditionTypeId = 10)
BEGIN
insert into @ErrorIdsTable values(69)
END

IF (SELECT COUNT(*) FROM ClassificationValues WHERE ClassificationValueId = @PageSectionContentConditionInt) = 0 AND  @PageSectionContentConditionTypeId = 11
BEGIN
insert into @ErrorIdsTable values(70)
END

IF @PageSectionContentConditionDate is not null AND (@PageSectionContentConditionTypeId = 12 OR @PageSectionContentConditionTypeId = 13OR @PageSectionContentConditionTypeId = 14OR @PageSectionContentConditionTypeId = 15)
BEGIN
insert into @ErrorIdsTable values(71)
END

IF  (SELECT COUNT(*) 
	FROM PageSectionContentConditionLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name ) >0
BEGIN
	insert into @ErrorIdsTable values(56)
END


--PETER TODO Add a check for process template which includes if primary content is a field for that.
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