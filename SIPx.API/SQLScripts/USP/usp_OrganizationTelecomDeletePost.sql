CREATE PROCEDURE usp_OrganizationTelecomDeletePost ( @OrganizationTelecomId int)
AS
BEGIN TRANSACTION
DELETE FROM OrganizationTelecomPhones 
WHERE OrganizationTelecomID = @OrganizationTelecomId
DELETE FROM OrganizationTelecoms 
WHERE OrganizationTelecomID = @OrganizationTelecomId
COMMIT TRANSACTION