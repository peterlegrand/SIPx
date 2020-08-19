CREATE PROCEDURE usp_OrganizationDeletePost ( @OrganizationId int)
AS
BEGIN TRANSACTION
DELETE FROM OrganizationLanguages 
WHERE OrganizationID  = @OrganizationId 

DELETE FROM Organizations 
WHERE OrganizationID = @OrganizationId
COMMIT TRANSACTION