CREATE PROCEDURE usp_ClassificationValueCreatePostCheck (
	@ClassificationId int
	, @ParentId int = NULL
	, @DateFrom datetime = NULL
	, @DateTo datetime = NULL
	, @Name nvarchar(50)
	, @UserId nvarchar(450))
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM Classifications WHERE ClassificationID = @ClassificationId) = 0
BEGIN
insert into @ErrorIdsTable values(12)
END


IF (SELECT COUNT(*) FROM ClassificationValues WHERE ClassificationValueID = @ParentId) = 0 AND @ParentId IS NOT NULL
BEGIN
insert into @ErrorIdsTable values(35)
END

IF  (SELECT COUNT(*) 
	FROM ClassificationValueLanguages 
	WHERE LanguageId = @LanguageID
		AND ClassificationValueLanguages.Name = @Name) >0
BEGIN
	insert into @ErrorIdsTable values(36)
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