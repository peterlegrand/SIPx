CREATE PROCEDURE [dbo].[usp_UserPreferenceUpdatePostCheck] (
	@UserPreferenceId int
	, @IntPreference int
	, @StringPreference nvarchar(max)
	, @DateTimePreference datetime
	, @CreatorId nvarchar(450))
AS 
BEGIN 
DECLARE @Error varchar(500) = '';
DECLARE @Type int;
SELECT @Type = PreferenceTypeId FROM UserPreferences WHERE UserPreferenceID = @UserPreferenceId;

IF @Type = 1
BEGIN
	IF (SELECT COUNT(*) FROM Languages WHERE Languages.StatusID = 1 AND LanguageID = @IntPreference ) = 0
	BEGIN
	SET @Error = @Error + ' - No language is selected '
	END
END

IF @Type = 2
BEGIN
	IF (SELECT COUNT(*) FROM Pages WHERE PageID = @IntPreference AND (Pages.UserID IS NULL OR Pages.UserID = @CreatorId)) = 0
	BEGIN
	SET @Error = @Error + ' - No page is selected '
	END
END


IF (SELECT COUNT(*) 
	FROM AspNetUsers WHERE @CreatorId = Id ) = 0
BEGIN
	SET @Error = @Error + ' - No user is selected '
END

SELECT @Error;

END