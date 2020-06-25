CREATE PROCEDURE [dbo].[usp_RoleGroupUpdate] (
	@RoleGroupID int 
	, @RoleGroupLanguageID int 
	, @Sequence int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM RoleGroups WHERE RoleGroupID = @RoleGroupID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE RoleGroups SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence
END
ELSE
BEGIN
UPDATE RoleGroups SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE RoleGroups SET 
	Sequence = @Sequence
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE RoleGroupID = @RoleGroupID

UPDATE  RoleGroupLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE RoleGroupLanguageID= @RoleGroupLanguageID
COMMIT TRANSACTION

