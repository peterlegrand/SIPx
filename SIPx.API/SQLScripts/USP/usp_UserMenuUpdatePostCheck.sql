CREATE PROCEDURE usp_UserMenuUpdatePostCheck (
	@UserMenuID int
	, @UserPageIdLeft int
	, @UserPageIdRight int
	, @UserMenuTypeIDLeft int
	, @UserMenuTypeIDRight int
	, @IconId Int
	, @Sequence int
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM UserMenus WHERE UserMenuId = @UserMenuID AND UserID = @UserId) = 0
BEGIN
insert into @ErrorIdsTable values(103)
END

IF (SELECT COUNT(*) FROM Pages WHERE PageId = @UserPageIdLeft AND (Pages.UserID = @UserId OR UserID IS NULL)) = 0
BEGIN
insert into @ErrorIdsTable values(99)
END

IF (SELECT COUNT(*) FROM Pages WHERE PageId = @UserPageIdRight AND (Pages.UserID = @UserId OR UserID IS NULL)) = 0
BEGIN
insert into @ErrorIdsTable values(100)
END

IF (SELECT COUNT(*) FROM UserMenuTypes WHERE UserMenuTypeID = @UserMenuTypeIDLeft) = 0
BEGIN
insert into @ErrorIdsTable values(101)
END

IF (SELECT COUNT(*) FROM UserMenuTypes WHERE UserMenuTypeID = @UserMenuTypeIDRight) = 0
BEGIN
insert into @ErrorIdsTable values(102)
END

IF (SELECT COUNT(*) FROM Icons WHERE IconID = @IconId) = 0
BEGIN
insert into @ErrorIdsTable values(8)
END

--PETER TODO When update no need for + 1. Is this correct and if so, need to be changed everywhere.
IF (SELECT MAX(Sequence) 
	FROM UserMenus WHERE UserID = @UserId ) < @Sequence --+ 1
BEGIN
	insert into @ErrorIdsTable values(3)
END

IF @Sequence < 1
BEGIN
	insert into @ErrorIdsTable values(4)

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
