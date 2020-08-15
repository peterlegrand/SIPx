CREATE PROCEDURE [dbo].[usp_UserPageUpdatePost] (
	@PageID int
	, @StatusID int
	, @ShowTitleName nvarchar(50)
	, @ShowTitleDescription nvarchar(max)
	, @Name nvarchar(50)
	, @Description nvarchar(Max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @ModifierID nvarchar(450)) 

AS 
BEGIN TRANSACTION


UPDATE Pages SET
	StatusID =  1 
	, ShowTitleName = @ShowTitleName
	, ShowTitleDescription = @ShowTitleDescription 
	, ModifierID = @ModifierID
	, ModifiedDate = Getdate()
WHERE UserID = @ModifierID
	AND PageID = @PageID

	UPDATE PageLanguages SET
	Name = @Name
	, Description = @Description 
	, MenuName = @MenuName 
	, MouseOver = @MouseOver 
	, TitleName = @TitleName 
	, TitleDescription = @TitleDescription 
	, ModifierID = @ModifierID
	, ModifiedDate = Getdate()
WHERE PageID = @PageID



	COMMIT TRANSACTION


