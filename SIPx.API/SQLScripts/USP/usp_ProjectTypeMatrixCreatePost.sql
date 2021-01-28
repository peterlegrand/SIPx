CREATE PROCEDURE usp_ProjectTypeMatrixCreatePost (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @FromProjectTypeId int
	, @ToProjectTypeId int
	, @ProjectMatrixTypeId int
	, @IsFrom bit
	, @UserId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

INSERT INTO ProjectTypeMatrixes (
	FromProjectTypeId
	, ToProjectTypeId 
	, ProjectMatrixTypeId
	, CreatorID
	, CreatedDate
)
VALUES (
	@FromProjectTypeId
	, @ToProjectTypeId 
	, @ProjectMatrixTypeId
	, @UserId
	, getdate()
)


DECLARE @NewProjectTypeMatrixId int	= scope_identity();

INSERT INTO ProjectTypeMatrixLanguages (
	ProjectTypeMatrixId
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
	@NewProjectTypeMatrixID
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
