CREATE PROCEDURE usp_PageSectionUpdatePostCheck (
	@PageId int
	, @PageSectionId int
	, @PageSectionTypeId int
	, @PageSectionDataTypeId int
	, @ShowSectionTitleName bit
	, @ShowSectionTitleDescription bit
	, @ShowContentTypeTitleName bit
	, @ShowContentTypeTitleDescription bit
	, @SizeX int
	, @SizeY int
	, @DashboardRow int
	, @DashboardColumn int
	, @ContentTypeId int
	, @SortById int
	, @MaxContent int
	, @HasPaging bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
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

IF (SELECT COUNT(*) FROM Pages WHERE PageId = @PageId) = 0 
BEGIN
insert into @ErrorIdsTable values(72)
END

IF (SELECT COUNT(*) FROM PageSectionTypes WHERE PageSectionTypeId = @PageSectionTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(73)
END

IF (SELECT COUNT(*) FROM PageSectionDataTypes WHERE PageSectionDataTypeId = @PageSectionDataTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(74)
END

IF (SELECT COUNT(*) FROM ContentTypes WHERE ContentTypeId = @ContentTypeId) = 0 AND @ContentTypeId IS NOT NULL   
BEGIN
insert into @ErrorIdsTable values(41)
END

IF (SELECT COUNT(*) FROM SortBys WHERE SortById = @SortById) = 0 
BEGIN
insert into @ErrorIdsTable values(75)
END


IF  (SELECT COUNT(*) 
	FROM PageSectionLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name AND PageSectionID <> @PageSectionId ) >0
BEGIN
	insert into @ErrorIdsTable values(56)
END


--PETER TODO Add a check for process type which includes if primary content is a field for that.
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