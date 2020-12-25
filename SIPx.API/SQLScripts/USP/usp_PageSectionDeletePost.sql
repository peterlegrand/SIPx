CREATE PROCEDURE usp_PageSectionDeletePost ( @UserId nvarchar(450), @PageSectionId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM PageSectionLanguages 
WHERE PageSectionID  = @PageSectionId 

DELETE FROM PageSections 
WHERE PageSectionID = @PageSectionId
COMMIT TRANSACTION