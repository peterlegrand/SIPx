	CREATE PROCEDURE [dbo].[usp_PageUpdate] (
	@PageLanguageID int
	, @PageID int
	, @StatusID int
	, @ShowtitleName bit
	, @ShowtitleDescription bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION
UPDATE Pages SET 
	StatusID = @StatusID
	, ShowtitleName = @ShowtitleName
	, ShowtitleDescription = @ShowtitleDescription
	, ModifierID = @User
	, ModifiedDate = GETDATE()
WHERE PageID = @PageID

UPDATE  PageLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, TitleName = @TitleName
	, TitleDescription = @TitleDescription
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE PageLanguageID= @PageLanguageID

COMMIT TRANSACTION