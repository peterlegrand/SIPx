CREATE PROCEDURE usp_ProcessDeletePost ( @UserId nvarchar(450), @ProcessId int)
AS
DECLARE @MultiID int;

SELECT @MultiID = ProcessMultiID FROM Processes;

IF @MultiID IS NULL
BEGIN
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM ProcessMultis
WHERE ProcessMultiID  = @MultiID

DELETE FROM ProcessFields 
WHERE ProcessID = @ProcessId

DELETE FROM Processes 
WHERE ProcessID = @ProcessId

COMMIT TRANSACTION
END
ELSE
BEGIN
BEGIN TRANSACTION
DELETE FROM ProcessFields 
WHERE ProcessID = @ProcessId

DELETE FROM Processes 
WHERE ProcessID = @ProcessId

COMMIT TRANSACTION
END
