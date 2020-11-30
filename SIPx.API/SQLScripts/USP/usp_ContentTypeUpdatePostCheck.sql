CREATE PROCEDURE usp_ContentTypeUpdatePostCheck (
 @ContentTypeId int
	, @ContentTypeGroupId int
	, @ProcessTemplateId int
	, @SecurityLevelId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)
	, @Color char(9)
	, @IconID int
	, @ContentTypeClassificationTable AS udt_ContentTypeClassificationNew READONLY)
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ContentTypes WHERE ContentTypeID = @ContentTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(41)
END

IF (SELECT COUNT(*) FROM ContentTypeGroups WHERE ContentTypeGroupID = @ContentTypeGroupId) = 0 
BEGIN
insert into @ErrorIdsTable values(44)
END


IF (SELECT COUNT(*) FROM @ContentTypeClassificationTable WHERE ClassificationId NOT IN (Select ClassificationId FROM Classifications) ) = 0
BEGIN
insert into @ErrorIdsTable values(47)
END

IF (SELECT COUNT(*) FROM SecurityLevels WHERE SecurityLevelID = @SecurityLevelId) = 0
BEGIN
insert into @ErrorIdsTable values(45)
END

IF  (SELECT COUNT(*) 
	FROM ContentTypeLanguages 
	WHERE LanguageId = @LanguageID
		AND ContentTypeLanguages.Name = @Name AND ContentTypeId <> @ContentTypeId) >0
BEGIN
	insert into @ErrorIdsTable values(46)
END

IF (SELECT COUNT(*) FROM Icons WHERE IconId = @IconId) = 0
BEGIN
insert into @ErrorIdsTable values(43)
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