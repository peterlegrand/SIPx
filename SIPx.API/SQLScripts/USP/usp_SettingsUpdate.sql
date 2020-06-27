CREATE PROCEDURE [dbo].[usp_SettingsUpdate] (
	@SettingID int
	, @IntValue int
	, @StringValue nvarchar(max)
	, @DateTimeValue DateTime
	, @GuidValue UniqueIdentifier
	, @UserID nvarchar(450)) 
AS 
UPDATE Settings SET 
	IntValue = @IntValue 
	, StringValue  = @StringValue 
	, DateTimeValue = @DateTimeValue 
	, GuidValue = @GuidValue 
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE SettingID = @SettingID
