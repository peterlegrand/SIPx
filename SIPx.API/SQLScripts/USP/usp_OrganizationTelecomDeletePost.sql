CREATE PROCEDURE usp_OrganizationTelecomDeletePost ( @OrganizationTelecomId int)
AS
DELETE FROM OrganizationTelecoms 
WHERE OrganizationTelecomID = @OrganizationTelecomId
