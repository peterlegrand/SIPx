CREATE PROCEDURE usp_ProjectTypeMatrixUpdatePost (
	@ProjectTypeMatrixId int
	, @FromProjectTypeId int
	, @ToProjectTypeId int
	, @ProjectMatrixTypeId int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @IsFrom bit
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @IsFrom = 1
BEGIN
UPDATE ProjectTypeMatrixes SET
	ToProjectTypeID = @ToProjectTypeId
	, ProjectMatrixTypeId = @ProjectMatrixTypeId
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE 
	ProjectTypeMatrixId = @ProjectTypeMatrixId
END
ELSE
BEGIN
UPDATE ProjectTypeMatrixes SET
	FromProjectTypeID = @FromProjectTypeId
	, ProjectMatrixTypeId = @ProjectMatrixTypeId
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE 
	ProjectTypeMatrixId = @ProjectTypeMatrixId
END
UPDATE ProjectTypeMatrixLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProjectTypeMatrixId = @ProjectTypeMatrixID
	AND LanguageID = @LanguageId
COMMIT TRANSACTION
