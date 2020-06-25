CREATE PROCEDURE [dbo].[usp_UserPreferenceUpdate] (
	@UserPreferenceID Int
	, @StringPreference nvarchar(max)
	, @IntPreference int
	, @DateTimePreference Datetime
	, @GuidPreference Uniqueidentifier
	, @LocationPreference Geography) 
AS 
UPDATE UserPreferences SET 
	StringPreference = @StringPreference
	, IntPreference = @IntPreference
	, DateTimePreference = @DateTimePreference
	, GuidPreference = @GuidPreference
	, LocationPreference = @LocationPreference
WHERE UserPreferences.UserPreferenceID = @UserPreferenceID


