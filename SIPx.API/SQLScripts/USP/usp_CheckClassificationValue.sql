CREATE PROCEDURE usp_CheckClassificationValue(@ClassificationValueId int)
AS
SELECT CASE COUNT(*) WHEN 0 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END HasClassificationValue FROM ClassificationValues