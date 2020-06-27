CREATE PROCEDURE [dbo].[usp_PersonTelecomCreate] (
	@PersonID int
	, @TelecomTypeID int
	, @TelecomValue nvarchar(50)
	, @CountryCode nvarchar(10)
	, @AreaCode nvarchar(10)
	, @ExtensionCode nvarchar(10)
	, @AskFor nvarchar(50)
	, @UserID nvarchar(450)) 
AS 

BEGIN TRANSACTION

INSERT INTO PersonTelecoms (PersonID, TelecomTypeID, TelecomValue, CreatorID, CreatedDate, ModifierID, ModifiedDate) VALUES (
	@PersonID, @TelecomTypeID, @TelecomValue, @UserID, getdate(), @UserID, getdate())

DECLARE @NewPersonTelecomID int	= scope_identity();

DECLARE @IsPhone bit;
SELECT @IsPhone = TelecomTypes.PhoneProperties FROM TelecomTypes WHERE  TelecomTypes.TelecomTypeID = @TelecomTypeID
IF @IsPhone = 1
BEGIN
INSERT INTO PersonTelecomPhones (PersonTelecomID, CountryCode, AreaCode, ExtensionCode, AskForName) VALUES (
	@NewPersonTelecomID, @CountryCode, @AreaCode, @ExtensionCode, @AskFor)
END
	COMMIT TRANSACTION


