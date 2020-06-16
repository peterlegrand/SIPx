CREATE PROCEDURE [dbo].[usp_MetaListContentStatus]
AS
SELECT ContentStatuses.ContentStatusID, Name FROM ContentStatuses JOIN UITermLanguages ON ContentStatuses.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY ContentStatuses.ContentStatusID
