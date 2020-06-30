CREATE PROCEDURE [dbo].[usp_OrganizationTelecomUpdate] (
	@OrganizationTelecomId int
	, @TelecomValue nvarchar(50)
	, @CountryCode nvarchar(10)
	, @AreaCode nvarchar(10)
	, @ExtensionCode nvarchar(10)
	, @AskFor nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

BEGIN TRANSACTION

DECLARE @IsPhone bit;
SELECT @IsPhone = PhoneProperties FROM OrganizationTelecoms JOIN Telecomtypes ON OrganizationTelecoms.TelecomTypeId = Telecomtypes.TelecomTypeId 

UPDATE OrganizationTelecoms SET TelecomValue = @TelecomValue, ModifierId = @UserId, ModifiedDate = Getdate() WHERE OrganizationTelecomId = @OrganizationTelecomID
IF @IsPhone = 1
BEGIN
UPDATE OrganizationTelecomPhones SET CountryCode = @CountryCode, AreaCode = @AreaCode, ExtensionCode = @ExtensionCode, AskForName = @AskFor WHERE OrganizationTelecomId = @OrganizationTelecomID
END
COMMIT TRANSACTION


