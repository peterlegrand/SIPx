CREATE PROCEDURE usp_UserPageUpdateGet( @UserId nvarchar(450),@PageID int)
AS
SELECT Pages.PageID
	, PageLanguageID
	, StatusID
	, ShowTitleName
	, ShowTitleDescription
	, Name
	, Description
	, MenuName
	, MouseOver
	, TitleName
	, TitleDescription
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Creator.PersonID CreatorID
	, Pages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Modifier.PersonID ModifierID
	, Pages.ModifiedDate

FROM Pages 
JOIN PageLanguages
	ON Pages.PageID = PageLanguages.PageID
JOIN Persons Creator
	ON Creator.UserId = Pages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Pages.ModifierID
WHERE Pages.PageID = @PageID
	AND Pages.UserID = @UserId