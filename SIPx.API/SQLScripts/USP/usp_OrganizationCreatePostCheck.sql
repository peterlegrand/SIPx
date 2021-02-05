CREATE PROCEDURE usp_OrganizationCreatePostCheck (
	 @ParentOrganizationId int
	, @CodePrefix nvarchar(25)
	, @CodeInt Int
	, @CodeSuffix nvarchar(25)
	, @Code nvarchar(50)
	, @StatusId int 
	, @OrganizationTypeId int 
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

IF (SELECT COUNT(*) FROM Organizations WHERE OrganizationId = @ParentOrganizationId) = 0 OR @ParentOrganizationId IS NULL
BEGIN
insert into @ErrorIdsTable values(48)
END

IF (SELECT COUNT(*) FROM Organizations WHERE OrganizationId = @ParentOrganizationId) = 0 OR @ParentOrganizationId IS NULL
BEGIN
insert into @ErrorIdsTable values(51)
END

IF (SELECT COUNT(*) FROM Statuses WHERE StatusId= @StatusId) = 0
BEGIN
insert into @ErrorIdsTable values(23)
END

IF (SELECT COUNT(*) FROM OrganizationTypes WHERE OrganizationTypeId= @OrganizationTypeId) = 0
BEGIN
insert into @ErrorIdsTable values(52)
END



--PETER TODO Add a check for process type which includes if primary content is a field for that.
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