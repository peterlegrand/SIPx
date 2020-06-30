CREATE PROCEDURE [dbo].[usp_PersonTelecomDelete] (
	@PersonTelecomId int) 
AS 

BEGIN TRANSACTION

DELETE FROM  PersonTelecoms  WHERE PersonTelecomId = @PersonTelecomID
DELETE FROM PersonTelecomPhones WHERE PersonTelecomId = @PersonTelecomID
COMMIT TRANSACTION


