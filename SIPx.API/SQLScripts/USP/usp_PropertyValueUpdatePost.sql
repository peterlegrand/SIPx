CREATE PROCEDURE usp_PropertyValueUpdatePost (
	@PropertyValueId int
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

DECLARE @PropertyTypeId int;
SELECT 
	@PropertyTypeId = Properties.PropertyTypeID 
FROM PropertyTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = PropertyTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PropertyTypes.NameTermID
JOIN Properties
	ON Properties.PropertyTypeID = PropertyTypes.PropertyTypeID
JOIN PropertyValues 
	ON Properties.PropertyID = PropertyValues.PropertyID
WHERE PropertyValues.PropertyValueID = @PropertyValueId


IF @PropertyTypeId = 10 or @PropertyTypeId = 11
BEGIN 
DECLARE @PropertyId int;
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence, @PropertyId = PropertyId FROM PropertyValues WHERE PropertyValueId = @PropertyValueID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE PropertyValues SET Sequence = Sequence + 1 WHERE Sequence >= @Sequence AND Sequence < @OldSequence AND @PropertyId = PropertyId 
END
ELSE
BEGIN
UPDATE PropertyValues SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence AND @PropertyId = PropertyId 
END

UPDATE PropertyValues SET 
	Sequence = @Sequence
	, PropertyValueBool = @PropertyValueBool
	, PropertyValueInt = @PropertyValueInt
	, PropertyValueString = @PropertyValueString
	, PropertyValueDate = @PropertyValueDate
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE PropertyValueId = @PropertyValueID

IF @PropertyTypeId = 9 OR @PropertyTypeId = 11
BEGIN
UPDATE  PropertyValueLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE PropertyValueID= @PropertyValueID
	AND LanguageId = @LanguageId
END
COMMIT TRANSACTION
END
ELSE
BEGIN
BEGIN TRANSACTION
UPDATE PropertyValues SET 
	Sequence = @Sequence
	, PropertyValueBool = @PropertyValueBool
	, PropertyValueInt = @PropertyValueInt
	, PropertyValueString = @PropertyValueString
	, PropertyValueDate = @PropertyValueDate
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE PropertyValueId = @PropertyValueID

IF @PropertyTypeId = 9 OR @PropertyTypeId = 11
BEGIN
UPDATE  PropertyValueLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE PropertyValueID= @PropertyValueID
	AND LanguageId = @LanguageId
END
COMMIT TRANSACTION

END
