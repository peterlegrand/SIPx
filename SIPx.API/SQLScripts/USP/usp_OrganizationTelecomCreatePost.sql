CREATE PROCEDURE usp_OrganizationTelecomCreatePost (
	@OrganizationId int
	, @TelecomTypeId int
	, @TelecomValue nvarchar(50)
	, @CountryCode nvarchar(10)
	, @AreaCode nvarchar(10)
	, @ExtensionCode nvarchar(10)
	, @AskForName nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO OrganizationTelecoms (OrganizationId, TelecomTypeId, TelecomValue, CreatorId, CreatedDate, ModifierId, ModifiedDate) VALUES (
	@OrganizationId, @TelecomTypeId, @TelecomValue, @UserId, getdate(), @UserId, getdate())

DECLARE @NewOrganizationTelecomId int	= scope_identity();

DECLARE @IsPhone bit;
SELECT @IsPhone = TelecomTypes.PhoneProperties FROM TelecomTypes WHERE  TelecomTypes.TelecomTypeId = @TelecomTypeID
IF @IsPhone = 1
BEGIN
INSERT INTO OrganizationTelecomPhones (OrganizationTelecomId, CountryCode, AreaCode, ExtensionCode, AskForName) VALUES (
	@NewOrganizationTelecomId, @CountryCode, @AreaCode, @ExtensionCode, @AskForName)
END
	COMMIT TRANSACTION


