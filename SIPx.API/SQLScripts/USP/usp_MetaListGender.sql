CREATE PROCEDURE [dbo].[usp_MetaListGender]
AS
SELECT Genders.GenderId, Name FROM Genders JOIN UITermLanguages ON Genders.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY Genders.GenderID



