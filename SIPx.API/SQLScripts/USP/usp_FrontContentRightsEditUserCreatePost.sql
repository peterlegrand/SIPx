CREATE PROCEDURE usp_FrontContentRightsEditUserCreatePost (@UserId nvarchar(450), @ContentId int, @SelectedUserId nvarchar(450)) 
AS 
INSERT INTO ContentUserEdit (ContentID, UserID, CreatedDate, CreatorID)
VALUES (@ContentId, @SelectedUserId, getdate(), @UserId )