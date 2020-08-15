CREATE PROCEDURE usp_UserPageDeletePost (@UserId nvarchar(450), @PageId int)
AS
BEGIN TRANSACTION
DELETE FROM PageSectionLanguages WHERE PageID IN (SELECT PageId FROM Pages WHERE PageID = @PageId AND UserID = @UserId)
DELETE FROM PageSections WHERE PageID IN (SELECT PageId FROM Pages WHERE PageID = @PageId AND UserID = @UserId)
DELETE FROM PageLanguages WHERE PageID IN (SELECT PageId FROM Pages WHERE PageID = @PageId AND UserID = @UserId)
DELETE FROM Pages WHERE UserID = @UserId AND PageID = @PageId
COMMIT TRANSACTION