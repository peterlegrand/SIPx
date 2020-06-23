CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleDelete] (
	@ClassificationValueRoleID int) 
AS 
DELETE FROM ClassificationValueRoles WHERE @ClassificationValueRoleID = ClassificationValueRoleID

