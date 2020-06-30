CREATE PROCEDURE [dbo].[usp_OrganizationDelete] (
	@OrganizationId int)
AS 

BEGIN TRANSACTION
DELETE FROM OrganizationAddresses WHERE OrganizationId = @OrganizationID
DELETE FROM OrganizationLanguages WHERE OrganizationId = @OrganizationID
DELETE FROM Organizations WHERE OrganizationId = @OrganizationID

COMMIT TRANSACTION
