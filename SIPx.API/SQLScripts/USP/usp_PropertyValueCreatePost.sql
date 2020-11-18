CREATE PROCEDURE usp_PropertyValueCreatePost (
	@PropertyId int
	, @PropertyTypeId int
	, @Sequence int
	, @PropertyValueInt int = null
	, @PropertyValueString nvarchar(max) = null
	, @PropertyValueBool bit = null
	, @PropertyValueDate DateTime = null
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN TRANSACTION
UPDATE PropertyValues SET Sequence = Sequence + 1 
WHERE PropertyId = @PropertyId 
	AND Sequence >= @Sequence

INSERT INTO PropertyValues (
	PropertyId 
	, Sequence 
	, PropertyValueInt 
	, PropertyValueDate 
	, PropertyValueString 
	, PropertyValueBool 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate) 
VALUES (
	@PropertyId 
	, @Sequence 
	, @PropertyValueInt 
	, @PropertyValueDate 
	, @PropertyValueString 
	, @PropertyValueBool 
	, @UserId  
	, getdate()
	, @UserID
	, getdate())

IF @PropertyTypeId = 9 OR @PropertyTypeId = 11  
BEGIN
DECLARE @NewPropertyValueId int	= scope_identity();

INSERT INTO PropertyValueLanguages (
	PropertyValueID
	, PropertyID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewPropertyValueId 
	, @PropertyId
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())
END

	COMMIT TRANSACTION


