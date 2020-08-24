CREATE PROCEDURE usp_SubProjectsToJason(@ProjectId INT, @IsRoot INT, @UserId nvarchar(450))
AS
SELECT dbo.fn_SubProjectsToJason(@ProjectId, @IsRoot, @UserId) as x

