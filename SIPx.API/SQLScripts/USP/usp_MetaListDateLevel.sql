CREATE PROCEDURE [dbo].[usp_MetaListDateLevel]
AS
SELECT DateLevels.DateLevelId, Name FROM DateLevels JOIN UITermLanguages ON DateLevels.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY DateLevels.DateLevelID



