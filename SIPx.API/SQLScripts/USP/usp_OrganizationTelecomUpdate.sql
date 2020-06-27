CREATE PROCEDURE [dbo].[usp_OrganizationTelecomUpdate] (
	@OrganizationTelecomID int
	, @TelecomValue nvarchar(50)
	, @CountryCode nvarchar(10)
	, @AreaCode nvarchar(10)
	, @ExtensionCode nvarchar(10)
	, @AskFor nvarchar(50)
	, @UserID nvarchar(450)) 
AS 

BEGIN TRANSACTION

DECLARE @IsPhone bit;
SELECT @IsPhone = PhoneProperties FROM OrganizationTelecoms JOIN Telecomtypes ON OrganizationTelecoms.TelecomTypeID = Telecomtypes.TelecomTypeID 

UPDATE OrganizationTelecoms SET TelecomValue = @TelecomValue, ModifierID = @UserID, ModifiedDate = Getdate() WHERE OrganizationTelecomID = @OrganizationTelecomID
IF @IsPhone = 1
BEGIN
UPDATE OrganizationTelecomPhones SET CountryCode = @CountryCode, AreaCode = @AreaCode, ExtensionCode = @ExtensionCode, AskForName = @AskFor WHERE OrganizationTelecomID = @OrganizationTelecomID
END
COMMIT TRANSACTION


