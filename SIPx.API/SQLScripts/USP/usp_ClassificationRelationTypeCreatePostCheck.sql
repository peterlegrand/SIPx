CREATE PROCEDURE usp_ClassificationRelationTypeCreatePostCheck (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN 

DECLARE @ErrorIdsTable TABLE (id int)

IF  (SELECT COUNT(*) FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID AND ClassificationRelationTypeLanguages.Name = @Name) >0
BEGIN
	insert into @ErrorIdsTable values(26)
END

IF  (SELECT COUNT(*) FROM Languages WHERE LanguageId = @LanguageId AND languages.StatusId = 1) =0
BEGIN
	insert into @ErrorIdsTable values(6)
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