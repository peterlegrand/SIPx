CREATE PROCEDURE [dbo].[usp_MetaListProcessTemplateFieldTypes]
AS
SELECT ProcessTemplateFieldTypes.ProcessTemplateFieldTypeId, Name
FROM ProcessTemplateFieldTypes 
JOIN UITermLanguages
	ON ProcessTemplateFieldTypes.NameTermId = UITermLanguages.UITermID
WHERE LanguageId =41 
ORDER BY Name