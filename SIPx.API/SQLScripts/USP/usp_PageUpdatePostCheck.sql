CREATE PROCEDURE usp_PageUpdatePostCheck (
	@PageId int
	, @StatusId int
	, @Name nvarchar(50)
	, @UserId nvarchar(450)
	, @OrganizationId int
	, @ProjectId int
	, @ClassificationId int
	, @SelectedUserId nvarchar(450))
	AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM Pages WHERE PageId = @PageId) = 0 
BEGIN
insert into @ErrorIdsTable values(1)
END

IF (SELECT COUNT(*) FROM Statuses WHERE StatusId = @StatusId) = 0 
BEGIN
insert into @ErrorIdsTable values(1)
END

IF (SELECT COUNT(*) FROM Organizations WHERE OrganizationId = @OrganizationId) = 0 OR @OrganizationId IS NULL 
BEGIN
insert into @ErrorIdsTable values(48)
END

IF (SELECT COUNT(*) FROM Projects WHERE ProjectId = @ProjectId) = 0 OR @ProjectId IS NULL 
BEGIN
insert into @ErrorIdsTable values(57)
END

IF (SELECT COUNT(*) FROM AspNetUsers WHERE ID = @SelectedUserId) = 0 OR @SelectedUserId IS NULL 
BEGIN
insert into @ErrorIdsTable values(58)
END

IF (SELECT COUNT(*) FROM Classifications WHERE ClassificationId = @ClassificationId) = 0 OR @ClassificationId IS NULL 
BEGIN
insert into @ErrorIdsTable values(12)
END


IF  (SELECT COUNT(*) 
	FROM PageLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name AND PageId <> @PageId ) >0
BEGIN
	insert into @ErrorIdsTable values(56)
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