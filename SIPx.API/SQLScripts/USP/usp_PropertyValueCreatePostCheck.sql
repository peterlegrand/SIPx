CREATE PROCEDURE usp_PropertyValueCreatePostCheck (
	@PropertyId int
	, @Sequence int =0
	, @PropertyValueInt int = 0
	, @PropertyValueString nvarchar(max) = null
	, @PropertyValueBool bit = null
	, @PropertyValueDate DateTime = null
	, @Name nvarchar(50) = null
	, @Description nvarchar(max) = null
	, @MenuName nvarchar(50) = null
	, @MouseOver nvarchar(50) = null
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


BEGIN 

DECLARE @ErrorIdsTable TABLE (id int)

--PETER TODO Need to figure out a lot here.
IF  (SELECT COUNT(*) 
	FROM Properties 
	WHERE PropertyId = @PropertyID) = 0
BEGIN
	insert into @ErrorIdsTable values(22)
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