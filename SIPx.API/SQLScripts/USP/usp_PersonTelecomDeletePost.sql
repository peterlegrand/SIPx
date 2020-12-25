CREATE PROCEDURE usp_PersonTelecomDeletePost ( @UserId nvarchar(450), @PersonTelecomId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM PersonTelecomPhones 
WHERE PersonTelecomID = @PersonTelecomId
DELETE FROM PersonTelecoms 
WHERE PersonTelecomID = @PersonTelecomId
COMMIT TRANSACTION