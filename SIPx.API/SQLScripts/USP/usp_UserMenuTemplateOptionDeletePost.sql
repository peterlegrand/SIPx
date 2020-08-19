CREATE PROCEDURE usp_UserMenuTemplateOptionDeletePost ( @UserMenuTemplateOptionId int)
AS
BEGIN TRANSACTION

DELETE FROM UserMenuTemplateOptionLanguages WHERE UserMenuTemplateOptionId = @UserMenuTemplateOptionId
DELETE FROM UserMenuTemplateOptions WHERE UserMenuTemplateOptionId = @UserMenuTemplateOptionId

COMMIT TRANSACTION

