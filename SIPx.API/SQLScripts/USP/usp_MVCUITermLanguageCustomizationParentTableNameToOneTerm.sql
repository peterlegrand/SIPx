CREATE PROCEDURE usp_MVCUITermLanguageCustomizationParentTableNameToOneTerm (@ChildTableName nvarchar(450), @UserId nvarchar(450), @IsPlural bit, @Prefix varchar(100), @Suffix varchar(100)
)
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

DECLARE @InternalName varchar(100);
IF @IsPlural = 1
BEGIN
SELECT @InternalName = Parent.InternalNamePlural FROM DataDictionaryTables Parent JOIN DataDictionaryTables Child ON Parent.TableId = Child.ParentTableId WHERE Child.TableName = @ChildTableName
END 
ELSE
BEGIN
SELECT @InternalName = Parent.InternalName FROM DataDictionaryTables Parent JOIN DataDictionaryTables Child ON Parent.TableId = Child.ParentTableId WHERE Child.TableName = @ChildTableName
END

IF @Prefix <> ''
BEGIN
SET @InternalName = TRIM(@Prefix) + ' ' + LOWER(@InternalName)
END

IF @Suffix <> ''
BEGIN
SET @InternalName =  @InternalName + ' ' + TRIM(@Suffix)
END

SELECT ISNULL(Customization.Customization, UITermLanguages.Name) TermString
FROM UITerms 
JOIN UITermLanguages
	ON UITermLanguages.UITermID = UITerms.UITermID 
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations WHERE @LanguageID = LanguageID) Customization
ON Customization.UITermID = UITerms.UITermID 
WHERE InternalName = @InternalName
	AND UITermLanguages.LanguageID = @LanguageID

