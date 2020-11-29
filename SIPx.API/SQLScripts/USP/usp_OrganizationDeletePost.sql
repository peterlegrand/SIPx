CREATE PROCEDURE usp_OrganizationDeletePost ( @OrganizationId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM OrganizationLanguages 
WHERE OrganizationID  = @OrganizationId AND OrganizationID NOT IN (SELECT ParentOrganizationID FROM Organizations)

DELETE FROM Organizations 
WHERE OrganizationID = @OrganizationId AND OrganizationID NOT IN (SELECT ParentOrganizationID FROM Organizations)
COMMIT TRANSACTION