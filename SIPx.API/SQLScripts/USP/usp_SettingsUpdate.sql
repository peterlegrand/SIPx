CREATE PROCEDURE [dbo].[usp_SettingsUpdate] (
	@SettingID int
	, @IntValue int
	, @StringValue nvarchar(max)
	, @DateTimeValue DateTime
	, @GuidValue UniqueIdentifier
	, @User nvarchar(450)) 
AS 
UPDATE Settings SET 
	IntValue = @IntValue 
	, StringValue  = @StringValue 
	, DateTimeValue = @DateTimeValue 
	, GuidValue = @GuidValue 
	, ModifierID = @User
	, ModifiedDate = GETDATE()
WHERE SettingID = @SettingID
