CREATE PROCEDURE [dbo].[usp_ProjectCreatePost] (
	@ProjectTypeId int
	, @ParentProjectId int =NULL
	, @StatusId int 
	, @SecurityLevelId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CreatorId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorId
	AND UserPreferences.PreferenceTypeId = 1 ;
IF @ParentProjectId = 0
BEGIN
SET @ParentProjectId = NULL
END

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
	, @CreatorId
	, getdate()
	, @CreatorId
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
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())

	COMMIT TRANSACTION
