CREATE PROCEDURE usp_BaseLanguageDeletePostCheck (
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
DECLARE @Count int;
DECLARE @statement NVARCHAR(max);
SET @statement = 'SELECT @Count = COUNT(*)  FROM ' 
+ @BaseType 
+ 'Languages WHERE ' + @BaseType + 'LanguageID =  ' + CAST(@BaseLanguageId as varchar(10)) 
EXECUTE sp_executesql @statement, N'@Count int output', @Count output 

DECLARE @ErrorIdsTable TABLE (id int)
IF @Count = 0
BEGIN
insert into @ErrorIdsTable values(124)
END

SELECT ErrorMessages.ErrorMessageID
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM @ErrorIdsTable Errors 
JOIN ErrorMessages 
	ON Errors.id = ErrorMessages.ErrorMessageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = ErrorMessages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ErrorMessages.NameTermID
WHERE UIName.LanguageId = @LanguageID

END

