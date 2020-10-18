CREATE PROCEDURE [dbo].[usp_RoleGroupUpdatePost] (
	@RoleGroupId int 
	, @Sequence int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM RoleGroups WHERE RoleGroupId = @RoleGroupID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE RoleGroups SET Sequence = Sequence + 1 WHERE Sequence >= @Sequence AND Sequence < @OldSequence
END
ELSE
BEGIN
UPDATE RoleGroups SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE RoleGroups SET 
	Sequence = @Sequence
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE RoleGroupId = @RoleGroupID

UPDATE  RoleGroupLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE RoleGroupId= @RoleGroupID
	AND LanguageID = @LanguageID
COMMIT TRANSACTION

