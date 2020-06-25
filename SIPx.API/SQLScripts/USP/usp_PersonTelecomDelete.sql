CREATE PROCEDURE [dbo].[usp_PersonTelecomDelete] (
	@PersonTelecomID int) 
AS 

BEGIN TRANSACTION

DELETE FROM  PersonTelecoms  WHERE PersonTelecomID = @PersonTelecomID
DELETE FROM PersonTelecomPhones WHERE PersonTelecomID = @PersonTelecomID
COMMIT TRANSACTION


