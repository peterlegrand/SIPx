	CREATE PROCEDURE [dbo].[usp_ClassificationPageUpdate] (
	@ClassificationPageLanguageID int
	, @ClassificationPageID int
	, @StatusID int
	, @ShowtitleName bit
	, @ShowtitleDescription bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @UserID nvarchar(450)) 
AS 
BEGIN TRANSACTION
UPDATE ClassificationPages SET 
	StatusID = @StatusID
	, ShowtitleName = @ShowtitleName
	, ShowtitleDescription = @ShowtitleDescription
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationPageID = @ClassificationPageID

UPDATE  ClassificationPageLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, TitleName = @TitleName
	, TitleDescription = @TitleDescription
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationPageLanguageID= @ClassificationPageLanguageID

COMMIT TRANSACTION