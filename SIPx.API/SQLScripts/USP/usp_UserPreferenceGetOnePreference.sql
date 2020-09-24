CREATE PROCEDURE usp_UserPreferenceGetOnePreference (@UserId nvarchar(450), @PreferenceTypeId int)
AS
SELECT IntPreference, StringPreference, DateTimePreference
FROM UserPreferences
WHERE UserId = @UserId 
	AND PreferenceTypeID = @PreferenceTypeId