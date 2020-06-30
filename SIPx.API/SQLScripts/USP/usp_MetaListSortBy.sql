CREATE PROCEDURE [dbo].[usp_MetaListSortBy]
AS
SELECT SortBys.SortById, Name FROM SortBys JOIN UITermLanguages ON SortBys.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY SortBys.SortByID



