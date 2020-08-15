CREATE PROCEDURE [dbo].[usp_UserMenuCreatePostCheck] (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserPageIdLeft int
	, @UserPageIdRight int
	, @IconId int
	, @Sequence int
	, @CreatorId nvarchar(450))  
AS 
BEGIN 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @Error varchar(500) = '';


IF (SELECT MAX(Sequence) 
	FROM UserMenus WHERE UserId = @CreatorId) < @Sequence + 1
BEGIN
	SET @Error = @Error + ' - sequence is bigger than current max value '
END

IF @Sequence < 0
BEGIN
	SET @Error = @Error + ' - sequence cannot be 0 '
END

IF  (SELECT COUNT(*) 
	FROM UserMenus 
	WHERE UserMenus .Name = @Name
) >0
BEGIN
	SET @Error = @Error + ' - This name already exists'
END

SELECT @Error;

END