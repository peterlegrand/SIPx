CREATE PROCEDURE usp_PropertyValueCreatePost (
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
DECLARE @PropertyTypeId int;
SELECT @PropertyTypeId = PropertyTypeId FROM Properties WHERE PropertyId = @PropertyId;
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


