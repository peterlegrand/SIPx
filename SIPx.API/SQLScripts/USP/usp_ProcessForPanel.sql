CREATE PROCEDURE usp_ProcessForPanel (
	@UserId nvarchar(450)
	, @ProcessConditionSQLFrom nvarchar(max)
	, @ProcessConditionSQLWhere nvarchar(max)
	, @ProcessConditionSQLContains nvarchar(max)) 
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @statement NVARCHAR(2200);

SET @statement = TRIM(@ProcessConditionSQLFrom) +  
' JOIN ProcessTemplateLanguages ON ProcessTemplates.ProcessTemplateID = ProcessTemplateLanguages.ProcessTemplateID ' + TRIM(@ProcessConditionSQLWhere) +
' AND ProcessTemplateLanguages.LanguageId = ' + cast (@LanguageId as varchar(2))

EXECUTE sp_executesql @statement

