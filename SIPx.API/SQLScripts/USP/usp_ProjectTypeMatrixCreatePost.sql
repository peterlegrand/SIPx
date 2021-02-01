CREATE PROCEDURE usp_ProjectTypeMatrixCreatePost (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @From1To2 int
	, @FromProjectTypeId int
	, @ToProjectTypeId int
	, @ProjectMatrixTypeId int
	, @UserId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;
IF @From1To2 = 1
BEGIN
INSERT INTO ProjectTypeMatrixes (
	FromProjectTypeId
	, ToProjectTypeId 
	, ProjectMatrixTypeId
	, CreatorID
	, CreatedDate
	, ModifierId
	, ModifiedDate
)
VALUES (
	@FromProjectTypeId
	, @ToProjectTypeId 
	, @ProjectMatrixTypeId
	, @UserId
	, getdate()
	, @UserId
	, getdate()
)
END
ELSE
BEGIN
INSERT INTO ProjectTypeMatrixes (
	FromProjectTypeId
	, ToProjectTypeId 
	, ProjectMatrixTypeId
	, CreatorID
	, CreatedDate
	, ModifierId
	, ModifiedDate
)
VALUES (
	@ToProjectTypeId 
	, @FromProjectTypeId
	, @ProjectMatrixTypeId
	, @UserId
	, getdate()
	, @UserId
	, getdate()
)
END

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
