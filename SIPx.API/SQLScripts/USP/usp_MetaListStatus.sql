CREATE PROCEDURE [dbo].[usp_MetaListStatus]
AS
SELECT Statuses.StatusId, Name FROM Statuses JOIN UITermLanguages ON Statuses.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY Statuses.StatusID



