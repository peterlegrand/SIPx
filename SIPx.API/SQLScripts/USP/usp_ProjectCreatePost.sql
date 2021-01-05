CREATE PROCEDURE [dbo].[usp_ProjectCreatePost] (
	@ProjectTypeId int
	, @ParentProjectId int =NULL
	, @StatusId int 
	, @SecurityLevelId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;
IF @ParentProjectId = 0
BEGIN
SET @ParentProjectId = NULL
END

SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO Projects (
	ParentProjectID
	, ProjectTypeID
	, StatusID
	, SecurityLevelId
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ParentProjectID
	, @ProjectTypeID
	, @StatusID
	, @SecurityLevelId
	, @UserId
	, getdate()
	, @UserId
	, getdate())

	DECLARE @NewProjectId int	= scope_identity();

INSERT INTO ProjectLanguages (
	ProjectID
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
	@NewProjectId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserId
	, getdate()
	, @UserId
	, getdate())

	COMMIT TRANSACTION
