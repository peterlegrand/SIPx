CREATE PROCEDURE usp_FrontContentRightsUpdateGetEditUsers (@UserId nvarchar(450), @ContentId int)
AS

DECLARE @IsRelationBasedEditSelectable bit, @IsProjectBasedEditSelectable bit, @IsOrganizationBasedEditSelectable bit, @IsFreeEditSelectable bit;
SELECT @IsRelationBasedEditSelectable = IsRelationBasedEditSelectable , @IsProjectBasedEditSelectable = IsProjectBasedEditSelectable , @IsOrganizationBasedEditSelectable = IsOrganizationBasedEditSelectable , @IsFreeEditSelectable = IsFreeEditSelectable
FROM ContentTypes JOIN Contents ON ContentTypes.ContentTypeID = Contents.ContentTypeID WHERE ContentId = @ContentId

DECLARE @UserTable TABLE (UserId nvarchar(450), Name nvarchar(max));

IF @IsFreeEditSelectable =1
BEGIN
INSERT INTO @UserTable (UserId, Name) 
SELECT UserId, FirstName + ' ' + LastName
FROM Persons 
WHERE UserID IS NOT NULL 
	AND UserID <> @UserId
	AND UserID NOT IN (SELECT UserId FROM ContentUserEdit WHERE ContentID = @ContentId)

END
ELSE
BEGIN

IF @IsRelationBasedEditSelectable =1
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
	AND NewOwner.UserID NOT IN (SELECT UserId FROM ContentUserEdit WHERE ContentID = @ContentId)

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
	AND NewOwner.UserID NOT IN (SELECT UserId FROM ContentUserEdit WHERE ContentID = @ContentId)
END

IF @IsOrganizationBasedEditSelectable = 1
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
	AND Persons.UserID NOT IN (SELECT UserId FROM ContentUserEdit WHERE ContentID = @ContentId)
END

IF @IsOrganizationBasedEditSelectable = 1
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
	AND Persons.UserID NOT IN (SELECT UserId FROM ContentUserEdit WHERE ContentID = @ContentId)
END
END

SELECT DISTINCT UserId, Name FROM @UserTable
	WHERE UserID NOT IN (SELECT UserId FROM ContentUserEdit WHERE ContentID = @ContentId)
		AND UserId <> @UserId