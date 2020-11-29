CREATE PROCEDURE usp_UserMenuTemplateDeletePost ( @UserMenuTemplateId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM UserMenuTemplateOptionLanguages WHERE UserMenuTemplateId = @UserMenuTemplateId
DELETE FROM UserMenuTemplateOptions WHERE UserMenuTemplateId = @UserMenuTemplateId

DELETE FROM UserMenuTemplateLanguages WHERE UserMenuTemplateId = @UserMenuTemplateId
DELETE FROM UserMenuTemplates WHERE UserMenuTemplateId = @UserMenuTemplateId

COMMIT TRANSACTION

