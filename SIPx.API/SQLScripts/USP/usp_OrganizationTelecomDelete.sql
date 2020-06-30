CREATE PROCEDURE [dbo].[usp_OrganizationTelecomDelete] (
	@OrganizationTelecomId int) 
AS 

BEGIN TRANSACTION

DELETE FROM  OrganizationTelecoms  WHERE OrganizationTelecomId = @OrganizationTelecomID
DELETE FROM OrganizationTelecomPhones WHERE OrganizationTelecomId = @OrganizationTelecomID
COMMIT TRANSACTION


