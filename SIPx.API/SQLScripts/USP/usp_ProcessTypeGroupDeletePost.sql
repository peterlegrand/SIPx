CREATE PROCEDURE usp_ProcessTypeGroupDeletePost (@UserId nvarchar(450), @ProcessTypeGroupId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM ProcessTypeGroupLanguages 
WHERE ProcessTypeGroupID  = @ProcessTypeGroupId 

DELETE FROM ProcessTypeGroups 
WHERE ProcessTypeGroupID = @ProcessTypeGroupId
COMMIT TRANSACTION