CREATE PROCEDURE [dbo].[usp_MetaListSortBy]
AS
SELECT SortBys.SortByID, Name FROM SortBys JOIN UITermLanguages ON SortBys.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY SortBys.SortByID



