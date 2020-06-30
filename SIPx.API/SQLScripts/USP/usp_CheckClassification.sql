CREATE PROCEDURE usp_CheckClassification(@ClassificationId int)
AS
SELECT CASE COUNT(*) WHEN 0 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END HasClassification FROM Classifications