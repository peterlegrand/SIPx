CREATE PROCEDURE usp_PageSectionContentConditionDeletePost ( @UserId nvarchar(450), @PageSectionContentConditionId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM PageSectionContentConditionLanguages 
WHERE PageSectionContentConditionID  = @PageSectionContentConditionId 

DELETE FROM PageSectionContentConditions 
WHERE PageSectionContentConditionID = @PageSectionContentConditionId
COMMIT TRANSACTION