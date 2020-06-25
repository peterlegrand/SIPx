CREATE PROCEDURE [dbo].[usp_PersonTelecomUpdate] (
	@PersonTelecomID int
	, @TelecomValue nvarchar(50)
	, @CountryCode nvarchar(10)
	, @AreaCode nvarchar(10)
	, @ExtensionCode nvarchar(10)
	, @AskFor nvarchar(50)
	, @User nvarchar(450)) 
AS 

BEGIN TRANSACTION

DECLARE @IsPhone bit;
SELECT @IsPhone = PhoneProperties FROM PersonTelecoms JOIN Telecomtypes ON PersonTelecoms.TelecomTypeID = Telecomtypes.TelecomTypeID 

UPDATE PersonTelecoms SET TelecomValue = @TelecomValue, ModifierID = @User, ModifiedDate = Getdate() WHERE PersonTelecomID = @PersonTelecomID
IF @IsPhone = 1
BEGIN
UPDATE PersonTelecomPhones SET CountryCode = @CountryCode, AreaCode = @AreaCode, ExtensionCode = @ExtensionCode, AskForName = @AskFor WHERE PersonTelecomID = @PersonTelecomID
END
COMMIT TRANSACTION


