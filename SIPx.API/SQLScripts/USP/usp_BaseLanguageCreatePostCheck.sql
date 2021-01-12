CREATE PROCEDURE usp_BaseLanguageCreatePostCheck (
	@BaseType varchar(50)
	, @BaseId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MouseOver nvarchar(50)
	, @MenuName nvarchar(50)
	, @UserId nvarchar(450))
AS
BEGIN
DECLARE @Count int;
DECLARE @statement NVARCHAR(max);
SET @statement = 'SELECT @Count = COUNT(*)  FROM ' 
+ @BaseType 
+ 'Languages WHERE ' + @BaseType + 'ID =  ' + CAST(@BaseId as varchar(10)) + ' AND LanguageID = ' + + CAST(@LanguageId as varchar(10))
EXECUTE sp_executesql @statement, N'@Count int output', @Count output 

DECLARE @ErrorIdsTable TABLE (id int)
IF @Count >0
BEGIN
insert into @ErrorIdsTable values(123)
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

