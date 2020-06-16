CREATE PROCEDURE [dbo].[usp_MetaListGender]
AS
SELECT Genders.GenderID, Name FROM Genders JOIN UITermLanguages ON Genders.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY Genders.GenderID



