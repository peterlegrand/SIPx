CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleDelete] (
	@ClassificationValueRoleId int) 
AS 
DELETE FROM ClassificationValueRoles WHERE @ClassificationValueRoleId = ClassificationValueRoleID

