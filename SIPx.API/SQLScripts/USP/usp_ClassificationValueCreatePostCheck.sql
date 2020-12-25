CREATE PROCEDURE usp_ClassificationValueCreatePostCheck (
	@ClassificationId int
	, @ParentId int = NULL
	, @DateFrom datetime = NULL
	, @DateTo datetime = NULL
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @DropDownName nvarchar(50)
	, @PageName nvarchar(50)
	, @PageDescription nvarchar(max)
	, @HeaderName nvarchar(50)
	, @HeaderDescription nvarchar(max)
	, @TopicName nvarchar(50)
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

IF @DropDownName ='' OR @DropDownName IS NULL
BEGIN
insert into @ErrorIdsTable values(123)
END

IF @PageName ='' OR @PageName IS NULL
BEGIN
insert into @ErrorIdsTable values(124)
END

IF @PageDescription ='' OR @PageDescription IS NULL
BEGIN
insert into @ErrorIdsTable values(125)
END

IF @HeaderName ='' OR @HeaderName IS NULL
BEGIN
insert into @ErrorIdsTable values(126)
END

IF @HeaderDescription ='' OR @HeaderDescription IS NULL
BEGIN
insert into @ErrorIdsTable values(127)
END

IF @TopicName ='' OR @TopicName IS NULL
BEGIN
insert into @ErrorIdsTable values(128)
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