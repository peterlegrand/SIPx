CREATE PROCEDURE usp_ClassificationUpdatePostCheck (
	@ClassificationId int
	, @StatusId int
	, @DefaultPageId int
	, @HasDropDown bit
	, @DropDownSequence int
	, @Name nvarchar(50)
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

IF @Name ='' 
BEGIN
insert into @ErrorIdsTable values(104)
END

IF @Description ='' 
BEGIN
insert into @ErrorIdsTable values(9)
END

IF @MenuName ='' 
BEGIN
insert into @ErrorIdsTable values(10)
END

IF @MouseOver ='' 
BEGIN
insert into @ErrorIdsTable values(11)
END


IF (SELECT COUNT(*) FROM Classifications WHERE ClassificationID = @ClassificationId) =0
BEGIN
insert into @ErrorIdsTable values(12)
END


IF @StatusId NOT IN (1,2) 
BEGIN
insert into @ErrorIdsTable values(1)
END
--PETER TODO Check if the default page exists

IF  @HasDropDown NOT IN (0,1) 
BEGIN
insert into @ErrorIdsTable values(2)
END
	
IF (SELECT MAX(DropDownSequence) 
	FROM Classifications ) < @DropDownSequence
BEGIN
	insert into @ErrorIdsTable values(3)
END

IF @DropDownSequence < 1
BEGIN
	insert into @ErrorIdsTable values(4)
END


IF  (SELECT COUNT(*) 
	FROM ClassificationLanguages 
	WHERE LanguageId <> @LanguageId
		AND ClassificationLanguages.ClassificationId = @ClassificationId) > 0
BEGIN
	insert into @ErrorIdsTable values(5)
--	SET @Error = @Error + ' - This classification name for this language already exists'
END
IF  (SELECT COUNT(*) 
	FROM Languages 
	WHERE LanguageId = @LanguageId AND languages.StatusId = 1
) =0
BEGIN
	insert into @ErrorIdsTable values(6)

--	SET @Error = @Error + ' - The language is not active'
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