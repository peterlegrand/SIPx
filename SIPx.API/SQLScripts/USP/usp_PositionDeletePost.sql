CREATE PROCEDURE usp_PositionDeletePost (@UserId nvarchar(450), @PositionId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM PositionLanguages 
WHERE PositionID  = @PositionId 

DELETE FROM Positions 
WHERE PositionID = @PositionId
COMMIT TRANSACTION
