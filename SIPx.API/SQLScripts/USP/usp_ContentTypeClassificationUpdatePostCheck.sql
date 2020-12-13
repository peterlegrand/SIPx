CREATE PROCEDURE usp_ContentTypeClassificationUpdatePostCheck (
	@ContentTypeClassificationId int
	, @ContentTypeClassificationStatusId int
	, @UserId nvarchar(450)
) 
	
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ContentTypeClassifications WHERE ContentTypeClassificationId = @ContentTypeClassificationId) = 0
BEGIN
insert into @ErrorIdsTable values(105)
END

IF (SELECT COUNT(*) FROM ContentTypeClassificationStatuses WHERE ContentTypeClassificationStatusId = @ContentTypeClassificationStatusId) = 0
BEGIN
insert into @ErrorIdsTable values(106)
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