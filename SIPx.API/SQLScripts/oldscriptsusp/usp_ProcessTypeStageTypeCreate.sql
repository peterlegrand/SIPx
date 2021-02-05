CREATE PROCEDURE [dbo].[usp_ProcessTypeStageTypeCreate] (
	@LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO ProcessTypeStageTypes (
	CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTypeStageTypeId int	= scope_identity();

INSERT INTO ProcessTypeStageTypeLanguages (
	ProcessTypeStageTypeID
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
	@NewProcessTypeStageTypeID
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
