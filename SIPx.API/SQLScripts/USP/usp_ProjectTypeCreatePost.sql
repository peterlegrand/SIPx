CREATE PROCEDURE [dbo].[usp_ProjectTypeCreatePost] (
	@LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @Color char(9)
	, @IconID int
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO ProjectTypes (
	Color 
	, IconID 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Color 
	, @IconID 
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProjectTypeId int	= scope_identity();

INSERT INTO ProjectTypeLanguages (
	ProjectTypeID
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
	@NewProjectTypeID
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
