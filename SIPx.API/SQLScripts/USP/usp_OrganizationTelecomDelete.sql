CREATE PROCEDURE [dbo].[usp_OrganizationTelecomDelete] (
	@OrganizationTelecomID int) 
AS 

BEGIN TRANSACTION

DELETE FROM  OrganizationTelecoms  WHERE OrganizationTelecomID = @OrganizationTelecomID
DELETE FROM OrganizationTelecomPhones WHERE OrganizationTelecomID = @OrganizationTelecomID
COMMIT TRANSACTION


