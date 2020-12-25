CREATE PROCEDURE usp_UserMenuTemplateDeletePostCheck (@UserId nvarchar(450), @UserMenuTemplateId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM UserMenuTemplateOptionLanguages WHERE UserMenuTemplateId = @UserMenuTemplateId
DELETE FROM UserMenuTemplateOptions WHERE UserMenuTemplateId = @UserMenuTemplateId

DELETE FROM UserMenuTemplateLanguages WHERE UserMenuTemplateId = @UserMenuTemplateId
DELETE FROM UserMenuTemplates WHERE UserMenuTemplateId = @UserMenuTemplateId

COMMIT TRANSACTION

