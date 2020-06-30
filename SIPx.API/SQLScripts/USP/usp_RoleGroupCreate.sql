CREATE PROCEDURE [dbo].[usp_RoleGroupCreate] (
	@Sequence int 
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE RoleGroups SET Sequence = Sequence + 1 
	WHERE Sequence >= @Sequence

INSERT INTO RoleGroups (
	Sequence
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Sequence
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewRoleGroupId int	= scope_identity();

INSERT INTO RoleGroupLanguages (
	RoleGroupId
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewRoleGroupId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION
