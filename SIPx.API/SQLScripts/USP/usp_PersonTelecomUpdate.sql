CREATE PROCEDURE [dbo].[usp_PersonTelecomUpdate] (
	@PersonTelecomId int
	, @TelecomValue nvarchar(50)
	, @CountryCode nvarchar(10)
	, @AreaCode nvarchar(10)
	, @ExtensionCode nvarchar(10)
	, @AskFor nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

BEGIN TRANSACTION

DECLARE @IsPhone bit;
SELECT @IsPhone = PhoneProperties FROM PersonTelecoms JOIN Telecomtypes ON PersonTelecoms.TelecomTypeId = Telecomtypes.TelecomTypeId 

UPDATE PersonTelecoms SET TelecomValue = @TelecomValue, ModifierId = @UserId, ModifiedDate = Getdate() WHERE PersonTelecomId = @PersonTelecomID
IF @IsPhone = 1
BEGIN
UPDATE PersonTelecomPhones SET CountryCode = @CountryCode, AreaCode = @AreaCode, ExtensionCode = @ExtensionCode, AskForName = @AskFor WHERE PersonTelecomId = @PersonTelecomID
END
COMMIT TRANSACTION


