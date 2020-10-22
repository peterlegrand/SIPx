CREATE PROCEDURE usp_PageSectionConditionDeletePost ( @PageSectionConditionId int)
AS
BEGIN TRANSACTION
DELETE FROM PageSectionConditionLanguages 
WHERE PageSectionConditionID  = @PageSectionConditionId 

DELETE FROM PageSectionConditions 
WHERE PageSectionConditionID = @PageSectionConditionId
COMMIT TRANSACTION