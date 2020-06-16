CREATE PROCEDURE [dbo].[usp_MetaListSettings]
AS
SELECT 
	Settings.SettingID
	, Name 
	, Settings.IntValue
	, Settings.StringValue
	, Settings.DateTimeValue
	,Settings.GuidValue
FROM Settings JOIN UITermLanguages ON Settings.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY Settings.SettingID
