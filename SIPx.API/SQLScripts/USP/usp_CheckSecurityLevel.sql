CREATE PROCEDURE [dbo].[usp_CheckSecurityLevel](@SecurityLevelID int)
AS
SELECT CASE COUNT(*) WHEN 0 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END HasSecurityLevel FROM SecurityLevels WHERE SecurityLevels.SecurityLevelID = @SecurityLevelID



