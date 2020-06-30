CREATE PROCEDURE [dbo].[usp_ProjectUpdate] (
	@ProjectId int
	, @ProjectLanguageId int
	, @ParentProjectId int
	, @StatusId int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

BEGIN TRANSACTION
UPDATE Projects SET
	ParentProjectId = @ParentProjectID
	, StatusId = @StatusID
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE 
	ProjectId = @ProjectID

UPDATE ProjectLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProjectLanguageId = @ProjectLanguageID

COMMIT TRANSACTION
