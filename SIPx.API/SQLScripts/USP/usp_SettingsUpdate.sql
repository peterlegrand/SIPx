CREATE PROCEDURE [dbo].[usp_SettingsUpdate] (
	@SettingId int
	, @IntValue int
	, @StringValue nvarchar(max)
	, @DateTimeValue DateTime
	, @GuidValue UniqueIdentifier
	, @UserId nvarchar(450)) 
AS 
UPDATE Settings SET 
	IntValue = @IntValue 
	, StringValue  = @StringValue 
	, DateTimeValue = @DateTimeValue 
	, GuidValue = @GuidValue 
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE SettingId = @SettingID
