CREATE PROCEDURE [dbo].[usp_RoleGroupDelete] (
	@RoleGroupId int) 
AS 
BEGIN TRANSACTION
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM RoleGroups WHERE RoleGroupId = @RoleGroupID;
UPDATE RoleGroups SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence 

DELETE FROM RoleGroupLanguages WHERE RoleGroupId = @RoleGroupID
DELETE FROM RoleGroups WHERE RoleGroupId = @RoleGroupID
COMMIT TRANSACTION


