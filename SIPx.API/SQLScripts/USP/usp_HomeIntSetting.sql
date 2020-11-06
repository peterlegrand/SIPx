create procedure usp_HomeIntSetting (@SettingId int)
as select IntValue  from settings where SettingID = @SettingId