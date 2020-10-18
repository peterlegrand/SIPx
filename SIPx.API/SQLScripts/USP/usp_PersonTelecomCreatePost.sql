CREATE PROCEDURE [dbo].[usp_PersonTelecomCreatePost] (
	@PersonId int
	, @TelecomTypeId int
	, @TelecomValue nvarchar(50)
	, @CountryCode nvarchar(10)
	, @AreaCode nvarchar(10)
	, @ExtensionCode nvarchar(10)
	, @AskForName nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

BEGIN TRANSACTION

INSERT INTO PersonTelecoms (PersonId, TelecomTypeId, TelecomValue, CreatorId, CreatedDate, ModifierId, ModifiedDate) VALUES (
	@PersonId, @TelecomTypeId, @TelecomValue, @UserId, getdate(), @UserId, getdate())

DECLARE @NewPersonTelecomId int	= scope_identity();

DECLARE @IsPhone bit;
SELECT @IsPhone = TelecomTypes.PhoneProperties FROM TelecomTypes WHERE  TelecomTypes.TelecomTypeId = @TelecomTypeID
IF @IsPhone = 1
BEGIN
INSERT INTO PersonTelecomPhones (PersonTelecomId, CountryCode, AreaCode, ExtensionCode, AskForName) VALUES (
	@NewPersonTelecomId, @CountryCode, @AreaCode, @ExtensionCode, @AskForName)
END
	COMMIT TRANSACTION


