CREATE PROCEDURE [dbo].[usp_MetaListContentStatus]
AS
SELECT ContentStatuses.ContentStatusId, Name FROM ContentStatuses JOIN UITermLanguages ON ContentStatuses.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ContentStatuses.ContentStatusID
