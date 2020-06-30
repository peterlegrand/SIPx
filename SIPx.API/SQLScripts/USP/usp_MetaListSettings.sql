CREATE PROCEDURE [dbo].[usp_MetaListSettings]
AS
SELECT 
	Settings.SettingID
	, Name 
	, Settings.IntValue
	, Settings.StringValue
	, Settings.DateTimeValue
	,Settings.GuidValue
FROM Settings JOIN UITermLanguages ON Settings.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY Settings.SettingID
