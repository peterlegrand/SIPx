CREATE PROCEDURE usp_FrontContentRightsUpdateGetOwners (@UserId nvarchar(450), @IsRelationBasedOwnership bit, @IsProjectBasedOwnership bit, @IsOrganizationBasedOwnership bit, @IsFreeOwnership bit)
AS

DECLARE @UserTable TABLE (UserId nvarchar(450), Name nvarchar(max));

IF @IsFreeOwnership =1
BEGIN
INSERT INTO @UserTable (UserId, Name) SELECT UserId, FirstName + ' ' + LastName
FROM Persons WHERE UserID IS NOT NULL AND UserID <> @UserId
END
ELSE
BEGIN

IF @IsRelationBasedOwnership =1
BEGIN
INSERT INTO @UserTable (UserId, Name) SELECT NewOwner.UserId, NewOwner.FirstName + ' ' + NewOwner.LastName
FROM Persons NewOwner
JOIN PersonRelations
	ON NewOwner.PersonID = PersonRelations.FromPersonID
JOIN Persons CurrentOwner
	ON CurrentOwner.PersonID = PersonRelations.ToPersonID
JOIN PersonRelationTypes
	ON PersonRelations.PersonRelationTypeID = PersonRelationTypes.PersonRelationTypeID
WHERE PersonRelationTypes.CanAssignOwnershipToFrom = 1
	AND CurrentOwner.UserID = @UserId

INSERT INTO @UserTable (UserId, Name) SELECT NewOwner.UserId, NewOwner.FirstName + ' ' + NewOwner.LastName Name
FROM Persons NewOwner
JOIN PersonRelations
	ON NewOwner.PersonID = PersonRelations.toPersonID
JOIN Persons CurrentOwner
	ON CurrentOwner.PersonID = PersonRelations.FromPersonID
JOIN PersonRelationTypes
	ON PersonRelations.PersonRelationTypeID = PersonRelationTypes.PersonRelationTypeID
WHERE PersonRelationTypes.CanAssignOwnershipFromTo = 1
	AND CurrentOwner.UserID = @UserId
END

IF @IsOrganizationBasedOwnership = 1
BEGIN

INSERT INTO @UserTable (UserId, Name) SELECT Persons.UserId, FirstName + ' ' + LastName
FROM AspNetUserRoles CurrentOwnerUserRole
JOIN AspNetRoles CurrentOwnerRole 
	ON CurrentOwnerUserRole.RoleId = CurrentOwnerRole.Id
JOIN AspNetRoles NewOwnerRole 
	ON CurrentOwnerRole.OrganizationId = NewOwnerRole.OrganizationId
JOIN AspNetUserRoles NewOwnerUserRole
	ON NewOwnerUserRole.RoleId = NewOwnerRole.Id
JOIN Persons
	ON Persons.UserID =  NewOwnerUserRole.UserId
WHERE CurrentOwnerRole.CanAssignContentOwnership = 1
	AND CurrentOwnerUserRole.UserId = @UserId
	AND NewOwnerRole.CanReceiveContentOwnership = 1
END

IF @IsOrganizationBasedOwnership = 1
BEGIN

INSERT INTO @UserTable (UserId, Name) SELECT Persons.UserId, FirstName + ' ' + LastName
FROM AspNetUserRoles CurrentOwnerUserRole
JOIN AspNetRoles CurrentOwnerRole 
	ON CurrentOwnerUserRole.RoleId = CurrentOwnerRole.Id
JOIN AspNetRoles NewOwnerRole 
	ON CurrentOwnerRole.ProjectId = NewOwnerRole.ProjectId
JOIN AspNetUserRoles NewOwnerUserRole
	ON NewOwnerUserRole.RoleId = NewOwnerRole.Id
JOIN Persons
	ON Persons.UserID =  NewOwnerUserRole.UserId
WHERE CurrentOwnerRole.CanAssignContentOwnership = 1
	AND CurrentOwnerUserRole.UserId = @UserId
	AND NewOwnerRole.CanReceiveContentOwnership = 1
END
END
INSERT INTO @UserTable (UserId, Name) SELECT Persons.UserId, FirstName + ' ' + LastName
FROM Persons WHERE UserID = @UserId

SELECT DISTINCT UserId, Name FROM @UserTable
