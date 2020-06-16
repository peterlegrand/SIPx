CREATE PROCEDURE [dbo].[usp_MetaListLanguage]
AS
SELECT 
	 Languages.LanguageID
	 ,Languages.ForeignName
	 ,Languages.ISO6391
	 ,Languages.ISO6392
	 , StatusLanguage.Name StatusName
	 , LangLanguage.Name
FROM Languages 
JOIN STatuses	
	ON Statuses.StatusID = Languages.StatusID
JOIN UITermLanguages StatusLanguage
		ON Statuses.NameTermID = StatusLanguage.UITermID  
JOIN UITermLanguages LangLanguage
		ON Languages.NameTermID = LangLanguage.UITermID  
WHERE StatusLanguage.LanguageID =41  and LangLanguage.LanguageID = 41
ORDER BY LangLanguage.Name


