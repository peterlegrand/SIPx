CREATE PROCEDURE [dbo].[usp_MetaListProcessTemplateFieldTypes]
AS
SELECT ProcessTemplateFieldTypes.ProcessTemplateFieldTypeID, Name
FROM ProcessTemplateFieldTypes 
JOIN UITermLanguages
	ON ProcessTemplateFieldTypes.NameTermID = UITermLanguages.UITermID
WHERE LanguageID =41 
ORDER BY Name