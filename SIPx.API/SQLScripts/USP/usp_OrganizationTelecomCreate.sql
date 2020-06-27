CREATE PROCEDURE [dbo].[usp_OrganizationTelecomCreate] (
	@OrganizationID int
	, @TelecomTypeID int
	, @TelecomValue nvarchar(50)
	, @CountryCode nvarchar(10)
	, @AreaCode nvarchar(10)
	, @ExtensionCode nvarchar(10)
	, @AskFor nvarchar(50)
	, @UserID nvarchar(450)) 
AS 

BEGIN TRANSACTION

INSERT INTO OrganizationTelecoms (OrganizationID, TelecomTypeID, TelecomValue, CreatorID, CreatedDate, ModifierID, ModifiedDate) VALUES (
	@OrganizationID, @TelecomTypeID, @TelecomValue, @UserID, getdate(), @UserID, getdate())

DECLARE @NewOrganizationTelecomID int	= scope_identity();

DECLARE @IsPhone bit;
SELECT @IsPhone = TelecomTypes.PhoneProperties FROM TelecomTypes WHERE  TelecomTypes.TelecomTypeID = @TelecomTypeID
IF @IsPhone = 1
BEGIN
INSERT INTO OrganizationTelecomPhones (OrganizationTelecomID, CountryCode, AreaCode, ExtensionCode, AskForName) VALUES (
	@NewOrganizationTelecomID, @CountryCode, @AreaCode, @ExtensionCode, @AskFor)
END
	COMMIT TRANSACTION


