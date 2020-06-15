CREATE PROCEDURE usp_CheckOrganization(@OrganizationID int)
AS
SELECT CASE COUNT(*) WHEN 0 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END HasOrganization FROM Organizations