CREATE PROCEDURE [dbo].[usp_SettingUpdatePost] (
	@SettingId int
	, @IntValue int 
	, @StringValue nvarchar(max) 
	, @DateTimeValue datetime 
	, @ModifierId nvarchar(450)) 
AS 

UPDATE Settings 
SET IntValue = @Intvalue
	, StringValue = @StringValue
	, DateTimeValue = @DateTimeValue
	, ModifierID = @ModifierId
	, ModifiedDate = getdate()
WHERE SettingID = @SettingId