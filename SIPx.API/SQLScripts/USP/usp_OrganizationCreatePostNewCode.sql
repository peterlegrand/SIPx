CREATE PROCEDURE usp_OrganizationCreatePostNewCode (@ParentOrganizationId int, @OrganizationTypeId int) 
AS 
BEGIN
	DECLARE @OrganizationCodePerType bit;
	DECLARE @OrganizationCodeBasedOnHierarchy bit;
	DECLARE @OrganizationTypePrefix nvarchar(25);
	DECLARE @OrganizationTypeSuffix nvarchar(25);
	DECLARE @CodeTypeId int;
	DECLARE @CodeSeparator nchar(1);
	DECLARE @MaxCode int;
	DECLARE @Path nvarchar(100);

	SELECT @OrganizationCodePerType = BoolValue FROM Settings WHERE SettingID = 6;
	SELECT @OrganizationCodeBasedOnHierarchy = BoolValue FROM Settings WHERE SettingID = 10;
	SELECT @CodeSeparator = StringValue FROM Settings WHERE SettingID = 13;

	IF @OrganizationCodePerType = 1
	BEGIN
		SELECT @CodeTypeId = CodeTypeId FROM OrganizationTypes WHERE OrganizationTypeId = @OrganizationTypeId
		SELECT @OrganizationTypePrefix = ISNULL(CodePrefix, '') FROM OrganizationTypes WHERE OrganizationTypeId = @OrganizationTypeId
		SELECT @OrganizationTypeSuffix = ISNULL(CodeSuffix, '') FROM OrganizationTypes WHERE OrganizationTypeId = @OrganizationTypeId
	END
	ELSE
	BEGIN
		SELECT @CodeTypeId = IntValue FROM Settings WHERE SettingId = 14
		SET @OrganizationTypePrefix = ''
		SET @OrganizationTypeSuffix =''
	END

	IF @CodeTypeId = 1
	BEGIN
		SELECT '' 
	END
	ELSE
	BEGIN
		IF @OrganizationCodeBasedOnHierarchy = 1
		BEGIN
			SELECT @MaxCode =MAX(CodeInt) FROM Organizations WHERE ParentOrganizationID = @ParentOrganizationId AND OrganizationTypeID = @OrganizationTypeId;
		
			WITH OrganizationHierarchy (
				OrganizationId
				, Path
				)
			AS
			(
				SELECT Organizations.OrganizationId,
					 CAST(Organizations.Code AS VARCHAR(255)) AS Path
				FROM Organizations 
				WHERE Organizations.ParentOrganizationId IS NULL
	
			   UNION ALL
				SELECT OrganizationNextLevel.OrganizationId,
					CAST(OrganizationBaseLevel.Path + '.' + CAST(OrganizationNextLevel.Code AS VARCHAR(255)) AS VARCHAR(255))
				FROM Organizations OrganizationNextLevel
				JOIN OrganizationHierarchy OrganizationBaseLevel
					ON OrganizationBaseLevel.OrganizationId = OrganizationNextLevel.ParentOrganizationID
			)
			--	Statement using the CTE
				SELECT  
					@Path = Path
				FROM   OrganizationHierarchy
				WHERE OrganizationHierarchy.OrganizationId = @ParentOrganizationId
			SET @Path = TRIM(@Path) + TRIM(@CodeSeparator)
		END
		ELSE
		BEGIN
			SET @Path = ''
			SELECT @MaxCode =MAX(CodeInt) FROM Organizations WHERE OrganizationTypeID = @OrganizationTypeId
		END
		SELECT ISNULL(TRIM(@Path),'') + ISNULL(TRIM(@OrganizationTypePrefix),'') + ISNULL(TRIM(CAST(@MaxCode + 1 as varchar(10))),'') + ISNULL(TRIM(@OrganizationTypeSuffix),'')  
	END
END
