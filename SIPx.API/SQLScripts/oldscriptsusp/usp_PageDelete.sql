CREATE PROCEDURE [dbo].[usp_PageDelete] (
	@PageId int) 
AS 
BEGIN TRANSACTION
DELETE FROM PageLanguages WHERE PageId = @PageID
DELETE FROM Pages WHERE PageId = @PageID
COMMIT TRANSACTION

