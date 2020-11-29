CREATE PROCEDURE usp_OrganizationTelecomDeletePost ( @OrganizationTelecomId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM OrganizationTelecomPhones 
WHERE OrganizationTelecomID = @OrganizationTelecomId
DELETE FROM OrganizationTelecoms 
WHERE OrganizationTelecomID = @OrganizationTelecomId
COMMIT TRANSACTION