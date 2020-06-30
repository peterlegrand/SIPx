CREATE PROCEDURE [dbo].[usp_MetaListSecurityLevel]
AS
SELECT SecurityLevels.SecurityLevelId, Name FROM SecurityLevels JOIN UITermLanguages ON SecurityLevels.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY SecurityLevels.SecurityLevelID
