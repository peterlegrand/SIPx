CREATE PROCEDURE usp_PersonTelecomDeletePost ( @PersonTelecomId int)
AS
BEGIN TRANSACTION
DELETE FROM PersonTelecomPhones 
WHERE PersonTelecomID = @PersonTelecomId
DELETE FROM PersonTelecoms 
WHERE PersonTelecomID = @PersonTelecomId
COMMIT TRANSACTION