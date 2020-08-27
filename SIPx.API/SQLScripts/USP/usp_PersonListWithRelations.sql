CREATE PROCEDURE [dbo].[usp_PersonListWithRelations] 
AS 

SELECT 
	Persons.PersonID
	, FirstName + ' ' + LastName Name
FROM   Persons
WHERE PersonID IN (
	SELECT FromPersonID 
	FROM PersonRelations
	WHERE (ValidFrom >= getdate() OR ValidFrom IS NULL) 
		AND (ValidTill <= getdate() OR ValidTill IS NULL)
		)
	OR PersonID IN (
	SELECT ToPersonID 
	FROM PersonRelations
	WHERE (ValidFrom >= getdate() OR ValidFrom IS NULL) 
		AND (ValidTill <= getdate() OR ValidTill IS NULL)
		)
