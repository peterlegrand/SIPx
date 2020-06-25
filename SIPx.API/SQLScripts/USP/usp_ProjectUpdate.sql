CREATE PROCEDURE [dbo].[usp_ProjectUpdate] (
	@ProjectID int
	, @ProjectLanguageID int
	, @ParentProjectID int
	, @StatusID int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 

BEGIN TRANSACTION
UPDATE Projects SET
	ParentProjectID = @ParentProjectID
	, StatusID = @StatusID
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE 
	ProjectID = @ProjectID

UPDATE ProjectLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ProjectLanguageID = @ProjectLanguageID

COMMIT TRANSACTION
