CREATE PROCEDURE [dbo].[usp_MetaListDateLevel]
AS
SELECT DateLevels.DateLevelID, Name FROM DateLevels JOIN UITermLanguages ON DateLevels.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY DateLevels.DateLevelID



