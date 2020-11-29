CREATE PROCEDURE usp_ClassificationValuePropertyUpdatePostCheck (
	@ClassificationValuePropertyId int
	, @PropertyId int
	, @PropertyInt int
	, @PropertyBool bit
	, @PropertyDate datetime
	, @PropertyString nvarchar(max)
	, @PropertyValueId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ClassificationValueProperties WHERE ClassificationValuePropertyID = @ClassificationValuePropertyId) = 0
BEGIN
insert into @ErrorIdsTable values(39)
END

IF (SELECT COUNT(*) FROM Properties WHERE PropertyID = @PropertyId) = 0
BEGIN
insert into @ErrorIdsTable values(22)
END

--PETER TODO check with teh level what type it is and then check if this should have a value
-- PETER TODO Same for createpostcheck
IF (SELECT COUNT(*) FROM PropertyValues WHERE PropertyValueID = @PropertyValueId) = 0 AND @PropertyValueId IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(38)
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