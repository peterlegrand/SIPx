CREATE PROCEDURE usp_UserPageSectionDeletePost (@UserId nvarchar(450), @PageSectionId int)
AS
BEGIN TRANSACTION
DELETE FROM PageSectionLanguages 
WHERE PageSectionID = @PageSectionID 
	AND PageID IN (SELECT PageId FROM Pages WHERE UserID = @UserId)

DELETE FROM PageSections 
WHERE PageSectionID = @PageSectionID 
	AND PageID IN (SELECT PageId FROM Pages WHERE UserID = @UserId)

COMMIT TRANSACTION

