CREATE PROCEDURE [dbo].[usp_MetaListSecurityLevel]
AS
SELECT SecurityLevels.SecurityLevelID, Name FROM SecurityLevels JOIN UITermLanguages ON SecurityLevels.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY SecurityLevels.SecurityLevelID
