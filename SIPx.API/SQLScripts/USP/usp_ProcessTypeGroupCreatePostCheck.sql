CREATE PROCEDURE usp_ProcessTypeGroupCreatePostCheck (
	@Sequence int
	, @Name nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT MAX(Sequence) 
	FROM ProcessTypeGroups ) < @Sequence + 1
BEGIN
	insert into @ErrorIdsTable values(3)
END

IF @Sequence < 1
BEGIN
	insert into @ErrorIdsTable values(4)

END

IF  (SELECT COUNT(*) 
	FROM ProcessTypeGroupLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name ) > 0
BEGIN
	insert into @ErrorIdsTable values(93)
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
