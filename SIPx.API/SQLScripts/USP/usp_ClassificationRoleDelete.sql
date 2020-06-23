CREATE PROCEDURE [dbo].[usp_ClassificationRoleDelete] (
	@ClassificationRoleID int) 
AS 
DELETE FROM ClassificationRoles WHERE @ClassificationRoleID = ClassificationRoleID


