CREATE PROCEDURE [dbo].[usp_CheckUserRelation](@PersonRelationID int)
AS
SELECT CASE COUNT(*) WHEN 0 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END HasRelation
FROM PersonRelations
WHERE PersonRelations.PersonRelationID = @PersonRelationID


