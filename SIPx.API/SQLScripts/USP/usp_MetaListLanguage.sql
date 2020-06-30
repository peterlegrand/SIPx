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
	ON Statuses.StatusId = Languages.StatusID
JOIN UITermLanguages StatusLanguage
		ON Statuses.NameTermId = StatusLanguage.UITermId  
JOIN UITermLanguages LangLanguage
		ON Languages.NameTermId = LangLanguage.UITermId  
WHERE StatusLanguage.LanguageId =41  and LangLanguage.LanguageId = 41
ORDER BY LangLanguage.Name


