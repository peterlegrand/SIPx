CREATE PROCEDURE [dbo].[usp_ClassificationCreatePostCheck] (
	@StatusId bit
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

IF @Name ='' OR @Name IS NULL
BEGIN
insert into @ErrorIdsTable values(104)
END

IF @Description =''  OR @Description IS NULL
BEGIN
insert into @ErrorIdsTable values(9)
END

IF @MenuName =''  OR @MenuName IS NULL
BEGIN
insert into @ErrorIdsTable values(10)
END

IF @MouseOver =''  OR @MouseOver IS NULL
BEGIN
insert into @ErrorIdsTable values(11)
END

IF @StatusId NOT IN (1,2) 
BEGIN
insert into @ErrorIdsTable values(1)
END


IF  @HasDropDown NOT IN (0,1) 
BEGIN
insert into @ErrorIdsTable values(2)
END
	
IF (SELECT MAX(DropDownSequence) 
	FROM Classifications ) < @DropDownSequence + 1
BEGIN
	insert into @ErrorIdsTable values(3)
END

IF @DropDownSequence < 1
BEGIN
	insert into @ErrorIdsTable values(4)

END

IF  (SELECT COUNT(*) 
	FROM ClassificationLanguages 
	WHERE LanguageId = @LanguageID
		AND ClassificationLanguages.Name = @Name) >0
BEGIN
	insert into @ErrorIdsTable values(5)
END

IF  (SELECT COUNT(*) 
	FROM Languages 
	WHERE LanguageId = @LanguageId AND languages.StatusId = 1
) =0
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