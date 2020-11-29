CREATE PROCEDURE usp_ContentTypeGroupUpdatePostCheck (
	@ContentTypeGroupId int 
	, @Sequence int 
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

IF (SELECT COUNT(*) FROM ContentTypeGroups WHERE ContentTypeGroupId = @ContentTypeGroupId) = 0 
BEGIN
insert into @ErrorIdsTable values(44)
END


IF (SELECT MAX(Sequence) 
	FROM ContentTypeGroups ) < @Sequence + 1
BEGIN
	insert into @ErrorIdsTable values(3)
END

IF @Sequence < 1
BEGIN
	insert into @ErrorIdsTable values(4)
END


IF  (SELECT COUNT(*) 
	FROM ContentTypeGroupLanguages 
	WHERE LanguageId = @LanguageID
		AND ContentTypeGroupLanguages.Name = @Name AND ContentTypeGroupID <> @ContentTypeGroupId) >0
BEGIN
	insert into @ErrorIdsTable values(46)
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