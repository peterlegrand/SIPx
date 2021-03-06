	CREATE PROCEDURE [dbo].[usp_PageUpdate] (
	@PageLanguageId int
	, @PageId int
	, @StatusId int
	, @ShowtitleName bit
	, @ShowtitleDescription bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION
UPDATE Pages SET 
	StatusId = @StatusID
	, ShowtitleName = @ShowtitleName
	, ShowtitleDescription = @ShowtitleDescription
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE PageId = @PageID

UPDATE  PageLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, TitleName = @TitleName
	, TitleDescription = @TitleDescription
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE PageLanguageID= @PageLanguageID

COMMIT TRANSACTION