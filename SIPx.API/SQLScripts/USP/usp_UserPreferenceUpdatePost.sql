CREATE PROCEDURE [dbo].[usp_UserPreferenceUpdatePost] (
	@UserPreferenceId int
	, @IntPreference int
	, @StringPreference nvarchar(max)
	, @DateTimePreference datetime
	, @CreatorId nvarchar(450))
AS 
DECLARE @Error varchar(500) = '';
DECLARE @Type int;
SELECT @Type = PreferenceTypeId FROM UserPreferences WHERE UserPreferenceID = @UserPreferenceId;

IF (@Type = 1 OR @Type = 2 )
BEGIN
UPDATE UserPreferences SET IntPreference = @IntPreference, ModifiedDate = getdate(), ModifierID = @CreatorId WHERE UserPreferenceID = @UserPreferenceId
END