CREATE PROCEDURE [dbo].[usp_ProjectCreatePostCheck] (
	@ParentProjectId int
	, @ProjectTypeId int 
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

IF (SELECT COUNT(*) FROM Projects WHERE ProjectId = @ParentProjectId) = 0 OR @ParentProjectId IS NULL
BEGIN
insert into @ErrorIdsTable values(57)
END


IF (SELECT COUNT(*) FROM ProjectTypes WHERE ProjectTypeId= @ProjectTypeId) = 0
BEGIN
insert into @ErrorIdsTable values(52)
END

IF  (SELECT COUNT(*) 
	FROM ProjectLanguages 
	WHERE LanguageId = @LanguageID
		AND ProjectLanguages.Name = @Name) >0
BEGIN
	insert into @ErrorIdsTable values(53)
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
