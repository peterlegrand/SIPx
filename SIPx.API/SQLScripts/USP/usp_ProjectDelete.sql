CREATE PROCEDURE [dbo].[usp_ProjectDelete] (
	@ProjectID int)
AS 

BEGIN TRANSACTION
DELETE FROM ProjectLanguages WHERE ProjectID = @ProjectID
DELETE FROM Projects WHERE ProjectID = @ProjectID

COMMIT TRANSACTION
