CREATE PROCEDURE [dbo].[usp_RoleGroupDelete] (
	@RoleGroupID int) 
AS 
BEGIN TRANSACTION
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM RoleGroups WHERE RoleGroupID = @RoleGroupID;
UPDATE RoleGroups SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence 

DELETE FROM RoleGroupLanguages WHERE RoleGroupID = @RoleGroupID
DELETE FROM RoleGroups WHERE RoleGroupID = @RoleGroupID
COMMIT TRANSACTION


