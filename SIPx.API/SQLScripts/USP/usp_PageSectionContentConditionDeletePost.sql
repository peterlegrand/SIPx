CREATE PROCEDURE usp_PageSectionContentConditionDeletePost ( @PageSectionContentConditionId int)
AS
BEGIN TRANSACTION
DELETE FROM PageSectionContentConditionLanguages 
WHERE PageSectionContentConditionID  = @PageSectionContentConditionId 

DELETE FROM PageSectionContentConditions 
WHERE PageSectionContentConditionID = @PageSectionContentConditionId
COMMIT TRANSACTION