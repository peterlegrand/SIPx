CREATE PROCEDURE [dbo].[usp_ProjectDelete] (
	@ProjectId int)
AS 

BEGIN TRANSACTION
DELETE FROM ProjectLanguages WHERE ProjectId = @ProjectID
DELETE FROM Projects WHERE ProjectId = @ProjectID

COMMIT TRANSACTION
