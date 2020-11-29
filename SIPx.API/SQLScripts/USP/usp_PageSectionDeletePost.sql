CREATE PROCEDURE usp_PageSectionDeletePost ( @PageSectionId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM PageSectionLanguages 
WHERE PageSectionID  = @PageSectionId 

DELETE FROM PageSections 
WHERE PageSectionID = @PageSectionId
COMMIT TRANSACTION