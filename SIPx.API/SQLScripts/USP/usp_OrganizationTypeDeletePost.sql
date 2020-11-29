CREATE PROCEDURE usp_OrganizationTypeDeletePost ( @OrganizationTypeId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM OrganizationTypeLanguages 
WHERE OrganizationTypeID  = @OrganizationTypeId 

DELETE FROM OrganizationTypes 
WHERE OrganizationTypeID = @OrganizationTypeId
COMMIT TRANSACTION