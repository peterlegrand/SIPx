CREATE PROCEDURE usp_PersonTelecomDeletePost ( @PersonTelecomId int)
AS
DELETE FROM PersonTelecoms 
WHERE PersonTelecomID = @PersonTelecomId
