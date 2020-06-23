CREATE PROCEDURE [dbo].[usp_OrganizationDelete] (
	@OrganizationID int)
AS 

BEGIN TRANSACTION
DELETE FROM OrganizationAddresses WHERE OrganizationID = @OrganizationID
DELETE FROM OrganizationLanguages WHERE OrganizationID = @OrganizationID
DELETE FROM Organizations WHERE OrganizationID = @OrganizationID

COMMIT TRANSACTION
