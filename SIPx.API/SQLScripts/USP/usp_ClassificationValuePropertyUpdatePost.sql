CREATE PROCEDURE usp_ClassificationValuePropertyUpdatePost (
	@ClassificationValuePropertyId int
	, @PropertyInt int
	, @PropertyBool bit
	, @PropertyDate datetime
	, @PropertyString nvarchar(max)
	, @PropertyValueId int
	, @UserId nvarchar(450)) 
AS 
DECLARE @PropertyTypeId int;
SELECT @PropertyTypeId = PropertyTypeId 
FROM Properties
JOIN ClassificationValueProperties
	ON Properties.PropertyID = ClassificationValueProperties.PropertyID
WHERE ClassificationValuePropertyId = @ClassificationValuePropertyID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @PropertyTypeId = 1
BEGIN
UPDATE ClassificationValueProperties SET PropertyDate = @PropertyDate, ModifierID = @UserId , ModifiedDate = getdate() WHERE ClassificationValuePropertyId = @ClassificationValuePropertyId
END

IF @PropertyTypeId = 2
BEGIN
UPDATE ClassificationValueProperties SET PropertyInt = @PropertyInt, ModifierID = @UserId , ModifiedDate = getdate() WHERE ClassificationValuePropertyId = @ClassificationValuePropertyId
END

IF @PropertyTypeId = 3
BEGIN
UPDATE ClassificationValueProperties SET PropertyString = @PropertyString, ModifierID = @UserId , ModifiedDate = getdate() WHERE ClassificationValuePropertyId = @ClassificationValuePropertyId
END

IF @PropertyTypeId = 4
BEGIN
UPDATE ClassificationValueProperties SET PropertyBool = @PropertyBool, ModifierID = @UserId , ModifiedDate = getdate() WHERE ClassificationValuePropertyId = @ClassificationValuePropertyId
END

-- PETER TODO
--IF @PropertyTypeId = 5
--BEGIN
--UPDATE ClassificationValueProperties SET PropertyInt = @PropertyInt WHERE ClassificationValuePropertyId = @ClassificationValuePropertyId
--END

IF @PropertyTypeId >= 6  
BEGIN
UPDATE ClassificationValueProperties SET PropertyValueID = @PropertyValueId, ModifierID = @UserId , ModifiedDate = getdate() WHERE ClassificationValuePropertyId = @ClassificationValuePropertyId
END

COMMIT TRANSACTION

