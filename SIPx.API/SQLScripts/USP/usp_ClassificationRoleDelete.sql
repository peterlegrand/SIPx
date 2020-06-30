CREATE PROCEDURE [dbo].[usp_ClassificationRoleDelete] (
	@ClassificationRoleId int) 
AS 
DELETE FROM ClassificationRoles WHERE @ClassificationRoleId = ClassificationRoleID


