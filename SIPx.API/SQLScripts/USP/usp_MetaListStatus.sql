CREATE PROCEDURE [dbo].[usp_MetaListStatus]
AS
SELECT Statuses.StatusID, Name FROM Statuses JOIN UITermLanguages ON Statuses.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY Statuses.StatusID



