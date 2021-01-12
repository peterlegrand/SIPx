CREATE PROCEDURE usp_BaseLanguageDeleteGet (
	@BaseType varchar(50)
	, @BaseLanguageId int
	, @UserId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN
DECLARE @statement NVARCHAR(max);
SET @statement = 'SELECT ' +
@BaseType + 'LanguageId  '+
', ' + @BaseType + 'Languages.Name ' +
', ' + @BaseType + 'Languages.Description ' +
', ' + @BaseType + 'Languages.MouseOver ' +
', ' + @BaseType + 'Languages.MenuName ' +
	', Creator.FirstName + '' '' + Creator.LastName CreatorName '+
	', Creator.PersonID CreatorID '+
	',' + @BaseType + 'Languages.CreatedDate '+
	', Modifier.FirstName + '' '' + Modifier.LastName ModifierName '+
	', Modifier.PersonID ModifierID '+
	', ' +@BaseType + 'Languages.ModifiedDate '+
	', ISNULL(UITermLanguageCustomizations.Customization,UITermLanguages.Name) LanguageName ' +
	' FROM '+
+ @BaseType +
+ 'Languages '+
' JOIN Persons Creator '+
	' ON Creator.UserId = ' + @BaseType + 'Languages.CreatorID '+
' JOIN Persons Modifier '+
	' ON Modifier.UserId = ' + @BaseType + 'Languages.ModifierID '+
	' JOIN Languages ON Languages.LanguageId = ' + @BaseType + 'Languages.LanguageId ' +
	' JOIN UITermLanguages ON Languages.NameTermId = UITermLanguages.UITermId ' +
	' Left JOIN (SELECT * FROM UITermLanguageCustomizations WHERE LanguageId = '+CAST(@LanguageId as varchar(10))+')  UITermLanguageCustomizations ON UITermLanguageCustomizations.UITermId = Languages.NameTermId ' +
' WHERE ' +@BaseType + 'LanguageId = ' + 
CAST(@BaseLanguageId as varchar(10)) +
' AND UITermLanguages.LanguageId =  ' +CAST(@LanguageId as varchar(10)) 
--select @statement
EXECUTE sp_executesql @statement
end

