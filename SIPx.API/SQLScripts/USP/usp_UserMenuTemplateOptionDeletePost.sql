CREATE PROCEDURE usp_UserMenuTemplateOptionDeletePost (@UserId nvarchar(450),  @UserMenuTemplateOptionId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM UserMenuTemplateOptionLanguages WHERE UserMenuTemplateOptionId = @UserMenuTemplateOptionId
DELETE FROM UserMenuTemplateOptions WHERE UserMenuTemplateOptionId = @UserMenuTemplateOptionId

COMMIT TRANSACTION

