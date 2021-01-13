CREATE PROCEDURE usp_BaseLanguageCreateGetLanguageList (
	@BaseId int
	, @BaseType varchar(50)
	, @UserId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN
DECLARE @Statement nvarchar(max);
SET @Statement = 'SELECT Languages.LanguageId ' +
	' , ISNULL(Customization.Customization, UITermLanguages.Name) Name ' +
' FROM Languages ' +
' JOIN UITermLanguages ' +
	 ' ON Languages.NameTermID = UITermLanguages.UITermID ' +
' LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations WHERE LanguageID = ' +CAST(@LanguageId as varchar(10)) +' ) Customization ' +
	' ON Customization.UITermID = Languages.NameTermID ' +
' WHERE Languages.StatusId = 1 AND Languages.LanguageId NOT IN (SELECT LanguageID FROM  '+@BaseType+'Languages WHERE   ClassificationId = ' +CAST(@BaseId as varchar(10)) +' ) AND UITermLanguages.LanguageId = ' + CAST(@LanguageId as varchar(10))  +
' ORDER BY 	ISNULL(Customization.Customization, UITermLanguages.Name)  '

--select @statement
EXECUTE sp_executesql @statement
end

